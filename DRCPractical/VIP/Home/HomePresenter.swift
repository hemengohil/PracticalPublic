//
//  HomePresenter.swift
//  DRCPractical
//
//  Created on 09/03/22.
//


import UIKit

protocol HomePresentationProtocol {
    func callSomething()
}

class HomePresenter: HomePresentationProtocol {
    
    // MARK: Objects & Variables
    weak var viewControllerHome: HomeProtocol?
    var interactorHome: HomeInteractorProtocol?
    
    // MARK: Present something
    func callSomething() {
        
    }
}
