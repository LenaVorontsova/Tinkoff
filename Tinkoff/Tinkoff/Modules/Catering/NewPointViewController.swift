//
//  NewPointViewController.swift
//  Tinkoff
//
//  Created by Lena Vorontsova on 27.11.2022.
//

import Foundation
import UIKit
import SnapKit

final class NewPointViewController: UIViewController {
    private lazy var latTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Введите широту (например, 56.871414)"
        return textField
    }()
    private lazy var lngTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Введите долготу (например, 56.871414)"
        return textField
    }()
    private lazy var cityNameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Введите название города"
        return textField
    }()
    private lazy var titleTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Введите заголовок"
        return textField
    }()
    private lazy var textTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Введите описание"
        return textField
    }()
    private lazy var cashBackTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Есть ли кэшбэк (Да или Нет)"
        return textField
    }()
    private lazy var mapPointTypeTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Введите тип точки"
        return textField
    }()
    private lazy var stack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 20
        [
            self.latTextField,
            self.lngTextField,
            self.cityNameTextField,
            self.titleTextField,
            self.textTextField,
            self.cashBackTextField,
            self.mapPointTypeTextField
        ].forEach { stack.addArrangedSubview($0) }
        return stack
    }()
    private lazy var saveButton: UIButton = {
        let button = UIButton()
        button.setTitle("Cохранить", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .green
        button.layer.cornerRadius = 10
        return button
    }()
    private var presenter: CateringPresenting
    
    init(presenter: CateringPresenting) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError(R.string.cells.fatalError())
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        saveButton.addTarget(self, action: #selector(saveNewPoint), for: .touchUpInside)
        view.backgroundColor = .white
        configureConstraints()
        self.title = "Добавление новой точки"
    }
    
    @objc
    func saveNewPoint() {
        var city = CityInstance(id: nil, name: cityNameTextField.text)
        var pointType = MapPointType(id: nil, mapPointType: mapPointTypeTextField.text)
        var cashBack = false
        if cashBackTextField.text == "Да" || cashBackTextField.text == "да" {
            cashBack = true
        }
        let curDate = String(Date().description(with: .autoupdatingCurrent))
        var newPoint = MapElemenet(id: nil,
                                         lat: latTextField.text,
                                         lng: lngTextField.text,
                                         cityInstance: city,
                                         title: titleTextField.text,
                                         text: textTextField.text,
                                         photoPath: nil,
                                         likes: nil,
                                         disLikes: nil,
                                         tinkoffCashBack: cashBack,
                                         comments: nil,
                                         dateOfCreation: curDate,
                                         mapPointType: pointType)
        presenter.createNewPoint(point: newPoint)
        self.dismiss(animated: true)
    }
    
    private func configureConstraints() {
        view.addSubview(stack)
        view.addSubview(saveButton)
        stack.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(ConstantsMap.topTF)
            $0.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(ConstantsMap.offsetTF)
            $0.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).offset(-ConstantsMap.offsetTF)
            $0.bottom.equalTo(saveButton.snp.top).offset(-ConstantsMap.offsetTF)
        }
        saveButton.snp.makeConstraints {
            $0.height.equalTo(ConstantsMap.sizeButton)
            $0.top.equalTo(stack.snp.bottom).offset(ConstantsMap.offsetTF)
            $0.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(ConstantsMap.sizeButton)
            $0.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).offset(-ConstantsMap.sizeButton)
        }
    }
}
