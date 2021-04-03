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
    
    var requisicao = FilmeAPI()
    var filmeSelecionado: Filme? = nil
    var filmeDetalhado: Filme? = nil
    
    
    //MARK: - LifeCycle
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        self.scrollPrincipal.contentSize = CGSize(width: self.scrollPrincipal.frame.width, height: self.scrollPrincipal.frame.height + 320)
        }
    
    override func viewWillAppear(_ animated: Bool) {
        guard let filme = filmeSelecionado else {return}
        requisicao.recuperaDetalhesAPI(filme) { (filmeDetalhado) in
            DispatchQueue.main.async {
                self.configuraPagina(filmeDetalhado)
            }
        }
    }
    
   
  
    
    func configuraPagina(_ filmeDetalhado: Filme) {
        guard let urlBackdrop = URL(string: filmeDetalhado.detalhes.caminhoImagem) else { return }
        imagemFilmeImage.af_setImage(withURL: urlBackdrop)
        self.nomeFilmeLabel.text = filmeDetalhado.titulo
        self.detalhesFilmeLabel.text = filmeDetalhado.detalhes.sinopse
        self.tituloOriginalLabel.text = filmeDetalhado.detalhes.tituloOriginal
        self.ratingFilmeLabel.text = "Rating: \(filmeDetalhado.detalhes.rating)"
    }
}
