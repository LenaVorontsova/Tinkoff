//
//  DataService.swift
//  Tinkoff
//
//  Created by Lena Vorontsova on 24.10.2022.
//

import Foundation
import Alamofire
import Rswift
import CoreData

protocol IDataService {
    var mapPoints: [Map] { get set }
    func loadData()
    func showAlert(error: Error)
    func saveToCoreDataNews(newsArray: NewsNetwork)
    func saveToCoreDataMapPoints(newArray: MapNetwork)
    func fetchNewsFromCoreData() -> [News]
    func fetchMapPointsCoreData() -> [Map]
    func fetchMapPoints(newArray: MapNetwork)
    func deleteAllData(_ entity: String)
}

final class DataService: IDataService {
    weak var controller: UIViewController?
    private var network: NetworkService
    private let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
    var mapPoints: [Map] = []
    
    init(network: NetworkService) {
        self.network = network
    }
    
    func showAlert(error: Error) {
        var topWindow: UIWindow? = UIWindow(frame: UIScreen.main.bounds)
        topWindow?.rootViewController = UIViewController()
        topWindow?.windowLevel = UIWindow.Level.alert + 1
        let alert = UIAlertController(title: R.string.alertMessages.errorTitle(),
                                      message: error.localizedDescription,
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: R.string.alertMessages.okTitle(),
                                      style: .cancel) { _ in
            topWindow?.isHidden = true
            topWindow = nil
        })
        topWindow?.makeKeyAndVisible()
        topWindow?.rootViewController?.present(alert, animated: false, completion: nil)
    }
    
    func loadData() {
        let infoGroup = DispatchGroup()
        let queue1 = DispatchQueue.global(qos: .utility)
        let queue2 = DispatchQueue.global(qos: .utility)
        queue1.async(group: infoGroup) {
            infoGroup.enter()
            self.network.getInfoNews(endPoint: EndPoints.Posts.rawValue) { [weak self] result in
                switch result {
                case .success(let serverData):
                    self?.saveToCoreDataNews(newsArray: serverData)
                    infoGroup.leave()
                case .failure(let error):
                    infoGroup.leave()
                    self?.showAlert(error: error)
                    print(error)
                }
            }
        }
        queue2.async(group: infoGroup) {
            infoGroup.enter()
            self.network.getInfoMapPoints(endPoint: EndPoints.MapPoints.rawValue) { [weak self] result in
                switch result {
                case .success(let serverData):
                    self?.fetchMapPoints(newArray: serverData)
                    // self?.saveToCoreDataMapPoints(newArray: serverData)
                    infoGroup.leave()
                case .failure(let error):
                    infoGroup.leave()
                    self?.showAlert(error: error)
                    print(error)
                }
            }
        }
    }
    
    func fetchMapPoints(newArray: MapNetwork) {
        for element in newArray {
            var map = Map(lat: nil, lng: nil, title: nil, text: nil, photoPath: nil)
            map.lat = element.lat
            map.lng = element.lng
            map.title = element.title
            map.text = element.text
            map.photoPath = R.image.tinkoffIcon()
//            let newUrl = network.baseURL + (element.photoPath ?? "")
//                DispatchQueue.global().async {
//                    if let url = URL(string: newUrl) {
//                        guard let data = try? Data(contentsOf: url) else { return }
//                        map.photoPath = UIImage(data: data)
//                    } else {
//                        map.photoPath = R.image.tinkoffIcon()
//                    }
//                }
            mapPoints.append(map)
        }
    }
    
    func saveToCoreDataNews(newsArray: NewsNetwork) {
        deleteAllData(R.string.services.newsData())
        let entityNews = NSEntityDescription.entity(forEntityName: R.string.services.newsData(),
                                                    in: self.context!)!
        for element in newsArray {
            let news = NSManagedObject(entity: entityNews, insertInto: self.context)
            news.setValue(element.title, forKey: R.string.services.title())
            news.setValue(element.text, forKey: R.string.services.text())
            news.setValue(element.dateOfCreation, forKey: "dateOfCreation")
            // let newUrl: String? = network.baseURL + (element.photoPath ?? "")
            let newUrl = network.baseURL + (element.photoPath ?? "")
            guard let url = URL(string: newUrl) else { return }
            DispatchQueue.global().async {
                guard let data = try? Data(contentsOf: url) else { return }
                news.setValue(data, forKey: R.string.services.photoPath())
            }
            do {
                try self.context!.save()
            } catch let error as NSError {
                print("Could not save. \(error), \(error.userInfo)")
            }
        }
    }
    
    func saveToCoreDataMapPoints(newArray: MapNetwork) {
        deleteAllData(R.string.services.mapData())
        let entityMap = NSEntityDescription.entity(forEntityName: R.string.services.mapData(),
                                                   in: self.context!)!
        for element in newArray {
            let map = NSManagedObject(entity: entityMap, insertInto: self.context)
            map.setValue(element.lat, forKey: R.string.services.lat())
            map.setValue(element.lng, forKey: R.string.services.lng())
            map.setValue(element.title, forKey: R.string.services.title())
            map.setValue(element.text, forKey: R.string.services.text())
            let newUrl = network.baseURL + (element.photoPath ?? "")
            guard let url = URL(string: newUrl) else { return }
            DispatchQueue.global().async {
                guard let data = try? Data(contentsOf: url) else { return }
                map.setValue(data, forKey: R.string.services.photoPath())
            }
            do {
                try self.context!.save()
            } catch let error as NSError {
                print("Could not save. \(error), \(error.userInfo)")
            }
        }
    }
    
    func fetchNewsFromCoreData() -> [News] {
        var arr: [News] = []
        do {
            let newArr = try context!.fetch(NewsData.fetchRequest())
            for element in newArr {
                var news = News(photoPath: nil, newsTitle: nil, newsText: nil, newsDate: nil)
                news.newsTitle = element.title
                news.newsText = element.text
                news.newsDate = element.dateOfCreation
                if let data = element.photoPath {
                    news.photoPath = UIImage(data: data)
                }
                arr.append(news)
            }
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        return arr
    }
    
    func fetchMapPointsCoreData() -> [Map] {
        var arr: [Map] = []
        do {
            let newArr = try context!.fetch(MapData.fetchRequest())
            for element in newArr {
                var map = Map(lat: nil, lng: nil, title: nil, text: nil, photoPath: nil)
                map.lat = element.lat
                map.lng = element.lng
                map.title = element.title
                map.text = element.text
                if let data = element.photoPath {
                    map.photoPath = UIImage(data: data)
                }
                arr.append(map)
            }
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        return arr
    }
    
    func deleteAllData(_ entity: String) {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entity)
        let batchDeleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        do {
            try context!.execute(batchDeleteRequest)
        } catch {
            print(error)
        }
    }
}
