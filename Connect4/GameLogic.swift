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

func getNextSpaceInColumn(theTag:NSInteger) ->NSInteger
    {
    var newTag = theTag
//  the column number is the ONEs digit of the Tag
    var theColumn = theTag%10
//  now we have the column, check from the bottom to find the next vacant space
   
    var found = false
    var index = 0
    var theRow = -1
    while found == false
        {
        if boardMap[index][theColumn] == 0
            {
// found a vacant space
            theRow = index
            found = true
            if currentPlayer == "Yellow"
                {
                boardMap[index][theColumn] = GlobalConstants.counter.yellow
                }
            else
                {
                boardMap[index][theColumn] = GlobalConstants.counter.red
                }
            }
        index++
        if index > 5
            {
// column is already full. Will return -1
            found = true
            }
        }

    if theRow == -1
        {
        return theRow
        }

    else
        {
// need to create tag corresponding to first open space in clicked column

        newTag = theRow*10+theColumn
        }
    println("NewTag is \(newTag)")
    return newTag
    }
}
