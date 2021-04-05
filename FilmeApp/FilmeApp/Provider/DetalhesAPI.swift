//
//  DetalhesAPI.swift
//  FilmeApp
//
//  Created by Cristiane Goncalves Uliana on 05/04/21.
//  Copyright © 2021 Estudos. All rights reserved.
//

import Foundation



class DetalhesAPI: NSObject {

//    var listaDeFilmes: [Filme] = []
//    var filmeDetalhado: Filme?
    
    
    func recuperaDetalhesAPI(_ id: Int, completion:@escaping(DetailsFilms) -> Void) {
        let idString = String(id)
        let url = URL( string:"https://api.themoviedb.org/3/movie/\(idString)?api_key=6f6ac16c48e86c7c1e800a462c1c1c4b&language=pt-BR")!
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let responseData = data else { return }
            do {
                let json = try JSONDecoder().decode(DetailsFilms.self, from: responseData)
                //guard let filmeDetalhado = self.salvaDetalhes(json, filmeSelecionado) else {return}
                completion(json)
                
            } catch let error {
                print("error: \(error)")
            }
        }
        task.resume()
    }
    
    
//    func salvaDetalhes(_ dicionarioFilme: DetailsFilms, _ filmeSelecionado: Filme) -> Filme? {
//
//        let tituloOriginal = dicionarioFilme.originalTitle
//        let rating = dicionarioFilme.voteAverage
//        let sinopse = dicionarioFilme.overview
//        let imagem = dicionarioFilme.backdropPath
//        let caminhoImagem = "https://image.tmdb.org/t/p/w500\(imagem)"
//
//        filmeSelecionado.detalhes.tituloOriginal = tituloOriginal
//        filmeSelecionado.detalhes.rating = rating
//        filmeSelecionado.detalhes.sinopse = sinopse
//        filmeSelecionado.detalhes.caminhoImagem = caminhoImagem
//        return filmeSelecionado
//    }
    
}
