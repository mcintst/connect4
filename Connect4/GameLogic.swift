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
var boardMap = Array(count:6, repeatedValue:Array(count:7, repeatedValue:0))
    
    func checkForWinningMove(theTag: NSInteger) ->Bool
    {
    var win = false;
    var theRow = NSInteger()
    var theColumn = NSInteger()
    
    (theRow,theColumn) = convertTagToRowColumn(theTag)
    
    println("Row: \(theRow)\tColumn: \(theColumn)")
    
// get array location of last move
// 1. check for a vertical win
// 2. check for a horizontal win
// 3. check for a diagonal win, left to right descending
// 4. check for a diagonal win, left to right ascending
        
    return win
    }

    func convertTagToRowColumn(theTag: NSInteger) -> (NSInteger, NSInteger)
    {
    var theColumn = theTag%10
    var theRow = (theTag-theColumn)/10
    return (theRow,theColumn)
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
        println("\(boardMap[row][0])\t\(boardMap[row][1])\t\(boardMap[row][2])\t\(boardMap[row][3])\t\(boardMap[row][4])\t\(boardMap[row][5])\t\(boardMap[row][6])")
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
    return newTag
    }
}
