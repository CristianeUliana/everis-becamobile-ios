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
    var filmeDetalhado: Filme?
    
    
    
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
    
    
    func recuperaDetalhesAPI(_ filmeSelecionado: Filme, completion:@escaping(_ filmeDetalhado: Filme) -> Void) {
        
        let id = String(filmeSelecionado.id)
        
        Alamofire.request("https://api.themoviedb.org/3/movie/\(id)?api_key=6f6ac16c48e86c7c1e800a462c1c1c4b&language=pt-BR", method: .get).responseJSON { (response) in
            switch response.result {
            case .success:
                if let filme = response.result.value as? Dictionary<String,Any> {
                    
                   let filmeDetalhado = self.salvaDetalhes(filme, filmeSelecionado)
                
                    completion(filmeDetalhado)
                }
                
                break
            case .failure:
                print(response.error!)
              
                guard let filmeDetalhado = self.filmeDetalhado else {return}
                completion(filmeDetalhado)
                break
            }
       }
    }
    
    
    
    
    
    
    
    
    
    
    // MARK: - Métodos
    
    
    
    func salvaDetalhes(_ dicionarioFilme: Dictionary<String,Any>, _ filmeSelecionado: Filme) -> Filme {
        
        filmeSelecionado.titulo = dicionarioFilme["title"] as! String
        filmeSelecionado.tituloOriginal = dicionarioFilme["original_title"] as! String
        filmeSelecionado.rating = dicionarioFilme["vote_average"] as! Double
        filmeSelecionado.sinopse = dicionarioFilme["overview"] as! String
        
        guard let imagem = dicionarioFilme["backdrop_path"] as? String else {return filmeSelecionado}
        
        filmeSelecionado.caminhoImagem = "https://image.tmdb.org/t/p/w500\(imagem)"
        
        return filmeSelecionado
    }
    
    
    
    func salvaFilme(_ dicionarioFilme: Dictionary<String,Any>) {
        guard let id = dicionarioFilme["id"] as? Int else {return}
        guard let posterPath = dicionarioFilme["poster_path"] as? String else {return}
        let caminhoPoster = "https://image.tmdb.org/t/p/w500\(posterPath)"
        
        
        
        let titulo = ""
        let tituloOriginal = ""
        let rating = 0.0
        let sinopse = ""
        let caminhoImagem = ""
        
        let filme = Filme(id, titulo, tituloOriginal, rating, sinopse, caminhoPoster, caminhoImagem)
        
       // let filme = Filme(id, caminhoPoster)
        
        listaDeFilmes.append(filme)
        
        
        
        
        //guard let titulo = dicionarioFilme["title"] as? String else {return}
        //guard let tituloOriginal = dicionarioFilme["original_title"] as? String else {return}
        //guard let rating = dicionarioFilme["vote_average"] as? Double else {return}
        //guard let sinopse = dicionarioFilme["overview"] as? String else {return}
        //guard let imagem = dicionarioFilme["backdrop_path"] as? String else {return}
        //let caminhoImagem = "https://image.tmdb.org/t/p/w500\(imagem)"
         //let filme = Filme(id, titulo, tituloOriginal, rating, sinopse, caminhoPoster, caminhoImagem)
        
        
    }
}
