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

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    // MARK: - IBOutlets
    
    @IBOutlet weak var colecaoFilmes: UICollectionView!
    
    
    // MARK: - Variáveis
    
    var listaDeFilmes: [Filme] = []
    
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        testeRequisicaoApi()
        colecaoFilmes.delegate = self
        colecaoFilmes.dataSource = self
    }

    // MARK: - Requisição API
    
    func testeRequisicaoApi() {
        Alamofire.request("https://api.themoviedb.org/3/trending/all/week?api_key=6f6ac16c48e86c7c1e800a462c1c1c4b&language=pt-BR", method: .get).responseJSON { (response) in
            switch response.result {
                case .success:
                    if let resposta = response.result.value as? Dictionary<String,Any> {
                        guard let filmes = resposta["results"] as? Array<Dictionary<String, Any>> else {return}
                        
                        for filme in filmes {
                            self.salvaFilme(filme)
                        }
//                        print(self.listaDeFilmes[0].titulo)
//                        print(self.listaDeFilmes[0].caminhoPoster)
//                        print(self.listaDeFilmes[11].titulo)
//                        print(self.listaDeFilmes[11].caminhoPoster)
                        
                        self.colecaoFilmes.reloadData()
                    }
                break
            case .failure:
                print(response.error!)
                break
            }
        }
    }
    
    
    // MARK: - Métodos
    
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
    
                        
    
    
    // MARK: - CollectionView
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        print(listaDeFilmes.count)
        return self.listaDeFilmes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let celulaFilme = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! FilmeCollectionViewCell
        let filmeAtual = listaDeFilmes[indexPath.item]
        celulaFilme.configuraCelula(filme: filmeAtual)
        return celulaFilme
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return UIDevice.current.userInterfaceIdiom == .phone ? CGSize(width: collectionView.bounds.width/2-20, height: 160) : CGSize(width: collectionView.bounds.width/3-20, height: 250)
    }
    
    
    
    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//
//
//
//        let pacote = listaViagens[indexPath.item]
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let controller = storyboard.instantiateViewController(withIdentifier: "detalhes") as! DetalhesViagensViewController
//        controller.pacoteSelecionado = pacote
//        self.navigationController?.pushViewController(controller, animated: true)
//    }
    
    
    
   

}

