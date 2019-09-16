//
//  CategoriaViewController.swift
//  HistoryApp
//
//  Created by aluno on 16/09/19.
//  Copyright © 2019 aluno. All rights reserved.
//

import UIKit
extension CategoriaViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell1 = tableView.dequeueReusableCell(withIdentifier: "Celula1TableViewCell", for: indexPath) as! Celula1TableViewCell
        cell1.label.text = listCategorias[indexPath.row]
        return cell1
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }

}


class CategoriaViewController: UIViewController {
    let tableView = UITableView(frame:.zero)
    let listCategorias = ["2ª Guerra Mundial", "Guerra do Golfo", "Grande Depressão"]
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "Celula1TableViewCell", bundle: nil), forCellReuseIdentifier: "Celula1TableViewCell")
        tableView.delegate = self
        tableView.dataSource = self

        // Do any additional setup after loading the view.
    }
    



}
