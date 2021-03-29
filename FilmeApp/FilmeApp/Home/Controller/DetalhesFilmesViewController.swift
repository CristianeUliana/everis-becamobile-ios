//
//  DetalhesFilmesViewController.swift
//  FilmeApp
//
//  Created by Cristiane Goncalves Uliana on 27/03/21.
//  Copyright © 2021 Estudos. All rights reserved.
//

import UIKit

class DetalhesFilmesViewController: UIViewController {

    //MARK: - IBOutlets
    
    @IBOutlet weak var nomeFilmeLabel: UILabel!
    @IBOutlet weak var imagemFilmeImage: UIImageView!
    @IBOutlet weak var detalhesFilmeLabel: UILabel!
    @IBOutlet weak var ratingFilmeLabel: UILabel!
    @IBOutlet weak var tituloOriginalLabel: UILabel!
    @IBOutlet weak var scrollPrincipal: UIScrollView!
    
    
    //MARK: - Variáveis
    
    var filmeSelecionado: Filme? = nil
    var requisicao = FilmeAPI()
    var filmeDetalhado: Filme? = nil
    
    
    //MARK: - LifeCycle
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.scrollPrincipal.contentSize = CGSize(width: self.scrollPrincipal.frame.width, height: self.scrollPrincipal.frame.height + 320)
        guard let filme = filmeSelecionado else {return}
        
            print(filme.id)
        
        requisicao.recuperaDetalhesAPI(filme) 
        
//
//            recuperaDetalhes(filme)
//
//            configuraPagina(filme)
//
//            print(filme.id)
//            print(filme.titulo)

        }
    
    
//
//    func recuperaDetalhes(_ filmeSelecionado: Filme) {
//
//        requisicao.recuperaDetalhesAPI(filmeSelecionado) { (filmeDetalhado) in
//
//        }
    
        
//    }
    
    
//    func configuraPagina(_ filme: Filme) {
//
//
//        guard let urlCelula = URL(string: filme.caminhoImagem) else { return }
//        imagemFilmeImage.af_setImage(withURL: urlCelula)
//        self.nomeFilmeLabel.text = filme.titulo
//        self.detalhesFilmeLabel.text = filme.sinopse
//        self.tituloOriginalLabel.text = filme.tituloOriginal
//        self.ratingFilmeLabel.text = "Rating: \(filme.rating)"
//
//    }
//
}
