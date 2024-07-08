//
//  ViewController.swift
//  StartupNews
//
//  Created by Admin on 07/07/2024.
//

import UIKit

class ViewController: UIViewController, CoordinatorDelegate {

    @IBOutlet private weak var table: UITableView!
    
    @IBOutlet private weak var labelResults: UILabel!
    
    var coordinator: MainCoordinator?
    
    private var data = [Article]()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let cell = UINib(nibName: "CustomTableViewCell", bundle: nil)
        
        self.table.register(cell, forCellReuseIdentifier: "Cell")
        
        ConnectionsWrapper.sharedInstance.delegate = self
        ConnectionsWrapper.sharedInstance.getArticles()
    }
    
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    // Métodos delegados Vista de Tabla
    
    // Indica el número de filas de la tabla por sección
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    // Crea la celda y pinta el contenido que tiene que mostrar
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! CustomTableViewCell
        
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
    
    // Altura de las celdas
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
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
