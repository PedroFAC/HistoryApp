//
//  Obra.swift
//  HistoryApp
//
//  Created by aluno on 23/09/19.
//  Copyright © 2019 aluno. All rights reserved.
//

import Foundation

struct Obra: Codable {
    let Title: String
    let Plot: String
    let Director: String
    let Actors: String
    let Poster: String
    var locations: [Location]?
}

struct UtellyData: Codable {
    let results: [UtellyObra]
}

struct UtellyObra: Codable {
    let locations: [Location]
}

struct Location: Codable {
    let display_name: String
    let url: String
}
