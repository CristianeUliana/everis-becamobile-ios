//
//  DetalhesFilmesViewController.swift
//  FilmeApp
//
//  Created by Cristiane Goncalves Uliana on 27/03/21.
//  Copyright © 2021 Estudos. All rights reserved.
//

import UIKit

class DetalhesFilmesViewController: UIViewController {

    @IBOutlet weak var nomeFilmeLabel: UILabel!
    @IBOutlet weak var imagemFilmeImage: UIImageView!
    @IBOutlet weak var detalhesFilmeLabel: UILabel!
    @IBOutlet weak var ratingFilmeLabel: UILabel!
    
    var filmeSelecionado: Filme? = nil
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let filme = filmeSelecionado {
            guard let urlCelula = URL(string: filme.caminhoImagemDetalhes) else { return }
            imagemFilmeImage.af_setImage(withURL: urlCelula)
            self.nomeFilmeLabel.text = filme.titulo
            self.detalhesFilmeLabel.text = filme.sinopse
            self.ratingFilmeLabel.text = "\(filme.rating)"
        }
    }
}
