//
//  FilmeCollectionViewCell.swift
//  FilmeApp
//
//  Created by Cristiane Goncalves Uliana on 26/03/21.
//  Copyright © 2021 Estudos. All rights reserved.
//

import UIKit
import AlamofireImage

class FilmeCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var celulaFilme: UIImageView!
    
    func configuraCelula(filme:Filme) {
        guard let urlCelula = URL(string: filme.caminhoPoster) else { return }
        celulaFilme.af_setImage(withURL: urlCelula)
        layer.borderWidth = 0.5
        layer.borderColor = UIColor(red: 85.0/255.0, green: 85.0/255.0, blue: 85.0/255.0, alpha: 1).cgColor
        layer.cornerRadius = 8
    }
}
