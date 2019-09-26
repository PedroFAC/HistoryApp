//
//  MyListViewController.swift
//  HistoryApp
//
//  Created by aluno on 19/09/19.
//  Copyright © 2019 aluno. All rights reserved.
//

import UIKit

class MyListViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return obras.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collection.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        if let myCell = cell as? MyListCollectionCell{
            myCell.titulo.text = obras[indexPath.row]
            myCell.image.image = img[segmentControl.selectedSegmentIndex]
        }
        return cell
    }
    
    let img : [UIImage] = [#imageLiteral(resourceName: "imitation-game-benedict-cumberbatch-poster-banner"),#imageLiteral(resourceName: "Band_of_Brothers")]
    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBAction func segment(_ sender: UISegmentedControl) {
        let getIndex = segmentControl.selectedSegmentIndex
        if (getIndex == 0){
             series = false
            print(series)
        }else{
             series = true
            print (series)
        }
        self.collection.reloadData()
    }
    @IBOutlet weak var collection: UICollectionView!
    let obras = ["1","2" ,"3","4","5","6"]
    var series = false
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Minha Lista"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        collection.delegate = self
        collection.dataSource = self
        segmentControl.translatesAutoresizingMaskIntoConstraints = false
        collection.translatesAutoresizingMaskIntoConstraints = false
        
//        NSLayoutConstraint.activate([
//            segmentControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
//            segmentControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
//            segmentControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
//            collection.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
//            collection.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
//            collection.topAnchor.constraint(equalTo: segmentControl.bottomAnchor, constant: 15),
//            collection.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
//            ])
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
