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
            //destiny.filmes = self.filmes
        }
    }
    
}
class CategoriaListaController: UIViewController {
    let path = Bundle.main.path(forResource: "Data", ofType: "plist")
    var dict: NSDictionary? = nil
    var filmes = [[String]]()
    var categorias = [String]()
    var data: String!
    var nomeCategoria = ""
    let tableView = UITableView(frame: .zero)
    var listaFilmes = [""]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        print(filmes)
        print(listaFilmes)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.isScrollEnabled = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        self.dict = NSDictionary(contentsOfFile: path!)
        
        if let categorias = dict?.object(forKey: "Categorias") as? [String] {
            self.categorias = categorias
        }
        if let filmes = dict?.object(forKey: "Filmes") as? [[String]]{
            self.filmes = filmes
        }
        
        qualCategoria()

        

        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 50)
            
            ])
        // Do any additional setup after loading the view.
    }
    func qualCategoria (){
//        switch data {
//        case "2ª Guerra Mundial":
//            listaFilmes = filmes[0]
//        case "Guerra do Golfo":
//            listaFilmes = filmes[1]
//        case "Grande Depressão":
//            listaFilmes = filmes[2]
//        case "Ascensão e queda de Napoleão":
//            listaFilmes = filmes[3]
//        case "Revolução russa e socialismo soviético":
//            listaFilmes = filmes[4]
//        case "Guerra Fria":
//            listaFilmes  = filmes[5]
//        case "Fatos relevantes depois da guerra fria":
//            listaFilmes = filmes[6]
//        case "Independência dos Estados Unidos":
//            listaFilmes = filmes[7]
//        case "Revolução francesa":
//            listaFilmes = filmes[8]
//        case "Revolução Industrial":
//            listaFilmes = filmes[9]
//
//        default:
//            listaFilmes = [""]
//        }
//
        let result = self.categorias.enumerated().filter {
            return $0.element == data
        }
        
        listaFilmes = filmes[result[0].offset] 
        
        self.tableView.reloadData()
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

