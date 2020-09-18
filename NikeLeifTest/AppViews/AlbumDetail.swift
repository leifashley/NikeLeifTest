//
//  AlbumDetail.swift
//  NikeLeifTest
//
//  Created by Leif Ashley on 9/17/20.
//  Copyright © 2020 Leif Ashley. All rights reserved.
//

import SwiftUI

struct AlbumDetail: View {
    var album: AlbumViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            AlbumCard(album: album)
            
            Spacer()
            
            Group {
                Button(action: showITunesTapped) {
                    Image(systemName: "music.house")
                    Text("Show in iTunes")
                }
                .frame(minWidth: 40, maxWidth: .infinity)
                .padding(10)
                .foregroundColor(.white)
                .background(LinearGradient(gradient: Gradient(colors: [ Color("LightBlue"), Color("DarkBlue")]), startPoint: .topLeading, endPoint: .bottomTrailing))
                .cornerRadius(10)
            }
            .contentShape(Rectangle())
            .onTapGesture {
                self.showITunesTapped()
            }
            .padding(EdgeInsets(top: 0, leading: 20, bottom: 20, trailing: 20))
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    func showITunesTapped() {
        openMusicUrl(urlString: album.urlString)
    }
    
    func openMusicUrl(urlString: String) {
        guard let defaultUrl = URL(string: urlString), let appStorUrl = URL(string: "itms:\(urlString)") else {
            return //needs error
        }
        
        var targetUrl = defaultUrl
        
        if UIApplication.shared.canOpenURL(appStorUrl) {
            //TODO: iTunes URL does not seem to be working anymore
//            targetUrl = appStorUrl
        }
        
        logger.debug("Opening URL: \(targetUrl)")
        UIApplication.shared.open(targetUrl)
    }
}

struct AlbumCard: View {
    var album: AlbumViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            AsyncImage(url: URL(string: album.artworkUrl))
                .aspectRatio(contentMode: .fill)
                .frame(width: 200, height: 200)
            
            Text(album.name)
                .font(.title)
                .frame(maxWidth: .infinity, alignment: .leading)
                .multilineTextAlignment(.leading)
            
            Text("By \(album.artist)")
                .font(.headline)
            
            Text("\(album.genres) · \(album.releaseDate)")
            Text(album.copyright)
            .padding()
        }
    .navigationBarTitle(album.name)
        .padding()
    }
}

struct AlbumDetail_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            AlbumDetail(album: MusicFeedViewModel(musicFeed: testData).albums[1])
            AlbumDetail(album: MusicFeedViewModel(musicFeed: testData).albums[1])
                .preferredColorScheme(.dark)
                .environment(\.locale, Locale(identifier: "es"))
        }
    }
}
