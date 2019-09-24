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
        return listaFilmes.count
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
            self.performSegue(withIdentifier: "obraSegue", sender: data)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if
            segue.identifier == "obraSegue",
            let destiny = segue.destination as? ObraController,
            let nomeObraSender = sender as? String {
            destiny.nomeObra = nomeObraSender
        }
    }
    
}
class CategoriaListaController: UIViewController {
    
    var data: String!
    var nomeCategoria = ""
    let tableView = UITableView(frame: .zero)
    var listaFilmes = [""]
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        qualCategoria()
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
    func qualCategoria (){
        switch data {
        case "2ª Guerra Mundial":
            listaFilmes = ["The Great Dictator","Stalingrad","Saving Private Ryan","Seven Years in Tibet"]
        case "Guerra do Golfo":
            listaFilmes = ["The Hurt Locker"]
        case "Grande Depressão":
            listaFilmes = ["The Pianist","The Wave","The Untouchables"]
        case "Unificações italiana e alemã":
            listaFilmes = ["Garibaldi"]
        case "Ascensão e queda de Napoleão":
            listaFilmes = ["Napoleon"]
        case "Revolução russa e socialismo soviético":
            listaFilmes = ["Battleship Potemkin"]
        case "Fatos relevantes depois da guerra fria":
            listaFilmes = ["Cry Freedom", "Lord of War"]
        case "Independência dos Estados Unidos":
            listaFilmes = ["Plymouth Adventure", "The Patriot"]
        case "Revolução francesa":
            listaFilmes = ["To kill a king", "The Miserables"]
        case "Revolução Industrial":
            listaFilmes = ["Modern Times"]
            
        default:
            listaFilmes = [""]
        }
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

