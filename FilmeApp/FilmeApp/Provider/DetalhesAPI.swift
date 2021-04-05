//
//  DetalhesAPI.swift
//  FilmeApp
//
//  Created by Cristiane Goncalves Uliana on 05/04/21.
//  Copyright © 2021 Estudos. All rights reserved.
//

import Foundation

class DetalhesAPI: NSObject {

    
    func recuperaDetalhesAPI(_ id: Int, completion:@escaping(DetailsFilms) -> Void) {
        let idString = String(id)
        let url = URL( string:"https://api.themoviedb.org/3/movie/\(idString)?api_key=6f6ac16c48e86c7c1e800a462c1c1c4b&language=pt-BR")!
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let responseData = data else { return }
            do {
                let json = try JSONDecoder().decode(DetailsFilms.self, from: responseData)
                completion(json)
            } catch let error {
                print("error: \(error)")
            }
        }
        task.resume()
    }
}
