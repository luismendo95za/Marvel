//
//  MDashboardViewController.swift
//  Marvel
//
//  Created by Luis Alberto Mendoza Reyna on 29/5/21.
//

import UIKit
import Foundation

protocol DashboardViewControllerProtocol: class{
    var filteredData: [Result]  {get set}
    var listCharacters: [Result]  {get set}
    var context: DashboardViewController? {get set}
    var refreshControl: UIRefreshControl {get set}
    func reloadTable()
}


class DashboardViewController: UIViewController {

    // MARK: Outles
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var context: DashboardViewController?
    let presenter: DashboardPresenter! = DashboardPresenter()
    var router: DashboardRouter? = nil
    internal var listCharacters: [Result] = []
    internal var filteredData: [Result] = []
    
    var refreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configurePresenter()
        self.configureTableView()
        self.configureSearchBar()
        self.configurePullTorefresh()
        self.router = DashboardRouter(self)
        self.title = "Personajes"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.presenter.getListCharacter()
    }
    
    fileprivate func configurePresenter() {
        self.presenter.setView(view: self)
        self.context = self
    }
    
    fileprivate func configureTableView() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        let characterCell = UINib(nibName: CharacterTableViewCell.reuseId, bundle: nil)
        self.tableView.register(characterCell, forCellReuseIdentifier: CharacterTableViewCell.reuseId)
    }

    fileprivate func configureSearchBar() {
        self.searchBar.delegate = self
    }
    
    fileprivate func configurePullTorefresh() {
        refreshControl.attributedTitle = NSAttributedString(string: "")
        refreshControl.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
        tableView.addSubview(refreshControl)
    }
    
    @objc func refresh(_ sender: AnyObject) {
        self.presenter.getListCharacter()
    }
}


extension DashboardViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
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
}

extension DashboardViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        filteredData = searchText.isEmpty ? listCharacters : listCharacters.filter({$0.name?.range(of: searchText, options: .caseInsensitive) != nil})
        tableView.reloadData()
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        filteredData = searchBar.text!.isEmpty ? listCharacters : listCharacters.filter({$0.name?.range(of: searchBar.text ?? "", options: .caseInsensitive) != nil})
        tableView.reloadData()
    }
}

extension DashboardViewController: DashboardViewControllerProtocol {
    func reloadTable() {
        tableView?.reloadData()
    }    
}
