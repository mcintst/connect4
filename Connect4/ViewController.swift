//
//  ViewController.swift
//  Connect4
//
//  Created by Stuart McIntosh on 3/4/15.
//  Copyright (c) 2015 Stuart McIntosh. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    let theGame = GameLogic()
    var theGameType: NSInteger = 0
    
    @IBAction func wasClicked(sender: NSButton) {
    println(sender.tag)

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
                theGame.nextPlayer()
            }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

// set up new game
        
    theGame.gameType = theGameType
    theGame.printCurrentBoard()
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

