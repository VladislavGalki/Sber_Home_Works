//
//  NetworkService.swift
//  Puzzles
//
//  Created by Leonid Serebryanyy on 18.11.2019.
//  Copyright © 2019 Leonid Serebryanyy. All rights reserved.
//

import Foundation
import UIKit


class NetworkService {
    
    let session: URLSession
    
    private var queue = DispatchQueue(label: "com.sber.puzzless", qos: .default, attributes: .concurrent)
    
    
    init() {
        session = URLSession(configuration: .default)
    }
    
    
    // MARK:- Первое задание
    
    ///  Вот здесь должны загружаться 4 картинки и совмещаться в одну.
    ///  Для выполнения этой задачи вам можно изменять только этот метод.
    ///  Метод, соединяющий картинки в одну, уже написан (вызывается в конце).
    ///  Ответ передайте в completion.
    ///  Помните, что надо сделать так, чтобы метод работал как можно быстрее.
    public func loadPuzzle(completion: @escaping (Result<UIImage, Error>) -> ()) {
        let group = DispatchGroup()
        // это адреса картинок. они работающие, всё ок!
        let firstURL = URL(string: "https://storage.googleapis.com/ios_school/tu.png")!
        let secondURL = URL(string: "https://storage.googleapis.com/ios_school/pik.png")!
        let thirdURL = URL(string: "https://storage.googleapis.com/ios_school/cm.jpg")!
        let fourthURL = URL(string: "https://storage.googleapis.com/ios_school/apple.jpeg")!
        let urls = [firstURL, secondURL, thirdURL, fourthURL]
        
        // в этот массив запишите итоговые картинки
        var downloadImage = [UIImage]()
        var results = [UIImage]()
        
        for task in urls {
            group.enter()
            let data = try? Data(contentsOf: task)
            if let data = UIImage(data: data!) {
                downloadImage.append(data)
            }
            group.leave()
        }
        
        // Соедините картинки в одну с помощью
        group.notify(queue: DispatchQueue.main){
            results.append(contentsOf: downloadImage)
            if let merged = ImagesServices.image(byCombining: results) {
                completion(.success(merged))
            }
        }
    }
    
    
    // MARK:- Второе задание
    
    
    ///  Здесь задание такое:
    ///  У вас есть keyURL, который приведёт вас к ссылке на клад.
    ///  Верните картинку с этим кладом в completion
    public func loadQuiz(completion: @escaping(Result<UIImage, Error>) -> ()) {
        let group = DispatchGroup()
        let keyURL = URL(string: "https://sberschool-c264c.firebaseio.com/enigma.json?avvrdd_token=AIzaSyDqbtGbRFETl2NjHgdxeOGj6UyS3bDiO-Y")!
        
        var secretUrl: String?
        var downloadImage = UIImage()
        
        group.enter()
        queue.async {
            self.session.dataTask(with: keyURL) { data, response, error in
                guard let data = data else { return }
                secretUrl = String(data: data, encoding: .utf8)?.replacingOccurrences(of: "\"", with: "")
                group.leave()
            }.resume()
        }

        group.wait()
        
        group.enter()
        queue.async {
            guard let data = secretUrl, let url = URL(string: data) else { return }
            let downloadData = try? Data(contentsOf: url)
            if let image = UIImage(data: downloadData!) {
                downloadImage = image
            }
            group.leave()
        }

        // вот так передается результат
        group.notify(queue: DispatchQueue.main){
            completion(.success(downloadImage))
        }
    }
    
}
