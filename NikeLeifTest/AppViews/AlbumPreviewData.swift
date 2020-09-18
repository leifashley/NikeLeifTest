//
//  TestData.swift
//  NikeLeifTest
//
//  Created by Leif Ashley on 9/17/20.
//  Copyright © 2020 Leif Ashley. All rights reserved.
//

import Foundation

/*
 Preview data sample used for building SwiftUI previews
 */
let testData: MusicFeed = fetchMusicTestData()

func fetchMusicTestData() -> MusicFeed {
    let jsonData = musicJsonTestData.data(using: .utf8)!
    var musicFeed: MusicFeed? = nil
    
    let decoder = JSONDecoder()
    do {
        musicFeed = try decoder.decode(MusicFeed.self, from: jsonData)
    } catch {
        print(error)
        // log warning
    }

    return musicFeed ?? MusicFeed()
}

let musicJsonTestData = """
{
    "feed": {
        "title": "Top Songs",
        "id": "https://rss.itunes.apple.com/api/v1/us/apple-music/top-songs/all/10/explicit.json",
        "author": {
            "name": "iTunes Store",
            "uri": "http://wwww.apple.com/us/itunes/"
        },
        "links": [{
            "self": "https://rss.itunes.apple.com/api/v1/us/apple-music/top-songs/all/10/explicit.json"
        }, {
        "alternate": "https://itunes.apple.com/WebObjects/MZStore.woa/wa/viewTop?genreId=34\u{0026}popId=81\u{0026}app=music"
        }],
        "copyright": "Copyright © 2018 Apple Inc. Alla rättigheter förbehålls.",
        "country": "us",
        "icon": "http://itunes.apple.com/favicon.ico",
        "updated": "2020-09-14T02:24:07.000-07:00",
        "results": [{
            "artistName": "Cardi B",
            "id": "1526746984",
            "name": "WAP (feat. Megan Thee Stallion)",
            "collectionName": "WAP (feat. Megan Thee Stallion) - Single",
            "kind": "song",
            "copyright": "℗ 2020 Atlantic Recording Corporation",
            "artistId": "956078923",
            "contentAdvisoryRating": "Explicit",
            "artistUrl": "https://music.apple.com/us/artist/cardi-b/956078923?app=music",
            "artworkUrl100": "https://is4-ssl.mzstatic.com/image/thumb/Music114/v4/16/a8/4d/16a84d61-74f4-0f71-e264-9f2d6a8fb3ef/075679805706.jpg/200x200bb.png",
            "genres": [{
                "genreId": "18",
                "name": "Hip-Hop/Rap",
                "url": "https://itunes.apple.com/us/genre/id18"
            }, {
                "genreId": "34",
                "name": "Music",
                "url": "https://itunes.apple.com/us/genre/id34"
            }],
            "url": "https://music.apple.com/us/album/wap-feat-megan-thee-stallion/1526746980?i=1526746984\u{0026}app=music"
        }, {
            "artistName": "Drake",
            "id": "1527584879",
            "releaseDate": "2020-08-14",
            "name": "Laugh Now Cry Later (feat. Lil Durk)",
            "collectionName": "Laugh Now Cry Later (feat. Lil Durk) - Single",
            "kind": "song",
            "copyright": "OVO; ℗ 2020 OVO, under exclusive license to Republic Records, a division of UMG Recordings, Inc.",
            "artistId": "271256",
            "contentAdvisoryRating": "Explicit",
            "artistUrl": "https://music.apple.com/us/artist/drake/271256?app=music",
            "artworkUrl100": "https://is3-ssl.mzstatic.com/image/thumb/Music124/v4/4f/a8/bd/4fa8bdd3-69c2-02cd-6336-d565a11a67e4/20UMGIM71041.rgb.jpg/200x200bb.png",
            "genres": [{
                "genreId": "18",
                "name": "Hip-Hop/Rap",
                "url": "https://itunes.apple.com/us/genre/id18"
            }, {
                "genreId": "34",
                "name": "Music",
                "url": "https://itunes.apple.com/us/genre/id34"
            }],
            "url": "https://music.apple.com/us/album/laugh-now-cry-later-feat-lil-durk/1527584873?i=1527584879\u{0026}app=music"
        }, {
            "artistName": "Pop Smoke",
            "id": "1521889285",
            "releaseDate": "2020-07-03",
            "name": "For the Night (feat. Lil Baby \u{0026} DaBaby)",
            "collectionName": "Shoot for the Stars Aim for the Moon",
            "kind": "song",
            "copyright": "Victor Victor Worldwide; ℗ 2020 Republic Records, a division of UMG Recordings, Inc. \u{0026} Victor Victor Worldwide",
            "artistId": "1450601383",
            "contentAdvisoryRating": "Explicit",
            "artistUrl": "https://music.apple.com/us/artist/pop-smoke/1450601383?app=music",
            "artworkUrl100": "https://is3-ssl.mzstatic.com/image/thumb/Music124/v4/17/6d/e0/176de0c9-42a6-8741-9d22-6aae00094e1d/20UMGIM55833.rgb.jpg/200x200bb.png",
            "genres": [{
                "genreId": "18",
                "name": "Hip-Hop/Rap",
                "url": "https://itunes.apple.com/us/genre/id18"
            }, {
                "genreId": "34",
                "name": "Music",
                "url": "https://itunes.apple.com/us/genre/id34"
            }],
            "url": "https://music.apple.com/us/album/for-the-night-feat-lil-baby-dababy/1521889004?i=1521889285\u{0026}app=music"
        }, {
            "artistName": "YoungBoy Never Broke Again",
            "id": "1530123020",
            "releaseDate": "2020-09-11",
            "name": "My Window (feat. Lil Wayne)",
            "collectionName": "Top",
            "kind": "song",
            "copyright": "Never Broke Again, LLC / Atlantic Records, ℗ 2020 Artist Partner Group, Inc.",
            "artistId": "1168822104",
            "contentAdvisoryRating": "Explicit",
            "artistUrl": "https://music.apple.com/us/artist/youngboy-never-broke-again/1168822104?app=music",
            "artworkUrl100": "https://is1-ssl.mzstatic.com/image/thumb/Music114/v4/13/d6/e3/13d6e3ac-7a38-c6c3-6566-e027f3735426/075679802378.jpg/200x200bb.png",
            "genres": [{
                "genreId": "18",
                "name": "Hip-Hop/Rap",
                "url": "https://itunes.apple.com/us/genre/id18"
            }, {
                "genreId": "34",
                "name": "Music",
                "url": "https://itunes.apple.com/us/genre/id34"
            }],
            "url": "https://music.apple.com/us/album/my-window-feat-lil-wayne/1530122403?i=1530123020\u{0026}app=music"
        }, {
            "artistName": "YoungBoy Never Broke Again",
            "id": "1530122783",
            "releaseDate": "2020-09-11",
            "name": "Drug Addiction",
            "collectionName": "Top",
            "kind": "song",
            "copyright": "Never Broke Again, LLC / Atlantic Records, ℗ 2020 Artist Partner Group, Inc.",
            "artistId": "1168822104",
            "contentAdvisoryRating": "Explicit",
            "artistUrl": "https://music.apple.com/us/artist/youngboy-never-broke-again/1168822104?app=music",
            "artworkUrl100": "https://is1-ssl.mzstatic.com/image/thumb/Music114/v4/13/d6/e3/13d6e3ac-7a38-c6c3-6566-e027f3735426/075679802378.jpg/200x200bb.png",
            "genres": [{
                "genreId": "18",
                "name": "Hip-Hop/Rap",
                "url": "https://itunes.apple.com/us/genre/id18"
            }, {
                "genreId": "34",
                "name": "Music",
                "url": "https://itunes.apple.com/us/genre/id34"
            }],
            "url": "https://music.apple.com/us/album/drug-addiction/1530122403?i=1530122783\u{0026}app=music"
        }, {
            "artistName": "YoungBoy Never Broke Again",
            "id": "1530123009",
            "releaseDate": "2020-08-13",
            "name": "Kacey Talk",
            "collectionName": "Top",
            "kind": "song",
            "copyright": "Never Broke Again, LLC / Atlantic Records, ℗ 2020 Artist Partner Group, Inc.",
            "artistId": "1168822104",
            "contentAdvisoryRating": "Explicit",
            "artistUrl": "https://music.apple.com/us/artist/youngboy-never-broke-again/1168822104?app=music",
            "artworkUrl100": "https://is1-ssl.mzstatic.com/image/thumb/Music114/v4/13/d6/e3/13d6e3ac-7a38-c6c3-6566-e027f3735426/075679802378.jpg/200x200bb.png",
            "genres": [{
                "genreId": "18",
                "name": "Hip-Hop/Rap",
                "url": "https://itunes.apple.com/us/genre/id18"
            }, {
                "genreId": "34",
                "name": "Music",
                "url": "https://itunes.apple.com/us/genre/id34"
            }],
            "url": "https://music.apple.com/us/album/kacey-talk/1530122403?i=1530123009\u{0026}app=music"
        }, {
            "artistName": "YoungBoy Never Broke Again",
            "id": "1530122786",
            "releaseDate": "2020-09-11",
            "name": "Cross Roads",
            "collectionName": "Top",
            "kind": "song",
            "copyright": "Never Broke Again, LLC / Atlantic Records, ℗ 2020 Artist Partner Group, Inc.",
            "artistId": "1168822104",
            "contentAdvisoryRating": "Explicit",
            "artistUrl": "https://music.apple.com/us/artist/youngboy-never-broke-again/1168822104?app=music",
            "artworkUrl100": "https://is1-ssl.mzstatic.com/image/thumb/Music114/v4/13/d6/e3/13d6e3ac-7a38-c6c3-6566-e027f3735426/075679802378.jpg/200x200bb.png",
            "genres": [{
                "genreId": "18",
                "name": "Hip-Hop/Rap",
                "url": "https://itunes.apple.com/us/genre/id18"
            }, {
                "genreId": "34",
                "name": "Music",
                "url": "https://itunes.apple.com/us/genre/id34"
            }],
            "url": "https://music.apple.com/us/album/cross-roads/1530122403?i=1530122786\u{0026}app=music"
        }, {
            "artistName": "YoungBoy Never Broke Again",
            "id": "1530123160",
            "releaseDate": "2020-08-03",
            "name": "All In",
            "collectionName": "Top",
            "kind": "song",
            "copyright": "Never Broke Again, LLC / Atlantic Records, ℗ 2020 Artist Partner Group, Inc.",
            "artistId": "1168822104",
            "contentAdvisoryRating": "Explicit",
            "artistUrl": "https://music.apple.com/us/artist/youngboy-never-broke-again/1168822104?app=music",
            "artworkUrl100": "https://is1-ssl.mzstatic.com/image/thumb/Music114/v4/13/d6/e3/13d6e3ac-7a38-c6c3-6566-e027f3735426/075679802378.jpg/200x200bb.png",
            "genres": [{
                "genreId": "18",
                "name": "Hip-Hop/Rap",
                "url": "https://itunes.apple.com/us/genre/id18"
            }, {
                "genreId": "34",
                "name": "Music",
                "url": "https://itunes.apple.com/us/genre/id34"
            }],
            "url": "https://music.apple.com/us/album/all-in/1530122403?i=1530123160\u{0026}app=music"
        }, {
            "artistName": "YoungBoy Never Broke Again",
            "id": "1530122788",
            "releaseDate": "2020-09-11",
            "name": "The Last Backyard...",
            "collectionName": "Top",
            "kind": "song",
            "copyright": "Never Broke Again, LLC / Atlantic Records, ℗ 2020 Artist Partner Group, Inc.",
            "artistId": "1168822104",
            "contentAdvisoryRating": "Explicit",
            "artistUrl": "https://music.apple.com/us/artist/youngboy-never-broke-again/1168822104?app=music",
            "artworkUrl100": "https://is1-ssl.mzstatic.com/image/thumb/Music114/v4/13/d6/e3/13d6e3ac-7a38-c6c3-6566-e027f3735426/075679802378.jpg/200x200bb.png",
            "genres": [{
                "genreId": "18",
                "name": "Hip-Hop/Rap",
                "url": "https://itunes.apple.com/us/genre/id18"
            }, {
                "genreId": "34",
                "name": "Music",
                "url": "https://itunes.apple.com/us/genre/id34"
            }],
            "url": "https://music.apple.com/us/album/the-last-backyard/1530122403?i=1530122788\u{0026}app=music"
        }, {
            "artistName": "Pop Smoke",
            "id": "1521889940",
            "releaseDate": "2020-07-03",
            "name": "Mood Swings (feat. Lil Tjay)",
            "collectionName": "Shoot for the Stars Aim for the Moon",
            "kind": "song",
            "copyright": "Victor Victor Worldwide; ℗ 2020 Republic Records, a division of UMG Recordings, Inc. \u{0026} Victor Victor Worldwide",
            "artistId": "1450601383",
            "contentAdvisoryRating": "Explicit",
            "artistUrl": "https://music.apple.com/us/artist/pop-smoke/1450601383?app=music",
            "artworkUrl100": "https://is3-ssl.mzstatic.com/image/thumb/Music124/v4/17/6d/e0/176de0c9-42a6-8741-9d22-6aae00094e1d/20UMGIM55833.rgb.jpg/200x200bb.png",
            "genres": [{
                "genreId": "18",
                "name": "Hip-Hop/Rap",
                "url": "https://itunes.apple.com/us/genre/id18"
            }, {
                "genreId": "34",
                "name": "Music",
                "url": "https://itunes.apple.com/us/genre/id34"
            }],
            "url": "https://music.apple.com/us/album/mood-swings-feat-lil-tjay/1521889004?i=1521889940\u{0026}app=music"
        }]
    }
}
"""
