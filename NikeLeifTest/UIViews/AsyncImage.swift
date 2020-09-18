//
//  ImageLoader.swift
//  NikeLeifTest
//
//  Created by Leif Ashley on 9/18/20.
//  Copyright © 2020 Leif Ashley. All rights reserved.
//

import Foundation
import SwiftUI
import UIKit
import Combine

/*
 AsyncImage view that works with the image loader to async fetch an image.
 During fetch, a default image will be shown as a placeholder.
 */
struct AsyncImage<Placeholder: UIImage>: View {
    @ObservedObject private var loader: ImageLoader
    private let placeholder: UIImage
    
    private lazy var defaultImage: UIImage = {
        UIImage(named: "DefaultAlbum") ?? UIImage()
    }()
    
    init(url: URL?, placeholder: UIImage? = nil) {
        loader = ImageLoader(url: url)
        self.placeholder = placeholder ?? UIImage(named: "DefaultAlbum") ?? UIImage()
    }

    var body: some View {
        image
            .resizable()
            .onAppear(perform: loader.load)
            .onDisappear(perform: loader.cancel)
    }
    
    private var image: Image {
        if let i = loader.image {
            return Image(uiImage: i)
        } else {
            return Image(uiImage: placeholder)
        }
    }
}


