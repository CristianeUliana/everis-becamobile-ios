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
    
    // MARK: - Variáveis
    
    var listaDeFilmes: [Filme] = []
    var filmeDetalhado: Filme?
    
    
    // MARK: - Requisições
    
    func recuperaFilmesAPI(_ index: Int, completion:@escaping(_ listaDeFilmes: Array<Filme>, _ numeroDePaginas: Int) -> Void) {
        
        let page = "&page=\(index)"
        
        let url = URL( string: "https://api.themoviedb.org/3/trending/movie/week?api_key=6f6ac16c48e86c7c1e800a462c1c1c4b&language=pt-BR\(page)")!
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let responseData = data else { return }
            do {
                let json = try JSONDecoder().decode(Welcome.self, from: responseData)
                let resultado = json.results
                
                let numeroDePaginas = json.totalPages
                
                for filme in resultado {
                    self.salvaFilme(filme)
                }
                completion(self.listaDeFilmes, numeroDePaginas)
            } catch let error {
                print("error: \(error)")
            }
        }
        task.resume()
    }
    
    
    
    func salvaFilme(_ dicionarioFilme: Result) {
        guard let filme = retornaFilme(dicionarioFilme) else {return}
        listaDeFilmes.append(filme)
    }
    
    func retornaFilme(_ dicionarioFilme: Result) -> Filme? {
        let titulo = dicionarioFilme.title
        let id = dicionarioFilme.id
        let posterPath = dicionarioFilme.posterPath
        let caminhoPoster = "https://image.tmdb.org/t/p/w500\(posterPath)"
        
        let filme = Filme(id, titulo, caminhoPoster)
        
        return filme
    }
    
    
    
    func recuperaDetalhesAPI(_ filmeSelecionado: Filme, completion:@escaping(_ filmeDetalhado: Filme) -> Void) {
        let id = String(filmeSelecionado.id)
        let url = URL( string:"https://api.themoviedb.org/3/movie/\(id)?api_key=6f6ac16c48e86c7c1e800a462c1c1c4b&language=pt-BR")!
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let responseData = data else { return }
            do {
                let json = try JSONDecoder().decode(Details.self, from: responseData)
                guard let filmeDetalhado = self.salvaDetalhes(json, filmeSelecionado) else {return}
                completion(filmeDetalhado)
            
            } catch let error {
                print("error: \(error)")
            }
        }
        task.resume()
    }
    
    
    
  //  https://api.themoviedb.org/3/movie/791373?api_key=6f6ac16c48e86c7c1e800a462c1c1c4b&language=pt-BR
    
    
    
    
    
        func salvaDetalhes(_ dicionarioFilme: Details, _ filmeSelecionado: Filme) -> Filme? {
            
            let tituloOriginal = dicionarioFilme.originalTitle
            let rating = dicionarioFilme.voteAverage
            let sinopse = dicionarioFilme.overview
            let imagem = dicionarioFilme.backdropPath
            let caminhoImagem = "https://image.tmdb.org/t/p/w500\(imagem)"

            filmeSelecionado.detalhes.tituloOriginal = tituloOriginal
            filmeSelecionado.detalhes.rating = rating
            filmeSelecionado.detalhes.sinopse = sinopse
            filmeSelecionado.detalhes.caminhoImagem = caminhoImagem
            return filmeSelecionado
        }
    
    
    
//    func recuperaFilmesAPI(completion:@escaping(_ listaDeFilmes: Array<Filme>) -> Void) {
//        Alamofire.request("https://api.themoviedb.org/3/trending/movie/week?api_key=6f6ac16c48e86c7c1e800a462c1c1c4b&language=pt-BR", method: .get).responseJSON { (response) in
//            switch response.result {
//            case .success:
//                if let resposta = response.result.value as? Dictionary<String,Any> {
//                    guard let filmes = resposta["results"] as? Array<Dictionary<String, Any>> else {return}
//                    for filme in filmes {
//                        self.salvaFilme(filme)
//                    }
//                   completion(self.listaDeFilmes)
//                }
//                break
//            case .failure:
//                print(response.error!)
//                completion(self.listaDeFilmes)
//                break
//            }
//        }
//    }
    
//
//    func recuperaDetalhesAPI(_ filmeSelecionado: Filme, completion:@escaping(_ filmeDetalhado: Filme) -> Void) {
//        let id = String(filmeSelecionado.id)
//        Alamofire.request("https://api.themoviedb.org/3/movie/\(id)?api_key=6f6ac16c48e86c7c1e800a462c1c1c4b&language=pt-BR", method: .get).responseJSON { (response) in
//            switch response.result {
//            case .success:
//                if let filme = response.result.value as? Dictionary<String,Any> {
//                    guard let filmeDetalhado = self.salvaDetalhes(filme, filmeSelecionado) else {return}
//                    completion(filmeDetalhado)
//                }
//                break
//            case .failure:
//                print(response.error!)
//                guard let filmeDetalhado = self.filmeDetalhado else {return}
//                completion(filmeDetalhado)
//                break
//            }
//       }
//    }
//
//    // MARK: - Métodos
//
//    func salvaDetalhes(_ dicionarioFilme: Dictionary<String,Any>, _ filmeSelecionado: Filme) -> Filme? {
//        guard let tituloOriginal = dicionarioFilme["original_title"] as? String else {return nil}
//        guard let rating = dicionarioFilme["vote_average"] as? Double else {return nil}
//        guard let sinopse = dicionarioFilme["overview"] as? String else {return nil}
//        guard let imagem = dicionarioFilme["backdrop_path"] as? String else {return nil}
//        let caminhoImagem = "https://image.tmdb.org/t/p/w500\(imagem)"
//        filmeSelecionado.detalhes.tituloOriginal = tituloOriginal
//        filmeSelecionado.detalhes.rating = rating
//        filmeSelecionado.detalhes.sinopse = sinopse
//        filmeSelecionado.detalhes.caminhoImagem = caminhoImagem
//        return filmeSelecionado
//    }

//
//    func salvaFilme(_ dicionarioFilme: Dictionary<String,Any>) {
//        guard let filme = retornaFilme(dicionarioFilme) else {return}
//        listaDeFilmes.append(filme)
//    }
//
//    func retornaFilme(_ dicionarioFilme: Dictionary<String,Any>) -> Filme? {
//        guard let id = dicionarioFilme["id"] as? Int else {return nil}
//        guard let titulo = dicionarioFilme["title"] as? String else {return nil}
//        guard let posterPath = dicionarioFilme["poster_path"] as? String else {return nil}
//        let caminhoPoster = "https://image.tmdb.org/t/p/w500\(posterPath)"
//        return Filme(id, titulo, caminhoPoster)
//    }
}
