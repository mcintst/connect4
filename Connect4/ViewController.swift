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
//    var theImage = sender.image!.name()!
//    println(theImage)

        switch theGame.currentPlayer {
        case "Yellow" : sender.image = NSImage(named: "YellowCircle")
        case "Red" : sender.image = NSImage(named: "RedCircle")
        default : println("error")
        }
        theGame.nextPlayer()
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

