//
//  CategoriaViewController.swift
//  HistoryApp
//
//  Created by aluno on 16/09/19.
//  Copyright © 2019 aluno. All rights reserved.
//

import UIKit

extension CategoriaController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell1 = UITableViewCell.init(style: .default, reuseIdentifier: nil)
        cell1.textLabel?.text = listCategorias[indexPath.row]
        cell1.textLabel?.font = UIFont.systemFont(ofSize: 22)
        cell1.textLabel?.numberOfLines = 2
        return cell1
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let data = listCategorias[indexPath.row]
        if(indexPath.row == 0){
            self.performSegue(withIdentifier: "detailSegue", sender: data)
        }
    }
    
}


class CategoriaController: UIViewController {
    
    let tableView = UITableView(frame:.zero)
    let listCategorias = ["2ª Guerra Mundial", "Guerra do Golfo", "Grande Depressão","Ascensão e queda de Napoleão","Unificações italiana e alemã","Revolução russa e socialismo soviético","Fatos relevantes depois da guerra fria","Independência dos Estados Unidos","Revolução francesa","Revolução Industrial"]
    let titulo = UILabel(frame: .zero)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
