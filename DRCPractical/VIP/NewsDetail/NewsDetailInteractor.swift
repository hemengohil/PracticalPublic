//
//  NewsDetailInteractor.swift
//  DRCPractical
//
//  Created by on 09/03/22.
//


import UIKit

protocol NewsDetailInteractorProtocol {
    func callSomething()
}

protocol NewsDetailDataStore {
    //{ get set }
}

class NewsDetailInteractor: NewsDetailInteractorProtocol, NewsDetailDataStore {

    // MARK: Objects & Variables
    var presenterNewsDetail: NewsDetailPresentationProtocol?
    
    // MARK: Call something
    func callSomething() {
        
    }
}
