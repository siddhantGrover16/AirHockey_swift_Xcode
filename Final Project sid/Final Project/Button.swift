//
//  Button.swift
//  Final Project
//
//  Created by Grover, Siddhant on 11/30/17.
//  Copyright © 2017 Grover, Siddhant. All rights reserved.
//

import SpriteKit

class Button: SKNode {
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
       
        defaultButton.isHidden = true
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            
            if defaultButton.contains(location) {
               
                defaultButton.isHidden = true
            } else {
              
                defaultButton.isHidden = true
            }
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            
            if defaultButton.contains(location) {
                defaultButton.removeFromParent()
                
                action()
            }
            
            
            defaultButton.isHidden = false
        }
    }
}
