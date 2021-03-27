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

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    // MARK: - IBOutlets
    
    @IBOutlet weak var colecaoFilmes: UICollectionView!
    
    
    // MARK: - Variáveis
    
    var listaDeFilmes: [Filme] = []
    var requisicao = FilmeAPI()
    
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colecaoFilmes.delegate = self
        colecaoFilmes.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        recuperaFilmes()
    }
    
    func recuperaFilmes() {
        requisicao.recuperaFilmesAPI() { (listaDeFilmes) in
            self.listaDeFilmes = listaDeFilmes
            self.colecaoFilmes.reloadData()
        }
    }
    
    
    // MARK: - CollectionView
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.listaDeFilmes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let celulaFilme = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! FilmeCollectionViewCell
        let filmeAtual = listaDeFilmes[indexPath.item]
        celulaFilme.configuraCelula(filme: filmeAtual)
        return celulaFilme
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return UIDevice.current.userInterfaceIdiom == .phone ? CGSize(width: collectionView.bounds.width/2-10, height: 200) : CGSize(width: collectionView.bounds.width/3-20, height: 250)
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

