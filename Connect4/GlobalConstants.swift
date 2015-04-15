//
//  GlobalConstants.swift
//  Connect4
//
//  Created by Stuart McIntosh on 4/4/15.
//  Copyright (c) 2015 Stuart McIntosh. All rights reserved.
//

import Foundation

struct GlobalConstants {
    struct gameType {
        static let manual: NSInteger = 0
        static let computerPlaysRed: NSInteger = 1
        static let computerPlaysYellow: NSInteger = 2
    }
    struct counter {
        static let none: NSInteger = 0
        static let yellow: NSInteger = 1
        static let red: NSInteger = 2
    }
    struct gameState {
        static let inProgress: NSInteger = 0
        static let gameWon: NSInteger = 1
    }
}
