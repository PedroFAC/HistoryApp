//
//  ObraController.swift
//  HistoryApp
//
//  Created by aluno on 16/09/19.
//  Copyright © 2019 aluno. All rights reserved.
//

import UIKit

class ObraController: UIViewController {
    let tituloObra = UILabel(frame: .zero)
    let ondeEncontrar = UILabel(frame: .zero)
    let sinopse = UITextView(frame: .zero)
    let curiosidades = UILabel(frame: .zero)
    let imagem = UIImageView(frame: .zero)
    let ondeEncontrarContent1  = UIButton(frame: .zero)
    let ondeEncontrarContent2  = UIButton(frame: .zero)
    let curiosidadesText = UITextView(frame: .zero)
    override func viewDidLoad() {
        super.viewDidLoad()
        tituloObra.translatesAutoresizingMaskIntoConstraints = false
        ondeEncontrar.translatesAutoresizingMaskIntoConstraints = false
        sinopse.translatesAutoresizingMaskIntoConstraints = false
        curiosidades.translatesAutoresizingMaskIntoConstraints = false
        curiosidadesText.translatesAutoresizingMaskIntoConstraints = false
        imagem.translatesAutoresizingMaskIntoConstraints = false
        ondeEncontrarContent1.translatesAutoresizingMaskIntoConstraints = false
        ondeEncontrarContent2.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(tituloObra)
        view.addSubview(ondeEncontrar)
        view.addSubview(sinopse)
        view.addSubview(curiosidades)
        view.addSubview(imagem)
        view.addSubview(ondeEncontrarContent1)
        view.addSubview(ondeEncontrarContent2)
        view.addSubview(curiosidadesText)
        
        tituloObra.text = "Band of Brothers"
     tituloObra.font = UIFont.systemFont(ofSize: 28)
        ondeEncontrar.font = UIFont.systemFont(ofSize: 24)
        curiosidades.font = UIFont.systemFont(ofSize: 24)
      //  imagem.image = #imageLiteral(resourceName: "Band_of_Brothers")
        ondeEncontrarContent1.setTitle("HBO GO", for: .normal)
        ondeEncontrarContent1.setTitleColor(.blue, for: .normal)
        ondeEncontrarContent2.setTitle("Amazon Prime", for: .normal)
        ondeEncontrarContent2.setTitleColor(.blue, for: .normal)
        sinopse.font = UIFont.systemFont(ofSize: 18)
        sinopse.isEditable = false
        sinopse.isSelectable = false
        curiosidadesText.font = UIFont.systemFont(ofSize: 18)
        curiosidadesText.isEditable = false
        curiosidadesText.isSelectable = false
        curiosidadesText.text = """
        1. BAND OF BROTHERS'S BUDGET WAS UNHEARD OF AT THE TIME.
        When Band of Brothers began its journey to the screen in the late 1990s, one of HBO’s chief concerns in agreeing to produce the series was its budget. Today, in the wake of Game of Thrones, it seems natural for the network to foot the bill for such an epic undertaking, but at the time the amount of money called for was almost unheard of. When discussions first began, it became clear that the miniseries would cost at least $125 million to produce, which meant $12 million per episode. That’s a figure that dwarfed even the most prestigious and popular TV dramas at the time, and it didn’t even factor in the massive marketing budget (at least $15 million) the network was considering to promote the event. So, what convinced HBO to put up the money? A number of factors, but having Hanks and Spielberg on board certainly helped.
        
        ''I'm not saying they didn't bat an eye,'' Hanks told The New York Times in 2001. ''Oh, they did bat an eye. But the reality is this was expensive. You had to have deep pockets. And HBO has deep pockets."
        """
        
        ondeEncontrar.text = "Onde encontrar "+tituloObra.text!
        sinopse.text = """
        Band of Brothers acompanha a história da "E" Easy Company, o 506º Regimento da 101ª Divisão Aerotransportada, desde o treinamento inicial da equipe, em 1942, até o final da 2ª Guerra Mundial. Com um papel primordial para a resolução do conflito, eles foram uma das unidades de maior sucesso na história militar americana.
        Band of Brothers acompanha a história da "E" Easy Company, o 506º Regimento da 101ª Divisão Aerotransportada, desde o treinamento inicial da equipe, em 1942, até o final da 2ª Guerra Mundial. Com um papel primordial para a resolução do conflito, eles foram uma das unidades de maior sucesso na história militar americana.
        Band of Brothers acompanha a história da "E" Easy Company, o 506º Regimento da 101ª Divisão Aerotransportada, desde o treinamento inicial da equipe, em 1942, até o final da 2ª Guerra Mundial. Com um papel primordial para a resolução do conflito, eles foram uma das unidades de maior sucesso na história militar americana.
        Band of Brothers acompanha a história da "E" Easy Company, o 506º Regimento da 101ª Divisão Aerotransportada, desde o treinamento inicial da equipe, em 1942, até o final da 2ª Guerra Mundial. Com um papel primordial para a resolução do conflito, eles foram uma das unidades de maior sucesso na história militar americana.
        Band of Brothers acompanha a história da "E" Easy Company, o 506º Regimento da 101ª Divisão Aerotransportada, desde o treinamento inicial da equipe, em 1942, até o final da 2ª Guerra Mundial. Com um papel primordial para a resolução do conflito, eles foram uma das unidades de maior sucesso na história militar americana.

"""
 
        curiosidades.text = "Curiosidades de "+tituloObra.text!
        
        // Do any additional setup after loading the view.
        
        NSLayoutConstraint.activate([
          tituloObra.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
          tituloObra.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
          tituloObra.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
          /*imagem.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            imagem.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            imagem.topAnchor.constraint(equalTo: tituloObra.bottomAnchor, constant: 10),*/
          sinopse.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
          sinopse.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            sinopse.topAnchor.constraint(equalTo: tituloObra.bottomAnchor, constant: 10),
            
            curiosidades.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            curiosidades.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            curiosidades.topAnchor.constraint(equalTo: sinopse.bottomAnchor, constant: 30),
             //curiosidades.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30)
            
            curiosidadesText.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            curiosidadesText.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            curiosidadesText.topAnchor.constraint(equalTo: curiosidades.bottomAnchor, constant: 30),
            ondeEncontrar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            ondeEncontrar.trailingAnchor.constraint(equalTo:view.trailingAnchor, constant: -15),
            ondeEncontrar.topAnchor.constraint(equalTo: curiosidadesText.bottomAnchor, constant: 10),
            ondeEncontrarContent1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            //ondeEncontrarContent1.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            ondeEncontrarContent1.topAnchor.constraint(equalTo: ondeEncontrar.bottomAnchor, constant: 30),
            ondeEncontrarContent1.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            ondeEncontrarContent2.leadingAnchor.constraint(equalTo: ondeEncontrarContent1.trailingAnchor, constant: 0),
            ondeEncontrarContent2.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            ondeEncontrarContent2.topAnchor.constraint(equalTo: ondeEncontrar.bottomAnchor, constant: 30),
            ondeEncontrarContent2.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            
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
