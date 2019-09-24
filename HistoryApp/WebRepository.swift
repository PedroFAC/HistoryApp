//
//  WebRepository.swift
//  HistoryApp
//
//  Created by aluno on 23/09/19.
//  Copyright © 2019 aluno. All rights reserved.
//

import Foundation

class WebRepository {
    static func getObra(name: String, completion: @escaping (Obra?, Error?) -> Void) {
        
        let url = URL(string: Routes.obraByName(name: name.replacingOccurrences(of: " ", with: "+")))!
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            //            print("🤖 Data: \(data?.description)")
            //            print("🤖 Response: \(response?.description)")
            //            print("🤖 Error: \(error?.localizedDescription)")
            
            guard let data = data else { return }
            
            do {
                
                let obra = try JSONDecoder().decode(Obra.self, from: data)
                completion(obra, nil)
                
            } catch {
                
                print(error.localizedDescription)
                completion(nil, error)
                
            }
            
        }
        
        task.resume()
        
    }
}
