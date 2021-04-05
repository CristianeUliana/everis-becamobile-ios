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
            self.setupUI(filmeCodable: detalhesFilme)
            }
        }
    
  



    func setupUI(filmeCodable: DetailsFilms){
        
        let filmeDetalhado = DetalhesViewModel(filmeCodable.title, filmeCodable.originalTitle, "https://image.tmdb.org/t/p/w500\(filmeCodable.backdropPath)", filmeCodable.overview, filmeCodable.voteAverage)
        
//        let filmeDetalhado = DetalhesViewModel("Godzilla vs. Kong", "Godzilla vs. Kong", "https://image.tmdb.org/t/p/w500/jMWkd0fuwbG39eJpzycJzPWMCww.jpg", "In a time when monsters walk the Earth, humanity’s fight for its future sets Godzilla and Kong on a collision course that will see the two most powerful forces of nature on the planet collide in a spectacular battle for the ages.", 8.5)
        
        
        DispatchQueue.main.async {
            self.configuraPagina(filmeDetalhado)
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
