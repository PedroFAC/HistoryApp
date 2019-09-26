//
//  DataController.swift
//  HistoryApp
//
//  Created by aluno on 26/09/19.
//  Copyright © 2019 aluno. All rights reserved.
//

import Foundation


class DataController {
    let filmes: [Filme]
    
    init() {
        let fileUrl = Bundle.main.url(forResource: "Filmes", withExtension: "plist")!
        let filmesPlists = NSArray(contentsOf: fileUrl) as! [PListDictionary]
        filmes = filmesPlists.map(Filme.init)
    }
}
