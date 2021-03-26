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

    
    //teste requisição API
    
    
   // https://api.themoviedb.org/3/trending/all/week?api_key=6f6ac16c48e86c7c1e800a462c1c1c4b&language=pt-BR/v9XwEXYWpxt2rpkmFBiQ1zeyKUy.jpg
    

    
    func testeRequisicaoApi() {
        Alamofire.request("https://api.themoviedb.org/3/trending/all/week?api_key=6f6ac16c48e86c7c1e800a462c1c1c4b&language=pt-BR", method: .get).responseJSON { (response) in
            switch response.result {
                case .success:
                    
                    var caminhoDoFilme:[Any] = []
                    var movieId:[Any] = []
                    
                    if let resposta = response.result.value as? Dictionary<String,Any> {
                        guard let listaDeFilmes = resposta["results"] as? Array<Dictionary<String, Any>> else {return}
                        
                        for filme in listaDeFilmes {
                            guard let id = filme["id"] else {return}
                            guard let caminho = filme["poster_path"] else {return}
                            caminhoDoFilme.append(caminho)
                            movieId.append(id)
                            
                            print(movieId)
                            print(caminhoDoFilme)
                        }
                    }
                    
                break
            case .failure:
                print(response.error!)
                break
            }
        }
        
    }
                        
                        
                        
//                        https://image.tmdb.org/t/p/w500
//                        poster_path
                    
                        
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        testeRequisicaoApi()
    }


}

