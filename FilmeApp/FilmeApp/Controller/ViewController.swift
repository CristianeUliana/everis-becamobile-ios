//
//  ViewController.swift
//  FilmeApp
//
//  Created by Cristiane Goncalves Uliana on 26/03/21.
//  Copyright © 2021 Estudos. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UISearchBarDelegate {

    // MARK: - IBOutlets
    
    @IBOutlet weak var colecaoFilmes: UICollectionView!
    @IBOutlet weak var pesquisarFilme: UISearchBar!
    
    
    // MARK: - Variáveis
    
    var listaDeFilmes: [Filme] = []
    var listaDePesquisa: [Filme] = []
    var requisicao = FilmeAPI()
    
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colecaoFilmes.delegate = self
        colecaoFilmes.dataSource = self
        pesquisarFilme.delegate = self
        recuperaFilmes()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    func recuperaFilmes() {
        requisicao.recuperaFilmesAPI() { (listaDeFilmes) in
            self.listaDeFilmes = listaDeFilmes
            self.listaDePesquisa = self.listaDeFilmes
            self.colecaoFilmes.reloadData()
        }
    }
    
    
    // MARK: - CollectionView
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.listaDePesquisa.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let celulaFilme = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! FilmeCollectionViewCell
        let filmeAtual = listaDePesquisa[indexPath.item]
        celulaFilme.configuraCelula(filme: filmeAtual)
        return celulaFilme
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return UIDevice.current.userInterfaceIdiom == .phone ? CGSize(width: collectionView.bounds.width/2-10, height: 210) : CGSize(width: collectionView.bounds.width/3-20, height: 300)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detalhesFilme = listaDePesquisa[indexPath.item]
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "detalhes") as! DetalhesFilmesViewController
        controller.filmeSelecionado = detalhesFilme
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    
    //MARK: - SearchBar
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        listaDePesquisa = listaDeFilmes
        if searchText != "" {
            let filtro = NSPredicate(format: "titulo contains [cd] %@", searchText)
            let listaFiltrada:Array<Filme> = (listaDePesquisa as NSArray).filtered(using: filtro) as! Array
            listaDePesquisa = listaFiltrada
        }
      colecaoFilmes.reloadData()
    }
}

