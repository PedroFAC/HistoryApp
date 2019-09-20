//
//  SecondViewController.swift
//  HistoryApp
//
//  Created by aluno on 16/09/19.
//  Copyright © 2019 aluno. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var checkcollection: UICollectionView!
    @IBOutlet weak var salvasCollectionView: UICollectionView!
    
    let filme : [Filme] = [
    
        Filme(img:  UIImage(named: "img1")!, text: "iunasiund"),
        Filme(img:  UIImage(named: "img2")!, text: "iunasiund"),
        Filme(img:  UIImage(named: "img3")!, text: "iunasiund"),
        Filme(img:  UIImage(named: "img1")!, text: "iunasiund"),
        Filme(img:  UIImage(named: "img2")!, text: "iunasiund"),
        Filme(img:  UIImage(named: "img3")!, text: "iunasiund"),
        Filme(img:  UIImage(named: "img2")!, text: "iunasiund"),
        
    ]
    
    let salvo : [Filme] = [
        
        Filme(img:  UIImage(named: "img1")!, text: "iunasiund"),
        Filme(img:  UIImage(named: "img2")!, text: "iunasiund"),
        Filme(img:  UIImage(named: "img3")!, text: "iunasiund"),
        Filme(img:  UIImage(named: "img1")!, text: "iunasiund"),
        Filme(img:  UIImage(named: "img2")!, text: "iunasiund"),
        Filme(img:  UIImage(named: "img3")!, text: "iunasiund"),
        Filme(img:  UIImage(named: "img2")!, text: "iunasiund"),
        
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
        } else {
            cell.imageView.image = salvo[indexPath.row].img
        }
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let indexPath = selectedIndex,
           let destination  = segue.destination as? TesteViewController {
            destination.text = filme[indexPath.row].text
        }
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



