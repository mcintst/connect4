//
//  MoveHistory.swift
//  Connect4
//
//  Created by Stuart McIntosh on 5/4/15.
//  Copyright (c) 2015 Stuart McIntosh. All rights reserved.
//

import Foundation

class MoveHistory {

// should contain an array of arrays of winning moves
    
var winningMoves: [[NSInteger]] = [[NSInteger]]()
    
func AddLastGame(theLastMove: [NSInteger])
    {
    winningMoves.append(theLastMove)
    }
}