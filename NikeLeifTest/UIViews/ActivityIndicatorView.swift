//
//  ActivityIndicatorView.swift
//  NikeLeifTest
//
//  Created by Leif Ashley on 9/17/20.
//  Copyright © 2020 Leif Ashley. All rights reserved.
//

import SwiftUI

/*
 For iOS 13, must use a custom ActivityIndicatorView for a progress spinenr.
 iOS 14 has SwiftUI support for this but is untested.
 */
struct ActivityIndicatorView: UIViewRepresentable {
    typealias  UIViewType = UIActivityIndicatorView
    @Binding var shouldAnimate: Bool
    
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        return UIActivityIndicatorView()
    }

    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {
        if self.shouldAnimate {
            uiView.startAnimating()
            logger.debug("startAnimating")
        } else {
            uiView.stopAnimating()
            logger.debug("stopAnimating")
        }
    }
}
