//
//  SecondViewController.swift
//  HistoryApp
//
//  Created by aluno on 16/09/19.
//  Copyright © 2019 aluno. All rights reserved.
//

import UIKit
//extension SecondViewController:  UISearchBarDelegate, UITableViewDelegate, UITableViewDataSource{
//    
//    
//}
extension SecondViewController:  UISearchBarDelegate, UITableViewDelegate, UITableViewDataSource{
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
    
   
}

class SecondViewController: UIViewController {
    
    @IBOutlet weak var checkcollection: UICollectionView!
    @IBOutlet weak var salvasCollectionView: UICollectionView!
    
    let filme : [Filme] = [
    
        Filme(img:  UIImage(named: "lord")!, text: "Saving Private Ryan"),
        Filme(img:  UIImage(named: "anastasia")!, text: "Germinal"),
        Filme(img:  UIImage(named: "lincoln")!, text: "The Hurt Locker"),
        Filme(img:  UIImage(named: "napoleon")!, text: "The Patriot"),
        Filme(img:  UIImage(named: "cryfreedom")!, text: "Anastasia"),
        Filme(img:  UIImage(named: "apocalypse")!, text: "The Pianist"),
        Filme(img:  UIImage(named: "mudbound")!, text: "Full Metal Jacket"),
        
    ]
    
    let salvo : [Filme] = [
        
        Filme(img:  UIImage(named: "lord")!, text: "Lord of War"),
        Filme(img:  UIImage(named: "anastasia")!, text: "Anastasia"),
        Filme(img:  UIImage(named: "lincoln")!, text: "Lincoln"),
        Filme(img:  UIImage(named: "napoleon")!, text: "Napoleon"),
        Filme(img:  UIImage(named: "cryfreedom")!, text: "Cry Freedom"),
        Filme(img:  UIImage(named: "apocalypse")!, text: "Apocalypse Now"),
        Filme(img:  UIImage(named: "mudbound")!, text: "Mudbound"),
        
        ]
    
//    let imgRecomendacao: [UIImage] = [
//
//        UIImage(named: "img1")!,
//        UIImage(named: "img2")!,
//        UIImage(named: "img3")!,
//        UIImage(named: "img3")!,
//        UIImage(named: "img3")!,
//        UIImage(named: "img3")!,
//        UIImage(named: "img3")!,
//
//        ]
//
//    let imgSalvas: [UIImage] = [
//
//        UIImage(named: "img2")!,
//        UIImage(named: "img3")!,
//        UIImage(named: "img1")!,
//        UIImage(named: "img2")!,
//
//        UIImage(named: "img3")!,
//        UIImage(named: "img1")!,
//        UIImage(named: "img2")!,
//        UIImage(named: "img3")!,
//        UIImage(named: "img1")!,
//    ]
//
//    let textoTeste: [String] = [
//    "iunasiund",
//    "iusdiuan",
//    "nsidunaisd",
//    "iunasiund",
//    "iusdiuan",
//    "nsidunaisd",
//    "iunasiund",
//    "iusdiuan",
//    "nsidunaisd",
//    ]
    
    var selectedIndex : IndexPath?
    
    var isSearching = false
    let searchBar = UISearchBar(frame:.zero)
    let results = UITableView(frame: .zero)
    var filteredData = [String]()
    var items = ["The Great Dictator","Stalingrad","Saving Private Ryan","Seven Years in Tibet","The Pianist","The Wave","The Untouchables","Cry Freedom", "Lord of War","Plymouth Adventure", "The Patriot","To kill a king","Modern Times" , "Napoleon"]
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
        super.viewDidLoad()
        
        checkcollection.delegate = self
        checkcollection.dataSource = self
        
        salvasCollectionView.delegate = self
        salvasCollectionView.dataSource = self
        // Do any additional setup after loading the view.
        
        let nib = UINib(nibName: "CheckCollectionViewCell", bundle: .main)
        checkcollection.register(nib, forCellWithReuseIdentifier: "checkCell")
        salvasCollectionView.register(nib, forCellWithReuseIdentifier: "checkCell")
        searchBar.delegate = self
        searchBar.returnKeyType = UIReturnKeyType.done
        self.title = "Home"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        results.translatesAutoresizingMaskIntoConstraints = false
        results.delegate = self
        results.dataSource = self
        searchBar.placeholder = "Pesquise por título de obra"
        
        view.addSubview(searchBar)
        view.addSubview(results)
      
        NSLayoutConstraint.activate([
           /*searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
           searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
           searchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            results.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            results.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            results.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 0),
            results.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),*/
            ])
        
    }
    
}

extension SecondViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView.restorationIdentifier == "check" {
            return filme.count
        } else {
            return salvo.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "checkCell", for: indexPath) as! CheckCollectionViewCell
        
        if collectionView.restorationIdentifier == "check" {
            cell.imageView.image = filme[indexPath.row].img
            cell.text.text = salvo[indexPath.row].text
        } else {
            cell.imageView.image = salvo[indexPath.row].img
            cell.text.text = salvo[indexPath.row].text
        }
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let indexPath = selectedIndex,
           let destination  = segue.destination as? ObraController {
            destination.nomeObra = salvo[indexPath.row].text
        }
 
    /*override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier=="obraSegue",
            let indexPath = selectedIndex,
            let destiny = segue.destination as? ObraController,
            let nomeObraSender = sender as? String {
            destiny.nomeObra = filme[indexPath.row].text
            //destiny.filmes = self.filmes
        }*/
    }
   
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        self.selectedIndex = indexPath
        performSegue(withIdentifier: "secondToTeste", sender: nil)
    }
    
   /* func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        AQUI TEM QUE INDEXAR A QUAL TELA O CLICK IRÁ DIRECIONAR
         let url = thumbnailFileURLS[indexPath.item]
        if UIApplication.sharedApplication().canOpenURL(url) {
            UIApplication.sharedApplication().openURL(url)
        }
    }*/
}



