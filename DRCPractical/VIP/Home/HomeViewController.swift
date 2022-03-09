//
//  HomeViewController.swift
//  DRCPractical
//
//  Created on 09/03/22.
//


import UIKit

protocol HomeProtocol: AnyObject {
    func callSomething()
}

class HomeViewController: UIViewController, HomeProtocol {

    // MARK: Objects & Variables
    var presenterHome: HomePresentationProtocol?

    // MARK: IBOutlets
    @IBOutlet weak var tblView: UITableView!

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
        let interactor = HomeInteractor()
        let presenter = HomePresenter()
        
        //View Controller will communicate with only presenter
        viewController.presenterHome = presenter
        
        //Presenter will communicate with Interector and Viewcontroller
        presenter.viewControllerHome = viewController
        presenter.interactorHome = interactor
        
        //Interactor will communucate with only presenter.
        interactor.presenterHome = presenter
    }
    
    
    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "List"
        self.navigationController!.navigationBar.barTintColor = UIColor.white
        self.tblView.reloadData()
    }
    
    // MARK: Call something
    
    func callSomething() {
        
    }
}

extension HomeViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:CellNews = tableView.dequeueReusableCell(withIdentifier: CellNews.identifierCell) as! CellNews
        
        cell.contentView.backgroundColor = .clear
        return cell

    }


}



