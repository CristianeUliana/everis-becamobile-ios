//
//  FilmeAPI.swift
//  FilmeApp
//
//  Created by Cristiane Goncalves Uliana on 27/03/21.
//  Copyright © 2021 Estudos. All rights reserved.
//

import UIKit
import Alamofire

class FilmeAPI: NSObject {
    

    // MARK: - Requisições
    
    func recuperaFilmesAPI(completion:@escaping([Result]) -> Void) {
        let url = URL( string: "https://api.themoviedb.org/3/trending/movie/week?api_key=6f6ac16c48e86c7c1e800a462c1c1c4b&language=pt-BR")!
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let responseData = data else { return }
            do {
                let json = try JSONDecoder().decode(Filmes.self, from: responseData)
                let resultado = json.results
                completion(resultado)
            } catch let error {
                print("error: \(error)")
            }
        }
        task.resume()
    }
}
