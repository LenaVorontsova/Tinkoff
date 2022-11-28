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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        configureConstraints()
        self.title = "Добавление новой точки"
    }
    
    private func configureConstraints() {
        view.addSubview(stack)
        stack.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(ConstantsMap.topTF)
            $0.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(ConstantsMap.offsetTF)
            $0.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).offset(-ConstantsMap.offsetTF)
        }
    }
}
