//
//  CategoriaViewController.swift
//  HistoryApp
//
//  Created by aluno on 16/09/19.
//  Copyright © 2019 aluno. All rights reserved.
//

import UIKit
import Foundation

extension CategoriaController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categorias.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell1 = UITableViewCell.init(style: .default, reuseIdentifier: nil)
        cell1.textLabel?.text = categorias[indexPath.row]
        cell1.textLabel?.font = UIFont.systemFont(ofSize: 22)
        cell1.textLabel?.numberOfLines = 2
        return cell1
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let data = categorias[indexPath.row]
        print(data)
            self.performSegue(withIdentifier: "detailSegue", sender: data)
        
    }
    
    
}


class CategoriaController: UIViewController {
    let path = Bundle.main.path(forResource: "Data", ofType: "plist")
    var dict: NSDictionary? = nil

    var categorias = [String]()
    var filmes = [String]()
    let tableView = UITableView(frame:.zero)
    //let listCategorias = ["2ª Guerra Mundial", "Guerra do Golfo", "Grande Depressão","Ascensão e queda de Napoleão","Revolução russa e socialismo soviético","Guerra Fria","Fatos relevantes depois da guerra fria","Independência dos Estados Unidos","Revolução francesa","Revolução Industrial"]
    

    let titulo = UILabel(frame: .zero)
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        print(filmes)
        print (categorias)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.isScrollEnabled = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        titulo.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        view.addSubview(titulo)
        self.title = "Categorias"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        titulo.text = "Categorias"
        
        
        self.dict = NSDictionary(contentsOfFile: path!)
        
        if let categorias = dict?.object(forKey: "Categorias") as? [String] {
            self.categorias = categorias
        }
        if let filmes = dict?.object(forKey: "Filmes") as? [String]{
            self.filmes = filmes
        }
        
        self.tableView.reloadData()
        
        
        
        
        NSLayoutConstraint.activate([
            
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50)
            
            ])
        // Do any additional setup after loading the view.
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailSegue" {
            if let destiny = segue.destination as? CategoriaListaController, let categoria = sender as? String {
                destiny.data = categoria
            }
        }
    }
    
    
}
