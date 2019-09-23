//
//  BotaoQueroAssistir.swift
//  HistoryApp
//
//  Created by aluno on 17/09/19.
//  Copyright © 2019 aluno. All rights reserved.
//

import UIKit

class BotaoQueroAssistir: UIViewController {

    @IBAction func Desmarcado(_ sender: UIButton) {
        botaoDesmarcado.isHidden = true
        botaoQueroAssistir.isHidden = false
        botaoAssistido.isHidden = true
    }

    @IBAction func queroAssistir(_ sender: UIButton) {
        botaoDesmarcado.isHidden = true
        botaoQueroAssistir.isHidden = true
        botaoAssistido.isHidden = false
    }
    
    @IBAction func Assistido(_ sender: UIButton) {
        botaoDesmarcado.isHidden = false
        botaoQueroAssistir.isHidden = true
        botaoAssistido.isHidden = true
    }
    
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var botaoDesmarcado: UIButton!
    @IBOutlet weak var botaoQueroAssistir: UIButton!
    @IBOutlet weak var botaoAssistido: UIButton!
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        botaoQueroAssistir.isHidden = true
        botaoAssistido.isHidden = true
        textView.text = "Based on the real life story of legendary cryptanalyst Alan Turing, the film portrays the nail-biting race against time by Turing and his brilliant team of code-breakers at Britain's top-secret Government Code and Cypher School at Bletchley Park, during the darkest days of World War II."
        movieTitle.text = "The imitation Game"// Do any additional setup after loading the view.
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
