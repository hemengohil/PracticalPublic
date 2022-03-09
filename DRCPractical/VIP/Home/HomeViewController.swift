//
//  HomeViewController.swift
//  DRCPractical
//
//  Created on 09/03/22.
//


import UIKit


protocol HomeProtocol: AnyObject {
    func callSomething()
    func responseNewsList(articlesList: [ArticlesCDM]?)
}

class HomeViewController: UIViewController, HomeProtocol {
    

    // MARK: Objects & Variables
    var presenterHome: HomePresentationProtocol?

    // MARK: IBOutlets
    @IBOutlet weak var tblView: UITableView!

    
    var arrArticles: [ArticlesCDM]?
    
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
        DispatchQueue.main.async {
            self.fetchNewsList()
        }
    }
    
    // MARK: Call something
    func fetchNewsList(){
        self.presenterHome?.fetchNewListData()
    }
    
    func responseNewsList(articlesList: [ArticlesCDM]?){
        self.arrArticles = articlesList
        self.tblView.reloadData()
    }
    func callSomething() {
        
    }
    
}

extension HomeViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrArticles?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:CellNews = tableView.dequeueReusableCell(withIdentifier: CellNews.identifierCell) as! CellNews
        
        let objArtical = self.arrArticles?[indexPath.row]
        
        cell.lblTitle.text = objArtical?.title
        cell.lblName.text = objArtical?.author
        cell.lblLink.text = objArtical?.newsURL
        cell.lblDate.text = Date().localizedDescription
        
        if let url = URL(string: objArtical?.newsImage ?? "")
        {
            cell.imgHead.load(url: url)
        }
        cell.contentView.backgroundColor = .clear
        cell.selectionStyle = .none
        return cell

    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let objArtical = self.arrArticles?[indexPath.row]
        let objNewsDetails = self.storyboard?.instantiateViewController(withIdentifier: NewsDetailViewController.storyIdentifier) as! NewsDetailViewController
        objNewsDetails.urlToLoad = objArtical?.newsURL ?? "https://www.google.com"
        self.navigationController?.pushViewController(objNewsDetails, animated: true)
    }

}



extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
