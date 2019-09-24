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
    let elenco = UILabel(frame: .zero)
    let imagem = UIImageView(frame: .zero)
    let ondeEncontrarContent1  = UIButton(frame: .zero)
    let ondeEncontrarContent2  = UIButton(frame: .zero)
    let diretor = UILabel(frame: .zero)
    
    var nomeObra : String = ""
    var plotObra : String = ""
    var diretorObra : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        WebRepository.getObra(name: nomeObra, completion: { data, error in
            
            if let error = error?.localizedDescription {
                print(error)
                return
            }
            
            if let obra = data {
                print(obra.Title)
                print(obra.Plot)
                print(obra.Director)
                self.nomeObra = obra.Title
                self.plotObra = obra.Plot
                self.diretorObra = obra.Director
                
                DispatchQueue.main.async {
                    self.reloadViews()
                }
            }
            
        })
        tituloObra.translatesAutoresizingMaskIntoConstraints = false
        ondeEncontrar.translatesAutoresizingMaskIntoConstraints = false
        sinopse.translatesAutoresizingMaskIntoConstraints = false
        elenco.translatesAutoresizingMaskIntoConstraints = false
        imagem.translatesAutoresizingMaskIntoConstraints = false
        ondeEncontrarContent1.translatesAutoresizingMaskIntoConstraints = false
        ondeEncontrarContent2.translatesAutoresizingMaskIntoConstraints = false
        diretor.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(tituloObra)
        view.addSubview(ondeEncontrar)
        view.addSubview(sinopse)
        view.addSubview(elenco)
        view.addSubview(imagem)
        view.addSubview(ondeEncontrarContent1)
        view.addSubview(ondeEncontrarContent2)
        view.addSubview(diretor)
        
     tituloObra.font = UIFont.systemFont(ofSize: 28)
        ondeEncontrar.font = UIFont.systemFont(ofSize: 24)
        elenco.font = UIFont.systemFont(ofSize: 24)
        elenco.text = "Elenco"
      //  imagem.image = #imageLiteral(resourceName: "Band_of_Brothers")
        ondeEncontrarContent1.setTitle("HBO GO", for: .normal)
        ondeEncontrarContent1.setTitleColor(.blue, for: .normal)
        ondeEncontrarContent2.setTitle("Amazon Prime", for: .normal)
        ondeEncontrarContent2.setTitleColor(.blue, for: .normal)
        sinopse.font = UIFont.systemFont(ofSize: 18)
        sinopse.isEditable = false
        sinopse.isSelectable = false

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
            
            elenco.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            elenco.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            elenco.topAnchor.constraint(equalTo: sinopse.bottomAnchor, constant: 30),
            diretor.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            diretor.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            diretor.topAnchor.constraint(equalTo: elenco.bottomAnchor, constant: 30),
             //curiosidades.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30)
            
            
            ondeEncontrar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            ondeEncontrar.trailingAnchor.constraint(equalTo:view.trailingAnchor, constant: -15),
            ondeEncontrar.topAnchor.constraint(equalTo: diretor.bottomAnchor, constant: 10),
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
    
    func reloadViews() {
        ondeEncontrar.text = "Onde encontrar "+nomeObra
        sinopse.text = plotObra
        diretor.text = "Diretor: " + diretorObra
        tituloObra.text = nomeObra
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
