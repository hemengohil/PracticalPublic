//
//  HomePresenter.swift
//  DRCPractical
//
//  Created on 09/03/22.
//


import UIKit

protocol HomePresentationProtocol {
    func callSomething()
    
    func fetchNewListData()
    func responseNewsList()

}

class HomePresenter: HomePresentationProtocol {
    
    // MARK: Objects & Variables
    weak var viewControllerHome: HomeProtocol?
    var interactorHome: HomeInteractorProtocol?
    
    // MARK: Present something
    func callSomething() {
        
    }
    func fetchNewListData(){
        interactorHome?.callAPINewsList()
    }
    func responseNewsList(){
        viewControllerHome?.responseNewsList()
    }
}
