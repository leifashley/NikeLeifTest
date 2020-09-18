//
//  Datasource.swift
//  NikeLeifTest
//
//  Created by Leif Ashley on 9/17/20.
//  Copyright © 2020 Leif Ashley. All rights reserved.
//

import Foundation

/*
 Basic protocol to be extended for generalized network functionality and error handling.
 */
protocol Datasource {

}

extension Datasource {
    internal func fetchJsonData(jsonUrl: String, completion: @escaping (Data) -> Void) {
        if let url = URL(string: jsonUrl) {
            URLSession.shared.dataTask(with: url) {(data, response, error) in
                var resultData: Data?
                
                if let d = data {
                    resultData = d
                } else {
                    logger.warn("Datasource - No Data")
                }
                
                completion(resultData ?? Data())
            }.resume()
        } else {
            logger.error("Datasource has invalid url")
        }
    }
}

/*
 Datasouce for all Music Data
 */
class MusicDatasource: Datasource {
    let musicFeedUrl = "https://rss.itunes.apple.com/api/v1/us/itunes-music/top-albums/all/100/explicit.json"
    
    func fetchMusicFeed(completion: @escaping (MusicFeed) -> Void) {
        fetchJsonData(jsonUrl: musicFeedUrl) { (data) in
            var musicFeed: MusicFeed?
            
            do {
                musicFeed = try JSONDecoder().decode(MusicFeed.self, from: data)
            } catch {
               logger.error("JSON parse error")
            }
            
            DispatchQueue.main.async {
                completion(musicFeed ?? MusicFeed())
            }
        }
    }
}
