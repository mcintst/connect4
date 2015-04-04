//
//  StartWindowViewController.swift
//  Connect4
//
//  Created by Stuart McIntosh on 4/4/15.
//  Copyright (c) 2015 Stuart McIntosh. All rights reserved.
//

import Cocoa

class StartWindowViewController: NSViewController {

    
    @IBOutlet weak var gameType: NSMatrix!
    
    @IBAction func PlayGame(sender: NSButton) {
        
        performSegueWithIdentifier("ShowMainWindow" , sender: gameType.selectedRow)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
  
    override func prepareForSegue(segue: NSStoryboardSegue, sender: AnyObject!) {
        if (segue.identifier == "ShowMainWindow") {
            println("Seque Triggered")
            if (sender as! NSInteger == GlobalConstants.gameType.manual)
                {
                println("Manual Game")
            }
            // pass data to next view
        }
    }
    
}
