//
//  NewsDetailViewController.swift
//  DRCPractical
//
//  Created on 09/03/22.
//


import UIKit
import WebKit

protocol NewsDetailProtocol: AnyObject {
    func callSomething()
}

class NewsDetailViewController: UIViewController, NewsDetailProtocol {

    static let storyIdentifier = "NewsDetailViewController"
    
    // MARK: Objects & Variables
    var presenterNewsDetail: NewsDetailPresentationProtocol?

    // MARK: IBOutlets
    @IBOutlet var webView : WKWebView!
    @IBOutlet var progressView : UIProgressView!

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
        
        self.title = "Details"

        
        DispatchQueue.main.async {
            let url = URL(string: "https://www.google.com")!
            self.webView.load(URLRequest(url: url))
            self.webView.allowsBackForwardNavigationGestures = true
            self.webView.addObserver(self, forKeyPath: #keyPath(WKWebView.estimatedProgress), options: .new, context: nil)
        }
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "estimatedProgress" {
            progressView.progress = Float(webView.estimatedProgress)
        }
    }
    // MARK: Call something
    
    func callSomething() {
        
    }
}

extension NewsDetailViewController: WKNavigationDelegate{
    
}
