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

    var listaDeFilmes: [Filme] = []
    
    
    func recuperaFilmesAPI(completion:@escaping(_ listaDeFilmes: Array<Filme>) -> Void) {
        Alamofire.request("https://api.themoviedb.org/3/trending/movie/week?api_key=6f6ac16c48e86c7c1e800a462c1c1c4b&language=pt-BR", method: .get).responseJSON { (response) in
            switch response.result {
            case .success:
                if let resposta = response.result.value as? Dictionary<String,Any> {
                    guard let filmes = resposta["results"] as? Array<Dictionary<String, Any>> else {return}
                    for filme in filmes {
                        self.salvaFilme(filme)
                    }
                   completion(self.listaDeFilmes)
                }
                break
            case .failure:
                print(response.error!)
                completion(self.listaDeFilmes)
                break
            }
        }
    }
    
    
    // MARK: - Métodos
    
    func salvaFilme(_ dicionarioFilme: Dictionary<String,Any>) {
        guard let id = dicionarioFilme["id"] as? Int else {return}
        guard let titulo = dicionarioFilme["title"] as? String else {return}
        guard let tituloOriginal = dicionarioFilme["original_title"] as? String else {return}
        guard let rating = dicionarioFilme["vote_average"] as? Double else {return}
        guard let sinopse = dicionarioFilme["overview"] as? String else {return}
        guard let imagem = dicionarioFilme["backdrop_path"] as? String else {return}
        guard let posterPath = dicionarioFilme["poster_path"] as? String else {return}
        let caminhoImagem = "https://image.tmdb.org/t/p/w500\(imagem)"
        let caminhoPoster = "https://image.tmdb.org/t/p/w500\(posterPath)"
        let filme = Filme(id, titulo, tituloOriginal, rating, sinopse, caminhoPoster, caminhoImagem)
        listaDeFilmes.append(filme)
    }
}
