//
//  Button1.swift
//  Final Project
//
//  Created by Grover, Siddhant on 12/4/17.
//  Copyright © 2017 Grover, Siddhant. All rights reserved.
//

import  SpriteKit

class Button1: SKNode {// creates a CLASS OF SK NODE TYPE
    let defaultButton: SKSpriteNode
    
    var action: () -> ()
    
    init(defaultButtonImage: String, buttonAction: @escaping () -> ()) {
        defaultButton = SKSpriteNode(imageNamed: defaultButtonImage)
        action = buttonAction
        
        
        super.init()
        
        isUserInteractionEnabled = true
        addChild(defaultButton)
        
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        defaultButton.isHidden = false
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            
            if defaultButton.contains(location) {
                
                defaultButton.isHidden = false
            } else {
                
                defaultButton.isHidden = false
            }
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            
            if defaultButton.contains(location) {
               // defaultButton.removeFromParent()
                 defaultButton.isHidden = false
                action()
            }
            
            
            defaultButton.isHidden = false
        }
    }
}
