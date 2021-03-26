//
//  ViewController.swift
//  FilmeApp
//
//  Created by Cristiane Goncalves Uliana on 26/03/21.
//  Copyright © 2021 Estudos. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class ViewController: UIViewController {

    
    var listaDeFilmes: [Filme] = []
    
    //teste requisição API
    
    
   // https://api.themoviedb.org/3/trending/all/week?api_key=6f6ac16c48e86c7c1e800a462c1c1c4b&language=pt-BR/v9XwEXYWpxt2rpkmFBiQ1zeyKUy.jpg
    

    
    func testeRequisicaoApi() {
        Alamofire.request("https://api.themoviedb.org/3/trending/all/week?api_key=6f6ac16c48e86c7c1e800a462c1c1c4b&language=pt-BR", method: .get).responseJSON { (response) in
            switch response.result {
                case .success:
                    
//                    var caminhoDoFilme:[Any] = []
//                    var movieId:[Any] = []
//
                    if let resposta = response.result.value as? Dictionary<String,Any> {
                        guard let filmes = resposta["results"] as? Array<Dictionary<String, Any>> else {return}
                        
                        for filme in filmes {
                            
                           
                            
                            self.salvaFilme(filme)
                            
                            
//                            guard let id = filme["id"] else {return}
//                            guard let caminho = filme["poster_path"] else {return}
//                            caminhoDoFilme.append(caminho)
//                            movieId.append(id)
                        }
                        
                        print(self.listaDeFilmes[0].titulo)
                        print(self.listaDeFilmes[0].caminhoPoster)
                        print(self.listaDeFilmes[11].titulo)
                        print(self.listaDeFilmes[11].caminhoPoster)
                        
//
//                        print(movieId)
//                        print(caminhoDoFilme)
                    }
                    
                break
            case .failure:
                print(response.error!)
                break
            }
        }
        
    }
    
    
    func salvaFilme(_ dicionarioFilme: Dictionary<String,Any>) {
        
        
        guard let id = dicionarioFilme["id"] as? Int else {return}
        guard let titulo = dicionarioFilme["title"] as? String else {return}
        guard let rating = dicionarioFilme["vote_average"] as? Double else {return}
        guard let sinopse = dicionarioFilme["overview"] as? String else {return}
        guard let posterPath = dicionarioFilme["poster_path"] as? String else {return}
        let caminhoPoster = "https://image.tmdb.org/t/p/w500\(posterPath)"
        
        let filme = Filme(id, titulo, rating, sinopse, caminhoPoster)
        listaDeFilmes.append(filme)
        
       
        
    }
    
    
    
    
                        
                        
                        
//                        https://image.tmdb.org/t/p/w500
//                        poster_path
                    
                        
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        testeRequisicaoApi()
    }


}

