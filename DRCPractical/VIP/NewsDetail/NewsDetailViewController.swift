//
//  NewsDetailViewController.swift
//  DRCPractical
//
//  Created on 09/03/22.
//


import UIKit

protocol NewsDetailProtocol: AnyObject {
    func callSomething()
}

class NewsDetailViewController: UIViewController, NewsDetailProtocol {

    // MARK: Objects & Variables
    var presenterNewsDetail: NewsDetailPresentationProtocol?

    // MARK: IBOutlets
    
    // MARK: Object lifecycle
    /*
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    */
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    // MARK: Setup
    
    private func setup() {
        let viewController = self
        let interactor = NewsDetailInteractor()
        let presenter = NewsDetailPresenter()
        
        //View Controller will communicate with only presenter
        viewController.presenterNewsDetail = presenter
        
        //Presenter will communicate with Interector and Viewcontroller
        presenter.viewControllerNewsDetail = viewController
        presenter.interactorNewsDetail = interactor
        
        //Interactor will communucate with only presenter.
        interactor.presenterNewsDetail = presenter
    }
    
    
    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: Call something
    
    func callSomething() {
        
    }
}
