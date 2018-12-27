//
//  Player.swift
//  Final Project
//
//  Created by Grover, Siddhant on 11/22/17.
//  Copyright © 2017 Grover, Siddhant. All rights reserved.
//

import SpriteKit
protocol PDelegate{
    func force(force: CGVector, fromPlayer : Player)
    }

class Player :SKShapeNode{
  
  
    var delegate :PDelegate?// player delegate,used for providing a momentum/impulse for the ball
    let gameArea :CGRect// the area in which the individual players can move
    
    let PlayerTouchSize : CGFloat = 34.0// player size
    
    init(gameArea:CGRect) {
        
   self.gameArea = gameArea
        super.init()
        NSLog("YAYYA")
        self.isUserInteractionEnabled = true
        let Path = CGMutablePath()
        let pi = CGFloat(Double.pi)
        Path.addArc(center: CGPoint(x :0, y:0),radius: PlayerTouchSize, startAngle :0 ,endAngle :2*pi,clockwise : true)
        
        path = Path
        
        fillColor = UIColor.orange
        physicsBody = SKPhysicsBody(circleOfRadius : PlayerTouchSize)
        physicsBody!.mass =  200
        physicsBody!.affectedByGravity = false
        }

    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
       
        var impTouch: UITouch!
        let Touches = Array(touches)
        
        for touch in Touches{
            if impTouch == nil{
                if gameArea.contains(touch.location(in: parent!)){
                    impTouch = touch
                    NSLog("touch A")
                }
            }
            
        }
        if(impTouch != nil){
            
            NSLog("Touch B")
            
            let location = impTouch!.location(in: parent!)
            let prevLocation = impTouch!.previousLocation(in: parent!)
            let xOffset =  location.x - prevLocation.x
            let yOffset = location.y - prevLocation.x
            let Length = (xOffset*xOffset + yOffset*yOffset)
            
            
           
            let velo = 0.01 * Double(Length)/0.02
            
          let velocityCGFloat = CGFloat(velo)
           
          
            let dV = CGVector(dx: velocityCGFloat*xOffset/(Length*2), dy: velocityCGFloat*yOffset/(Length*2))
            
            
            delegate?.force(force: dV, fromPlayer: self)

           // let location = impTouch!.location(in: parent!)
            position = location
            NSLog("Touch done")

            
        }}
    
    
}



