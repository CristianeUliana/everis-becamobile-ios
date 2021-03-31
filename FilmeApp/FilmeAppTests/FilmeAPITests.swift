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
    var dicionarioFilmes: [Dictionary<String,Any>] = []
    
    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }
    
//    func testPerformanceExample() {
//            self.measure {
//        }
//    }
    
    
    func testDeveIgnorarFilmeSemInformacao() {
       
        let dicionario1: [String:Any] = ["id" : "0001", "title" : "teste1", "poster_path" : "/0001.jpg"]
        let dicionario2: [String:Any] = ["id" : "", "title" : "teste2", "poster_path" : "/0002.jpg"]
        let dicionario3: [String:Any] = ["id" : "0003", "title" : "teste3", "poster_path" : "/0003.jpg"]
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
    }
    
    
    func testDeveAceitarApenasIdNumerico() {
        let dicionario1: [String:Any] = ["id" : "0001", "title" : "teste1", "poster_path" : "/0001.jpg"]
        let dicionario2: [String:Any] = ["id" : "abc", "title" : "teste2", "poster_path" : "/0002.jpg"]
        let dicionario3: [String:Any] = ["id" : "0003", "title" : "teste3", "poster_path" : "/0003.jpg"]
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
    }
    
}
