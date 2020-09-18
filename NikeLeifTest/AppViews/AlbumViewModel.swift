//
//  ViewModel.swift
//  NikeLeifTest
//
//  Created by Leif Ashley on 9/17/20.
//  Copyright © 2020 Leif Ashley. All rights reserved.
//

import Foundation

/*
 The fetcher pulls back a JSON datasource set of data using a completion handler for async calls that
 update published combine vars for event refresh
 */
public class MusicFeedFetcher: ObservableObject {
    @Published var musicFeed: MusicFeedViewModel = MusicFeedViewModel()
    @Published var isFetching: Bool
    
    init() {
        let datasource = MusicDatasource()
        
        isFetching = true
        datasource.fetchMusicFeed(completion: { (feed) in
            self.isFetching = false
            self.musicFeed = MusicFeedViewModel(musicFeed: feed)            
        })
    }
    
    init(musicFeed: MusicFeed) {
        isFetching = false
        self.musicFeed = MusicFeedViewModel(musicFeed: musicFeed)
    }
}

/******************************************************************************************
 View data  models to process JSON  datamodels into  view ready objects
 *******************************************************************************************/
struct MusicFeedViewModel {
    private let feed: Feed
    
    let title: String
    let albums: [AlbumViewModel]
    
    init(musicFeed: MusicFeed = MusicFeed(), defaultValue: String = "-") {
        self.feed = musicFeed.feed ?? Feed()
        title = feed.title ?? defaultValue
        
        var albums: [AlbumViewModel] = []
        if let results = feed.results {
            for result in results {
                albums.append(AlbumViewModel(album: result))
            }
        }
        
        self.albums = albums
    }
}

struct AlbumViewModel: Identifiable {
    let id = UUID()
    private let album: Album
    
    let releaseDate: String
    let name: String
    let artist: String
    let genres: String
    let copyright: String
    
    let urlString: String
    let artworkUrl: String
    
    init(album: Album = Album(), defaultValue: String = "-") {
        self.album = album
        
        self.releaseDate = album.releaseDate ?? defaultValue
        self.name = album.name ?? defaultValue
        self.artist = album.artistName ?? defaultValue
        
        if let genresArray = album.genres {
            genres = genresArray[0].name
        } else {
            genres = defaultValue
        }
        
        self.copyright = album.copyright ?? defaultValue
        self.urlString = album.url ?? ""
        self.artworkUrl = album.artworkUrl100 ?? ""
    }
}


