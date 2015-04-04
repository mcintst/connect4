//
//  GameLogic.swift
//  Connect4
//
//  Created by Stuart McIntosh on 4/4/15.
//  Copyright (c) 2015 Stuart McIntosh. All rights reserved.
//

import Foundation

class GameLogic {
  
var gameType = NSInteger()
var currentPlayer = "Yellow"
var boardMap = Array(count:7, repeatedValue:Array(count:6, repeatedValue:0))
    
func checkForWinningMove()
    {
    }

func nextPlayer()
    {
        println(currentPlayer);
        if (currentPlayer=="Yellow") { currentPlayer="Red" }
        else { currentPlayer = "Yellow" }
        println(currentPlayer);
    }

func printCurrentBoard()
    {
    for var row = 5; row>=0;row--
        {
        println("\(boardMap[0][row])\t\(boardMap[1][row])\t\(boardMap[2][row])\t\(boardMap[3][row])\t\(boardMap[4][row])\t\(boardMap[5][row])\t\(boardMap[6][row])")
        }
    }
}
