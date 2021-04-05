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
    
    var requisicao = DetalhesAPI()
 //   var filmeDetalhado: DetalhesViewModel? = nil
//    var filmeSelecionado: Filme? = nil
//    var filmeDetalhado: Filme? = nil
    
    var idFilme: Int? 
    
    var filmeSelecionado: FilmesViewModel? = nil
    
    //MARK: - LifeCycle
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        self.scrollPrincipal.contentSize = CGSize(width: self.scrollPrincipal.frame.width, height: self.scrollPrincipal.frame.height + 320)
        }
    
    override func viewWillAppear(_ animated: Bool) {
        guard let idFilme = idFilme else {return}
        requisicao.recuperaDetalhesAPI(idFilme) { (detalhesFilme) in
            let backdropPath = detalhesFilme.backdropPath
            let id = detalhesFilme.id
            let originalTitle = detalhesFilme.originalTitle
            let overview = detalhesFilme.overview
            let voteAverage = detalhesFilme.voteAverage
            let title = detalhesFilme.title
            let caminhoPoster = "https://image.tmdb.org/t/p/w500\(backdropPath)"
            
//            self.filmeDetalhado = DetalhesViewModel(backdropPath: caminhoPoster, id: id, title: title, originalTitle: originalTitle, overview: overview, voteAverage: voteAverage)
            
            DispatchQueue.main.async {
                self.configuraPagina(DetalhesViewModel(backdropPath: caminhoPoster, id: id, title: title, originalTitle: originalTitle, overview: overview, voteAverage: voteAverage))
            }
            
            
        }
    }
  
    
    func configuraPagina(_ filmeDetalhado: DetalhesViewModel) {
        guard let urlCelula = URL(string: filmeDetalhado.backdropPath) else { return }
        imagemFilmeImage.af_setImage(withURL: urlCelula)
        self.nomeFilmeLabel.text = filmeDetalhado.title
        self.detalhesFilmeLabel.text = filmeDetalhado.overview
        self.tituloOriginalLabel.text = filmeDetalhado.originalTitle
        self.ratingFilmeLabel.text = "Rating: \(filmeDetalhado.voteAverage)"
    }
}
