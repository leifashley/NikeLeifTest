//
//  ImageLoader.swift
//  NikeLeifTest
//
//  Created by Leif Ashley on 9/18/20.
//  Copyright © 2020 Leif Ashley. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

/*
 ImageLoader for async loading  of image data using a given URL
 */
class ImageLoader: ObservableObject {
    //TODO: added datastore cache for NSCache or other LRU caching of images
    
    @Published var image: UIImage?
    
    private let url: URL?
    private var cancellable: AnyCancellable?
    
    init(url: URL?) {
        self.url = url
    }
    
    deinit {
        cancellable?.cancel()
    }

    func load() {
        if let u = url {
            cancellable = URLSession.shared.dataTaskPublisher(for: u)
            .map { UIImage(data: $0.data) }
            .replaceError(with: nil)
            .receive(on: DispatchQueue.main)
            .assign(to: \.image, on: self)
        }
    }
    
    func cancel() {
        cancellable?.cancel()
    }
}
