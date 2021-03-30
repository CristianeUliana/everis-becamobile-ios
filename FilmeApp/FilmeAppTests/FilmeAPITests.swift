//
//  FilmeAPITests.swift
//  FilmeAppTests
//
//  Created by Cristiane Goncalves Uliana on 30/03/21.
//  Copyright © 2021 Estudos. All rights reserved.
//

import XCTest
@testable import FilmeApp


class FilmeAPITests: XCTestCase {

    let api = FilmeAPI()
    var listaDeFilmes: [Filme] = []
    var dicionarioFilmes: [Dictionary<String,String>] = []
    

    
    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }
    
    func testPerformanceExample() {
            self.measure {
        }
    }
    
    
    func testDeveIgnorarFilmeSemInformacao() {
       
        let dicionario1: [String:String] = ["id" : "0001", "title" : "teste1", "poster_path" : "/0001.jpg"]
        let dicionario2: [String:String] = ["id" : "", "title" : "teste2", "poster_path" : "/0002.jpg"]
        let dicionario3: [String:String] = ["id" : "0003", "title" : "teste3", "poster_path" : "/0003.jpg"]
        dicionarioFilmes.append(dicionario1)
        dicionarioFilmes.append(dicionario2)
        dicionarioFilmes.append(dicionario3)
        
        for dicionario in dicionarioFilmes {
          
            guard let filme = api.retornaFilme(dicionario) else  {return}
            
            listaDeFilmes.append(filme)
        }
        
        XCTAssertEqual(0001, listaDeFilmes[0].id)
        XCTAssertEqual(0003, listaDeFilmes[1].id)
        XCTAssertEqual(2, listaDeFilmes.count)
        
        
        
        
//        for index in (0...5) {
//            let dicionario: [String:String] = ["id" : "000\(index)", "title" : "teste\(index)", "poster_path" : "/000\(index).jpg"]
//            dicionarioFilmes.append(dicionario)
//        }
        //        guard let id = dicionarioFilme["id"] as? Int else {return}
        //        guard let titulo = dicionarioFilme["title"] as? String else {return}
        //        guard let posterPath = dicionarioFilme["poster_path"] as? String else {return}
        //        let caminhoPoster = "https://image.tmdb.org/t/p/w500\(posterPath)"
        //        let filme = Filme(id, titulo, caminhoPoster)
        //        listaDeFilmes.append(filme)
        
        
    }
    
    
    
    

}
