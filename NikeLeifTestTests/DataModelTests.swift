//
//  NikeLeifTestTests.swift
//  NikeLeifTestTests
//
//  Created by Leif Ashley on 9/15/20.
//  Copyright © 2020 Leif Ashley. All rights reserved.
//

import XCTest
@testable import NikeLeifTest

/*
 This test case is to specifically test the data models that pull possibly bad or missing data from a JSON set.
 The ViewModel and model are tested together for easy of use and because the and UI view data is what matters most.
 */
class DataModelTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testValidData() throws {
        let musicFeed: MusicFeed = fetchMusicTestData(jsonData: musicJsonTestData)
        let feedVM = MusicFeedViewModel(musicFeed: musicFeed)
        
        XCTAssertTrue(feedVM.title == "Top Songs")
        
        XCTAssertTrue(feedVM.albums[0].artist == "Cardi B")
        XCTAssertTrue(feedVM.albums[0].artworkUrl == "https://is4-ssl.mzstatic.com/image/thumb/Music114/v4/16/a8/4d/16a84d61-74f4-0f71-e264-9f2d6a8fb3ef/075679805706.jpg/200x200bb.png")
        XCTAssertTrue(feedVM.albums[0].copyright == "℗ 2020 Atlantic Recording Corporation")
        XCTAssertTrue(feedVM.albums[0].genres == "Hip-Hop/Rap")
        XCTAssertTrue(feedVM.albums[0].name == "WAP (feat. Megan Thee Stallion)")
        XCTAssertTrue(feedVM.albums[0].releaseDate == "-")
    }
    
    func testInValidData() throws {
        let musicFeed: MusicFeed = fetchMusicTestData(jsonData: invalidData)
        let feedVM = MusicFeedViewModel(musicFeed: musicFeed)
        
        XCTAssertTrue(feedVM.title == "-")
        
        XCTAssertTrue(feedVM.albums[0].artist == "-")
        XCTAssertTrue(feedVM.albums[0].artworkUrl == "")
        XCTAssertTrue(feedVM.albums[0].copyright == "-")
        XCTAssertTrue(feedVM.albums[0].genres == "-")
        XCTAssertTrue(feedVM.albums[0].name == "-")
        XCTAssertTrue(feedVM.albums[0].releaseDate == "-")
    }
    
    func fetchMusicTestData(jsonData: String) -> MusicFeed {
        let jsonData = jsonData.data(using: .utf8)!
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
    
    let invalidData = """
    {
        "feed": {
            "titleNOP": "Top Songs",
            "results": [{
                "ZartistName": "Cardi B",
                "Zid": "1526746984",
                "Zname": "WAP (feat. Megan Thee Stallion)",
                "ZcollectionName": "WAP (feat. Megan Thee Stallion) - Single",
                "Zkind": "song",
                "Zcopyright": "℗ 2020 Atlantic Recording Corporation",
                "ZartistId": "956078923",
                "zcontentAdvisoryRating": "Explicit",
                "ZartistUrl": "https://music.apple.com/us/artist/cardi-b/956078923?app=music",
                "ZartworkUrl100": "https://is4-ssl.mzstatic.com/image/thumb/Music114/v4/16/a8/4d/16a84d61-74f4-0f71-e264-9f2d6a8fb3ef/075679805706.jpg/200x200bb.png",
                "zgenres": [{
                    "genreId": "18",
                    "name": "Hip-Hop/Rap",
                    "url": "https://itunes.apple.com/us/genre/id18"
                }, {
                    "genreId": "34",
                    "name": "Music",
                    "url": "https://itunes.apple.com/us/genre/id34"
                }],
                "Zurl": "https://music.apple.com/us/album/wap-feat-megan-thee-stallion/1526746980?i=1526746984\u{0026}app=music"
            }]
        }
    }
    """
    
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
            }]
        }
    }
    """
}
