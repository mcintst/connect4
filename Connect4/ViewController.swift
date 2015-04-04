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
//    let theGameType: NSinteger = 0
    
    @IBAction func wasClicked(sender: NSButton) {
    println(sender.tag)
    var theImage = sender.image!.name()!
    println(theImage)
    
        switch theImage {
        case "WhiteCircle" : sender.image = NSImage(named: "RedCircle")
        case "RedCircle" : sender.image = NSImage(named: "YellowCircle")
        case "YellowCircle" : sender.image = NSImage(named: "WhiteCircle")
        default : println("error")
        }
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        // Do any additional setup after loading the view.
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

