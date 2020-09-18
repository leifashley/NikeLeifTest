//
//  Data.swift
//  NikeLeifTest
//
//  Created by Leif Ashley on 9/17/20.
//  Copyright © 2020 Leif Ashley. All rights reserved.
//

import Foundation

/*
 Core data model sets used for JSON decoding
 */
struct MusicFeed: Codable {
    var feed: Feed?
}

struct Feed: Codable {
    var title: String?
    var id: String?
    
    var results: [Album]?
}

struct Album: Codable {
    var artistName: String?
    var name: String?
    var artworkUrl100: String?
    
    var genres: [Genere]?
    var releaseDate: String?
    var copyright: String?
    var image: String?
    
    var url: String?
}

struct Genere: Codable {
    var name: String
}

