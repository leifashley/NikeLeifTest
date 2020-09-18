//
//  AppLogger.swift
//  NikeLeifTest
//
//  Created by Leif Ashley on 9/17/20.
//  Copyright © 2020 Leif Ashley. All rights reserved.
//

import Foundation

/*
 Simple app logger to wrap logging calls so print() doesn't have to get replaced later
 */
protocol AppLogger {
    func debug(_ message: String)
    func warn(_ message: String)
    func error(_ message: String)
}

class BasicLogger: AppLogger {
    func debug(_ message: String) {
        print("DEBUG: \(message)")
    }
    
    func warn(_ message: String) {
        print("WARN: \(message)")
    }
    
    func error(_ message: String) {
        print("ERROR: \(message)")
    }
    
    
}
