//
//  MDashboardViewController.swift
//  Marvel
//
//  Created by Luis Alberto Mendoza Reyna on 29/5/21.
//

import UIKit
import Foundation

protocol DashboardViewControllerProtocol: class {
    var filteredData: [CharacterModel]  {get set}
    var listCharacters: [CharacterModel]  {get set}
    var context: DashboardViewController? {get set}
    var refreshControl: UIRefreshControl {get set}
    func reloadTable()
}


class DashboardViewController: UIViewController {
    
    // MARK: Outles
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var emptyView: UIView!
    
    // MARK: Variables
    var context: DashboardViewController?
    let presenter: DashboardPresenter! = DashboardPresenter()
    var router: DashboardRouter? = nil
    internal var listCharacters: [CharacterModel] = []
    internal var filteredData: [CharacterModel] = []
    private var isDataLoading = false
    private var page = 0
    private var limit = Constants.limitPage
    private var offset = 0
    var didEndReached = false
    
    var refreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configurePresenter()
        self.configureTableView()
        self.configureSearchBar()
        self.configurePullTorefresh()
        self.router = DashboardRouter(self)
        self.title = "Personajes"
        self.presenter.getListCharacter()
    }
    
    fileprivate func configurePresenter() {
        self.presenter.setView(view: self)
        self.context = self
    }
    
    fileprivate func configureTableView() {
        self.tableView.scrollsToTop = true
        self.tableView.delegate = self
        self.tableView.dataSource = self
        let characterCell = UINib(nibName: CharacterTableViewCell.reuseId, bundle: nil)
        self.tableView.register(characterCell, forCellReuseIdentifier: CharacterTableViewCell.reuseId)
    }
    
    fileprivate func configureSearchBar() {
        self.searchBar.placeholder = "Buscar un personaje"
        self.searchBar.delegate = self
    }
    
    fileprivate func configurePullTorefresh() {
        refreshControl.attributedTitle = NSAttributedString(string: "")
        refreshControl.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
        tableView.addSubview(refreshControl)
    }
    
    @objc func refresh(_ sender: AnyObject) {
        self.presenter.getListCharacter()
        self.page = 0
        self.limit = Constants.limitPage
        self.offset = 0
        self.searchBar.text = ""
    }
}

extension DashboardViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        emptyView.isHidden = filteredData.count == 0 ? false : true
        return filteredData.count
    }
    
    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath) {
        
        router?.navigateDetail(character: filteredData[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CharacterTableViewCell.reuseId, for: indexPath) as! CharacterTableViewCell
        
        cell.configure(character: filteredData[indexPath.row])
        
        return cell
    }
    
    /// The table scrolls to the top if the user clicks the status bar
    func scrollViewShouldScrollToTop(_ scrollView: UIScrollView) -> Bool {
        return true
    }
    
    // MARK: - Pagination
    /// - Variables:
    ///   - isDataLoading: Indicates if the app is doing a service
    ///   - page: Actual page
    ///   - limit: Actual limit to show
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        isDataLoading = false
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if ((tableView.contentOffset.y + tableView.frame.size.height) >= tableView.contentSize.height)
        {
            if !isDataLoading{
                isDataLoading = true
                self.page = self.page + 1
                self.limit = self.limit + 10
                self.offset = self.limit * self.page
                let characterSearch = searchBar.text == "" ? nil : searchBar.text
                self.presenter.getListCharacter(limit: self.limit, offset: self.offset,
                                                name: characterSearch, isPagination: isDataLoading)
            }
        }
    }
}

extension DashboardViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        filteredData = searchText.isEmpty ? listCharacters : listCharacters.filter({$0.name?.range(of: searchText, options: .caseInsensitive) != nil})
        if searchText == "" { // clear text
            presenter.getListCharacter()
        }
        if filteredData.count == 0 {
            presenter.getListCharacter(name: searchBar.text)
        }
        tableView.reloadData()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        presenter.getListCharacter(name: searchBar.text)
    }
}

extension DashboardViewController: DashboardViewControllerProtocol {
    func reloadTable() {
        tableView?.reloadData()
    }    
}
