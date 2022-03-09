//
//  HomeInteractor.swift
//  DRCPractical
//
//  Created by on 09/03/22.
//


import UIKit
import Alamofire

protocol HomeInteractorProtocol {
    func callSomething()
    func callAPINewsList()
}

let URL_BASE = "https://newsapi.org/v2/top-headlines"
let KEY_API = "23baa29753f24ad08d49d43c457d7026"

protocol HomeDataStore {
    //{ get set }
}

class HomeInteractor: HomeInteractorProtocol, HomeDataStore {

    // MARK: Objects & Variables
    var presenterHome: HomePresentationProtocol?
    
    // MARK: Call something
    func callSomething() {
        
    }
    func callAPINewsList(){
        presenterHome?.responseNewsList()

        let urlToFetchData = "\(URL_BASE)?sources=google-news&apiKey=\(KEY_API)"
        _ = AF.request(urlToFetchData).response{ response in

            switch response.result {
            case .success(let data):
//                let response = data as! NSDictionary
                do{
                let json = try JSONSerialization.jsonObject(with: data!, options: []) as? [String : Any]
//                    print(json?["articles"])
                    
                    if let arrArticales = json?["articles"] as? NSArray{
                        print("All articales loaded : \(arrArticales.count)")
                    }
                    
                    self.presenterHome?.responseNewsList()

                }catch{ print("erroMsg") }

                break
            case .failure(_):
                break
            }

        }

    }
}


func convertToDictionary(text: String) -> [String: Any]? {
    if let data = text.data(using: .utf8) {
        do {
            return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
        } catch {
            print(error.localizedDescription)
        }
    }
    return nil
}

//struct Articale: Decodable {
//  let title: String
//
//  enum CodingKeys: String, CodingKey {
//    case title
//  }
//}
//
//struct Articales: Decodable {
//  let count: Int
//  let all: [Articale]
//
//    init(count: Int, all: [Articale]) {
//        self.count = count
//        self.all = all
//    }
//
//  enum CodingKeys: String, CodingKey {
//    case totalResults
//    case all = "articales"
//  }
//}
