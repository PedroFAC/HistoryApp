//
//  CategoriaListaController.swift
//  HistoryApp
//
//  Created by aluno on 16/09/19.
//  Copyright © 2019 aluno. All rights reserved.
//

import UIKit
extension CategoriaListaController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell1 = UITableViewCell.init(style: .default, reuseIdentifier: nil)
        cell1.textLabel?.text = listaFilmes[indexPath.row]
        cell1.textLabel?.font = UIFont.systemFont(ofSize: 22)
        return cell1
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let data = listaFilmes[indexPath.row]
        if(indexPath.row == 4 || indexPath.row == 0){
            self.performSegue(withIdentifier: "obraSegue", sender: data)
        }
    }
    
}
class CategoriaListaController: UIViewController {
    
    var data: String!
    
    let tableView = UITableView(frame: .zero)
    let listaFilmes = ["O Grande Ditador","Stalingrado, a batalha final","O Resgate do Soldado Ryan","Sete Anos no Tibet","Band of Brothers"]
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)

        tableView.delegate = self
        tableView.dataSource = self
        tableView.isScrollEnabled = false
        tableView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 50)
            
            ])
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
