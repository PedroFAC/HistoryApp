//
//  UtellyRoutes.swift
//  HistoryApp
//
//  Created by aluno on 25/09/19.
//  Copyright © 2019 aluno. All rights reserved.
//

import Foundation

class UtellyRoutes {
    private static let rootURL: String = "https://www.omdbapi.com/?apikey=\(apikey)&"
    private static let apikey: String = "8b9a2a10"
    
    static func obraByName(name: String) -> String {
        return rootURL+"t=\(name)&"
    }
}
