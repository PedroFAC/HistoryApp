//
//  TesteViewController.swift
//  HistoryApp
//
//  Created by aluno on 19/09/19.
//  Copyright © 2019 aluno. All rights reserved.
//

import UIKit

class TesteViewController: UIViewController {
    @IBOutlet weak var teste: UILabel!
    
    var text : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let name = text {
            teste.text = name 
        }

        
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
