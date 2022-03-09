//
//  HomeInteractor.swift
//  DRCPractical
//
//  Created by on 09/03/22.
//


import UIKit

protocol HomeInteractorProtocol {
    func callSomething()
}

protocol HomeDataStore {
    //{ get set }
}

class HomeInteractor: HomeInteractorProtocol, HomeDataStore {

    // MARK: Objects & Variables
    var presenterHome: HomePresentationProtocol?
    
    // MARK: Call something
    func callSomething() {
        
    }
}
