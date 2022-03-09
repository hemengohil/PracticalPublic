//
//  NewsDetailPresenter.swift
//  DRCPractical
//
//  Created on 09/03/22.
//


import UIKit

protocol NewsDetailPresentationProtocol {
    func callSomething()
}

class NewsDetailPresenter: NewsDetailPresentationProtocol {
    
    // MARK: Objects & Variables
    weak var viewControllerNewsDetail: NewsDetailProtocol?
    var interactorNewsDetail: NewsDetailInteractorProtocol?
    
    // MARK: Present something
    func callSomething() {
        
    }
}
