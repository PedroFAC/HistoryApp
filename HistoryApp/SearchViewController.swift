//
//  SearchViewController.swift
//  HistoryApp
//
//  Created by aluno on 18/09/19.
//  Copyright © 2019 aluno. All rights reserved.
//

import UIKit
extension SearchViewController:UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            if isSearching{
                return filteredData.count
            }
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell1 = UITableViewCell.init(style: .default, reuseIdentifier: nil)
        let text: String!
        if isSearching{
            text = filteredData[indexPath.row]
        }else{
            text = items[indexPath.row]

        }
        cell1.textLabel?.text = text
        cell1.textLabel?.font = UIFont.systemFont(ofSize: 22)
        cell1.textLabel?.numberOfLines = 1
        return cell1
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var data = ""
        if isSearching{
            data = filteredData[indexPath.row]
        }else{
         data = items[indexPath.row]
        }
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

class SearchViewController: UIViewController, UISearchBarDelegate {
    var isSearching = false
    let searchBar = UISearchBar(frame:.zero)
    let results = UITableView(frame: .zero)
    let recomendados = UILabel(frame: .zero)
    var items = ["The Great Dictator","Stalingrad","Saving Private Ryan","Seven Years in Tibet","The Pianist","The Wave","The Untouchables","Cry Freedom", "Lord of War","Plymouth Adventure", "The Patriot","To kill a king","Modern Times" , "Napoleon"]
    var filteredData = [String]()
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text == nil || searchBar.text == ""{
            isSearching = false
            view.endEditing(true)
            results.reloadData()
        }else{
            isSearching = true
            filteredData = items.filter({$0 == searchBar.text})
            results.reloadData()
        }
    }
    override func viewDidLoad() {
        searchBar.delegate = self
        searchBar.returnKeyType = UIReturnKeyType.done
        super.viewDidLoad()
       // self.title = "Buscar"
      //  self.navigationController?.navigationBar.prefersLargeTitles = true
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        recomendados.translatesAutoresizingMaskIntoConstraints = false
        results.translatesAutoresizingMaskIntoConstraints = false
        results.delegate = self
        results.dataSource = self
        searchBar.placeholder = "Pesquise por evento, data ou título de obra"
        searchBar.isTranslucent = true
        recomendados.text = "Recomendados"
        recomendados.font = UIFont.systemFont(ofSize: 24)
        view.addSubview(searchBar)
        view.addSubview(recomendados)
        view.addSubview(results)
        NSLayoutConstraint.activate([
        searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
        searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
        searchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
        results.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
        results.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
        results.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 0),
        results.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
        //recomendados.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
        //recomendados.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
        //recomendados.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 10),
        //recomendados.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 300)
        ])
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
