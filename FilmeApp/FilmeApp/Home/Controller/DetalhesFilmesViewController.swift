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
        
        requisicao.recuperaDetalhesAPI(filme) { (filmeDetalhado) in
            self.configuraPagina(filmeDetalhado)
            
            }
        
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
//        requisicao.recuperaDetalhesAPI(filmeSelecionado)
    
        
//    }
    
    
    func configuraPagina(_ filmeDetalhado: Filme) {

        

        guard let urlCelula = URL(string: filmeDetalhado.caminhoImagem) else { return }
        imagemFilmeImage.af_setImage(withURL: urlCelula)
        self.nomeFilmeLabel.text = filmeDetalhado.titulo
        self.detalhesFilmeLabel.text = filmeDetalhado.sinopse
        self.tituloOriginalLabel.text = filmeDetalhado.tituloOriginal
        self.ratingFilmeLabel.text = "Rating: \(filmeDetalhado.rating)"

    }

}
