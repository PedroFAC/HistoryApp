//
//  WebRepository.swift
//  HistoryApp
//
//  Created by aluno on 23/09/19.
//  Copyright © 2019 aluno. All rights reserved.
//

import Foundation
import UIKit

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
    
    
    static func getLinks(name: String, completion: @escaping ([Location]?, Error?) -> Void){
        let headers = [
            "x-rapidapi-host": "utelly-tv-shows-and-movies-availability-v1.p.rapidapi.com",
            "x-rapidapi-key": "bbb412ecb4msh40b82006fe94f0fp191b77jsn481abbd42b4d"
        ]
        
        let request = NSMutableURLRequest(url: URL(string: "https://utelly-tv-shows-and-movies-availability-v1.p.rapidapi.com/lookup?term=\(name.replacingOccurrences(of: " ", with: "+"))&country=us")!,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                print(error!)
            } else {
                
                guard let data = data else {
                    completion(nil,nil)
                    return
                }
                
                do {
                    let utData = try JSONDecoder().decode(UtellyData.self, from: data)
                    if !utData.results.isEmpty {
                        completion(utData.results[0].locations, nil)
                    } else {
                        completion([], nil)
                    }
                } catch {
                    print(error.localizedDescription)
                    completion(nil, error)
                }
                
            }
        })
        dataTask.resume()
    }
    
    
    
    
    
/*
getImage(urlString: movie.Poster) { image in
     guard let img = image else { return }
    //atualiza views
}
*/
    func getImage(urlString: String, completion: @escaping (UIImage?) -> Void) {
        let url = URL(string: urlString)!
        URLSession.shared.dataTask(with: url) { data, response, error in
            if error == nil, let data = data {
                let image = UIImage(data: data)
                completion(image)
            }
        }
    }
}
