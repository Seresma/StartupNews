//
//  ViewController.swift
//  StartupNews
//
//  Created by Sergio Escudero Manzano on 07/07/2024.
//

import UIKit

enum Categories: String {
    case startup = "startup"
    case national = "national"
    case business = "business"
    case sports = "sports"
    case world = "world"
    case politics = "politics"
    case technology = "technology"
    case entertainment = "entertainment"
    case miscellaneous = "miscellaneous"
    case hatke = "hatke"
    case science = "science"
    case automobile = "automobile"
}

class ViewController: UIViewController, CoordinatorDelegate {

    @IBOutlet private weak var table: UITableView!
    
    @IBOutlet private weak var labelResults: UILabel!
    
    var coordinator: MainCoordinator?
    
    private var data = [Article]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let cell = UINib(nibName: Constants.Identifiers.customTableViewCell, bundle: nil)
        
        self.table.register(cell, forCellReuseIdentifier: Constants.Identifiers.cell)
        
        configurationConnectionData()
    }
    
    private func configurationConnectionData() {
        ConnectionsWrapper.sharedInstance.delegate = self
        ConnectionsWrapper.sharedInstance.getArticles(category: Categories.startup)
    }
    
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.Identifiers.cell) as! CustomTableViewCell
        
        cell.labelTitle.text = self.data[indexPath.row].title

        ConnectionsWrapper.sharedInstance.fetchImage(from: self.data[indexPath.row].imageUrl) { image in
            DispatchQueue.main.async {
                if let updateCell = tableView.cellForRow(at: indexPath) as? CustomTableViewCell {
                    updateCell.articleImageView.image = image
                }
            }
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Constants.cellWidth
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        coordinator?.goDetailViewController(data: data[indexPath.row])
    }
    
}

extension ViewController: ConnectionsWrapperDelegate {

    func getDataFromServer(data: [Article]) {
        self.data = data
        labelResults.text = "\(data.count) results found!"
        DispatchQueue.main.async {
            self.table.reloadData()
        }
    }
}
