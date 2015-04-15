//
//  GameLogic.swift
//  Connect4
//
//  Created by Stuart McIntosh on 4/4/15.
//  Copyright (c) 2015 Stuart McIntosh. All rights reserved.
//

import Foundation

class GameLogic {

var CurrentGameMoveArray = [NSInteger]()
var gameType = NSInteger()
var gameState = GlobalConstants.gameState.inProgress
var currentPlayer = "Yellow"
var boardMap = Array(count:6, repeatedValue:Array(count:7, repeatedValue:0))
    
func checkForWinningMove(theTag: NSInteger) ->Bool
    {
    var win = false;
    var theRow = NSInteger()
    var theColumn = NSInteger()

    CurrentGameMoveArray.append(theTag)
        
// get array indices of last move
        
    (theRow,theColumn) = convertTagToRowColumn(theTag)

        
//    println("Row: \(theRow)\tColumn: \(theColumn)")
    
// 1. check for a vertical win
        
    for index in 0...2
        {
        if( boardMap[index][theColumn]==boardMap[index+1][theColumn]
            && boardMap[index][theColumn]==boardMap[index+2][theColumn]
            && boardMap[index][theColumn]==boardMap[index+3][theColumn]
            && !(boardMap[index][theColumn]==0) )
                {
                win = true
                }
        }
        
// 2. check for a horizontal win

    for index in 0...3
        {
        if( boardMap[theRow][index]==boardMap[theRow][index+1]
            && boardMap[theRow][index]==boardMap[theRow][index+2]
            && boardMap[theRow][index]==boardMap[theRow][index+3]
            && !(boardMap[theRow][index]==0) )
            {
            win = true
            }
        }
        
// 3. check for a diagonal win, left to right descending
    var colourToMatch = 0
        
    if (currentPlayer=="Yellow")
        {
        colourToMatch=GlobalConstants.counter.yellow
        }
    else
        {
        colourToMatch=GlobalConstants.counter.red
        }

// starting with the location just played, go up and left to find highest coordinate
// then go down and right to find lowest coordinate
// that will give us the bounds for checking
        
        var topRow = theRow
        var topColumn = theColumn
        var bottomRow = theRow
        var bottomColumn = theColumn
        
        var lastRowColumnReached = false
        
        while(lastRowColumnReached==false)
        {
        if (topRow==5 || bottomColumn==0)
            {
            lastRowColumnReached=true
            }
        else
            {
            topRow++
            bottomColumn--
            }
        }

        lastRowColumnReached = false
        
        while(lastRowColumnReached==false)
        {
            if (bottomRow==0 || topColumn==6)
            {
                lastRowColumnReached=true
            }
            else
            {
                bottomRow--
                topColumn++
            }
        }

        println("Bounds: Row \(topRow) - \(bottomRow) Column \(bottomColumn) - \(topColumn)")
        
var consecutiveSameColour = 0
var currentRow = topRow
var currentColumn = bottomColumn
        
for index in 0...(topRow-bottomRow)
    {
    if (boardMap[currentRow][currentColumn]==colourToMatch)
        {
        consecutiveSameColour++
        if (consecutiveSameColour==4)
            {
            return(true)
            }
        }
    else
        {
        consecutiveSameColour=0
        }
    currentRow--
    currentColumn++
    }
        
// 4. check for a diagonal win, left to right ascending
        topRow = theRow
        topColumn = theColumn
        bottomRow = theRow
        bottomColumn = theColumn
        
        lastRowColumnReached = false
        
        while(lastRowColumnReached==false)
        {
            if (topRow==5 || topColumn==6)
            {
                lastRowColumnReached=true
            }
            else
            {
                topRow++
                topColumn++
            }
        }
        
        lastRowColumnReached = false
        
        while(lastRowColumnReached==false)
        {
            if (bottomRow==0 || bottomColumn==0)
            {
                lastRowColumnReached=true
            }
            else
            {
                bottomRow--
                bottomColumn--
            }
        }
        
        println("Bounds: Row \(topRow) - \(bottomRow) Column \(bottomColumn) - \(topColumn)")
        
        consecutiveSameColour = 0
        currentRow = bottomRow
        currentColumn = bottomColumn
        
        for index in 0...(topRow-bottomRow)
        {
            if (boardMap[currentRow][currentColumn]==colourToMatch)
            {
                consecutiveSameColour++
                if (consecutiveSameColour==4)
                {
                    return(true)
                }
            }
            else
            {
                consecutiveSameColour=0
            }
            currentRow++
            currentColumn++
        }
       
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
