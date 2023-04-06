//
//  ViewController.swift
//  SwiftTacToe
//
//  Created by Ryan Stejskal on 4/6/23.
//

import Cocoa

class ViewController: NSViewController {
    @IBOutlet weak var square11: NSButton!
    @IBOutlet weak var square12: NSButton!
    @IBOutlet weak var square13: NSButton!
    @IBOutlet weak var square21: NSButton!
    @IBOutlet weak var square22: NSButton!
    @IBOutlet weak var square23: NSButton!
    @IBOutlet weak var square31: NSButton!
    @IBOutlet weak var square32: NSButton!
    @IBOutlet weak var square33: NSButton!
    @IBOutlet weak var currTurn: NSImageView!
    
    var squares: [NSButton] = []
    var squareValues: [SquareValue] = []
    var turn = SquareValue.X
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        squares = [ square11, square21, square31, square12, square22, square32, square13, square23, square33 ]
        squareValues = Array(repeating: .blank, count: 9)

        if Bool.random() {
            turn = .O
        }

        updateViews()
    }
    
    override var representedObject: Any? {
        didSet {
            // Update the view, if already loaded.
        }
    }
    
    @IBAction func clickSquare(_ sender: NSButton) {
        let s = sender.tag
        if squareValues[s] == .blank {
            squareValues[s] = turn
            if turn == .X {
                turn = .O
            }
            else {
                turn = .X
            }
        }

        updateViews()
    }

    @IBAction func newGame(_ sender: Any) {
        for i in 0 ..< 9 {
            squareValues[i] = .blank
        }
        if Bool.random() {
            turn = .X
        }
        else {
            turn = .O
        }

        updateViews()
    }
    
    func updateViews() {
        for i in 0 ..< 9 {
            switch squareValues[i] {
            case .X:
                squares[i].image = NSImage(named: "xSquare")
            case .O:
                squares[i].image = NSImage(named: "oSquare")
            case .blank:
                squares[i].image = NSImage(named: "blankSquare")
            }
        }

        switch turn {
        case .X:
            currTurn.image = NSImage(named: "xSquare")
        case .O:
            currTurn.image = NSImage(named: "oSquare")
        case .blank:
            currTurn.image = NSImage(named: "blankSquare")
        }
    }
}
