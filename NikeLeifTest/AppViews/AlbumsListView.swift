//
//  ContentView.swift
//  NikeLeifTest
//
//  Created by Leif Ashley on 9/15/20.
//  Copyright © 2020 Leif Ashley. All rights reserved.
//

import SwiftUI
import UIKit
import MapKit


/*
 Main UI View. This view suporrts landscape and Spanish locales.
 */
struct AlbumsListView: View {
    //TODO:  add pull to refresh
    @ObservedObject var musicFetcher: MusicFeedFetcher = MusicFeedFetcher()
    
    var body: some View {        
        ZStack(alignment: .center) {
            
            NavigationView {
                List(musicFetcher.musicFeed.albums) { album in
                    NavigationLink(destination: AlbumDetail(album: album)) {
                        AlbumCell(album: album)
                    }
                }
                .navigationBarTitle("Albums")
            }
            .navigationViewStyle(.stack)
            .disabled(musicFetcher.isFetching)
            .blur(radius: musicFetcher.isFetching ? 3 : 0)
            
            
            VStack {
                Text("Loading...")
                ActivityIndicatorView(shouldAnimate: $musicFetcher.isFetching)
            }
            .frame(width: 140, height: 100)
            .background(Color.secondary.opacity(0.6))
            .foregroundColor(Color.primary)
            .cornerRadius(20)
            .opacity(musicFetcher.isFetching ? 1.0 : 0)
        }
        
    }
    
    struct AlbumCell: View {
        var album: AlbumViewModel
        
        var body: some View {
            HStack {
                AsyncImage(url: URL(string: album.artworkUrl))
                .aspectRatio(contentMode: .fill)
                .frame(width: 50, height: 50)
//                Image("SampleAlbum")
//                .resizable()
//                .aspectRatio(contentMode: .fill)
//                .frame(width: 50, height: 50)
//                .padding(1)
                
                VStack(alignment: .leading) {
                    Text(album.name)
                        .font(.headline)
                    Text(album.artist)
                }
                .padding(1)
            }
        }
    }
    
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            AlbumsListView(musicFetcher: MusicFeedFetcher(musicFeed: testData))
            AlbumsListView(musicFetcher: MusicFeedFetcher(musicFeed: testData))
                .environment(\.locale, Locale(identifier: "es"))
                .preferredColorScheme(.dark)
                
        }
    }
}
