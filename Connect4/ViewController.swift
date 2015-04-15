//
//  ViewController.swift
//  Connect4
//
//  Created by Stuart McIntosh on 3/4/15.
//  Copyright (c) 2015 Stuart McIntosh. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet weak var statusLabel: NSTextField!
    
    
// initialise a new game
    let theGame = GameLogic()
    var theGameType: NSInteger?
    var myDelegate = NSApplication.sharedApplication().delegate as NSApplicationDelegate!
    
    @IBAction func wasClicked(sender: NSButton) {

// need to identify which column was clicked,
// and identify which button by tag needs to be set
// 
        
        var targetTag = theGame.getNextSpaceInColumn(sender.tag)
        if (targetTag != -1)
            {
// need to get view with targetTag
            
                
            var targetButton = self.view.viewWithTag(targetTag)! as! NSButton
    
                switch theGame.currentPlayer {
                case "Yellow" : targetButton.image = NSImage(named: "YellowCircle")
                case "Red" : targetButton.image = NSImage(named: "RedCircle")
                default : println("error")
                }

                if (theGame.checkForWinningMove(targetTag))
                    {
                    statusLabel.stringValue = "You Win!"
                    }
                
                theGame.nextPlayer()
            }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

// set up new game
// is it manual or computer playing Red or Yellow
    theGame.gameType = theGameType!

// main game loop here
// first move is always Yellow
// exit loop on a win
while(theGame.gameState == GlobalConstants.gameState.inProgress)
    {
// makeYellowMove
// checkgametype if manual just wait
// checkforawin
// makeRedMove
// checkforawin
    }
        
        
//  println("TheGameType: \(theGameType)")
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

