//
//  ViewController.swift
//  tv
//
//  Created by Владислав Галкин on 24.05.2021.
//

import UIKit

class ViewController: UIViewController, PlaceCellProtocol {

    var place = ["Австралия", "Англия", "Испания", "Франция", "Италия"]
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .init(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
        tableView.register(PlaceCell.self, forCellReuseIdentifier: "MyCell")
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
   
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let destinationVC = SecondVC()
        destinationVC.label.text = place[indexPath.row]
        present(destinationVC, animated: true, completion: nil)
        //navigationController?.pushViewController(destinationVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return place.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath) as? PlaceCell else { return UITableViewCell() }
        cell.delegate = self
        cell.label.text = place[indexPath.row]
        
        return cell
    }
    
    func doSometh(cell: PlaceCell) {
        if !cell.checkark! {
            cell.button.backgroundColor = .green
            cell.checkark = true
        }else{
            cell.button.backgroundColor = .gray
            cell.checkark = false
        }
        
    }

}

