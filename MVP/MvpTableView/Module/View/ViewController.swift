//
//  ViewController.swift
//  MvpTableView
//
//  Created by Владимир on 22.03.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var presenter : MainViewPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellID")
        tableView.delegate = self
        tableView.dataSource = self
        
        
    }
  
}
extension ViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.comments?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellID")
        let comment = presenter.comments?[indexPath.row]
        cell?.textLabel?.text = comment?.body
        return cell ?? UITableViewCell()
    }
    
    
}
extension ViewController : UITableViewDelegate {
    
}
extension ViewController : MainViewProtocol {
    func failure(error: Error) {
        print(error.localizedDescription)
    }
    
    func success() {
        tableView.reloadData()
    }
    
}
