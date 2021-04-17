//
//  ViewController.swift
//  FilmeApp
//
//  Created by Cristiane Goncalves Uliana on 26/03/21.
//  Copyright © 2021 Estudos. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    // MARK: - IBOutlets
    
    @IBOutlet weak var colecaoFilmes: UICollectionView!
    @IBOutlet weak var pesquisarFilme: UISearchBar!
    
    
    // MARK: - Variáveis
    
    var requisicao = FilmeAPI()
    var listaFilmes = [FilmesViewModel]()
    var listaPesquisa = [FilmesViewModel]()
    
    
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
        requisicao.recuperaFilmesAPI() { (resultados) in
            self.setupUI(filmesCodable: resultados)
            
        }
    }
    
  
    
    func setupUI(filmesCodable: [Result]){
        
        for filme in filmesCodable {
            
            let filmeDetalhado = FilmesViewModel(filme.id, "https://image.tmdb.org/t/p/w500\(filme.posterPath)", filme.title)
            listaFilmes.append(filmeDetalhado)
            listaPesquisa = listaFilmes
            DispatchQueue.main.async {
                self.colecaoFilmes.reloadData()
            }
        }
    }
    
    
    
    // MARK: - CollectionView
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.listaPesquisa.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let celulaFilme = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! FilmeCollectionViewCell
        let filmeAtual = listaPesquisa[indexPath.item]
        celulaFilme.configuraCelula(filme: filmeAtual)
        return celulaFilme
    }
    
   
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detalhesFilme = listaPesquisa[indexPath.item]
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "detalhes") as! DetalhesFilmesViewController
        controller.idFilme = detalhesFilme.id
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    

    
  
}


extension ViewController: UICollectionViewDataSource {

}

extension ViewController: UICollectionViewDelegate {

}

extension ViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return UIDevice.current.userInterfaceIdiom == .phone ? CGSize(width: collectionView.bounds.width/2-10, height: 210) : CGSize(width: collectionView.bounds.width/3-20, height: 300)
    }
    
}

extension ViewController: UISearchBarDelegate {
    
    //MARK: - SearchBar
    
    //    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    //        listaPesquisa = listaFilmes
    //
    //        if searchText != "" {
    //            let filtro = NSPredicate(format: "title contains [cd] %@", searchText)
    //            let listaFiltrada:Array<FilmesViewModel> = (listaPesquisa as NSArray).filtered(using: filtro) as! Array
    //            listaPesquisa = listaFiltrada
    //        }
    //        colecaoFilmes.reloadData()
    //    }
    
}
