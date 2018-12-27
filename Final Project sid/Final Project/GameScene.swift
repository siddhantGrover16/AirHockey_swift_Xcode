//
//  GameScene.swift
//  Final Project
//
//  Created by Grover, Siddhant on 11/02/17.
//  Copyright © 2017 Grover, Siddhant. All rights reserved.
//

import SpriteKit
import GameplayKit
import UIKit

class GameScene: SKScene, PDelegate{
    
    func force(force: CGVector, fromPlayer player: Player) {
     NSLog("delegate")
        if(player.frame.intersects((ball?.frame)!)){
            self.ball!.physicsBody!.applyImpulse(force)
            //checkball()
            NSLog("collision")
        }}
    
    //--------------------------------
    // trying to  force pass through delegate
//    func force(force: CGVector, fromPlayer player: Player) {
//
//        if (player.frame.intersects((ball?.frame)!))
//        {
//            ball!.physicsBody!.applyImpulse(force)
//            print("reached")
//        }
//
//    }
    //--------------------------------------------
    
    
    var ball : SKShapeNode?// creates the puck
    var player1 : Player?// creates player 1
    var player2 : Player? //  creates player 2
    //var player1Area :CGRect
  //  var scoreLabel: SKLabelNode!
    var background : SKSpriteNode?// sets the background of the scene
    var resetButton :Button1!// creates the reset button
     var playButton :Button!// creates the pray button
   // var dismissButton :Button!
    var  player1score : Int = 0// player 1 score
     var  player2score : Int = 0// player 2 score
    var  round : Int = 0// keeps track of game round
   
   // Some size variables to help position
    let CONTROLSIZE: CGFloat = UIScreen.main.bounds.size.width
    let CONTROLSIZE1: CGFloat = UIScreen.main.bounds.size.height
     let CONTROLSIZE2: CGFloat = UIScreen.main.bounds.size.width/2
     let CONTROLSIZE3: CGFloat = UIScreen.main.bounds.size.height/2
   
    override func didMove(to view: SKView) {
        
        view.isMultipleTouchEnabled = true;//allows both the players to touch the screen and takes in touches from both
    
       // sets the background image of the game
        background = SKSpriteNode(imageNamed: "bariers.jpg")
        background?.size = self.frame.size;
        background?.position = CGPoint(x: CONTROLSIZE2, y: CONTROLSIZE3)
        self.addChild(background!)
        //creates the play button that begins the game
        
        let playButton = Button(defaultButtonImage: "button.png", buttonAction: playGame)
        playButton.position = CGPoint(x: CONTROLSIZE2, y: CONTROLSIZE3)
       addChild(playButton)
        
        // button not used
//        let dismissButton = Button(defaultButtonImage: "b1.png", buttonAction: resetgamescore)
//        dismissButton.position = CGPoint(x: 0.15*CONTROLSIZE, y: 0.15*CONTROLSIZE1)
//        addChild(dismissButton)
//
        
   // Trying to reset the ball once it goes out of the frame,  showing thread errors
        //--------------------------------------------------------------
      //  ballCenter = (ball?.position)!
//        NSLog("uri")
//        if (!bos(node: (ball)!)){
//            NSLog("uri0")
//            resetball()
//             NSLog("uri1")
//        }
//         NSLog("uri2")
        
        // Trying to reset the ball once it goes out of the frame, showing thread errors
        //-------------------------------------------------------------------------
//        if(!frame.contains((ball?.position)!)){
//            NSLog("yes yes yes")
//        }
        
       }
    //-----------------------------------------------------------------------------------------------------------------------------
    //unused methods
// func createLabel(){
//        scoreLabel = SKLabelNode(fontNamed: "Chalkduster")
//       // scoreLabel.text = "\(self.player1) VS \(self.player2) Score : \(self.game.p1) - \(self.game.p2)"
//        scoreLabel.text = "p1 VS p2 : \(self.player1score) - \(self.player2score)"
//        scoreLabel.fontSize = 20.0
//        scoreLabel.fontColor = SKColor.black
//        scoreLabel.horizontalAlignmentMode = .right
//        scoreLabel.position = CGPoint(x: 0.5*CONTROLSIZE2, y:0.85*CONTROLSIZE3)
//        //addChild(scoreLabel)
//
//    }
//    func dbutton(){
//        let dismissButton = Button(defaultButtonImage: "b1.png", buttonAction: resetgamescore)
//        dismissButton.position = CGPoint(x: 0.15*CONTROLSIZE, y: 0.15*CONTROLSIZE1)
//        addChild(dismissButton)
//        //scoreLabel?.removeFromParent()
//        //addChild(resetButton)
//
//    }
    //-----------------------------------------------------------------------------------------------------------------------------
    
    func createLine(){
        let point = CGPoint(x: CONTROLSIZE2,y :CONTROLSIZE3)
        let Size = CGSize(width:CONTROLSIZE, height: 5)
        let line = SKSpriteNode(color: UIColor.green, size: Size)
        line.position = point
        line.colorBlendFactor = 0.3;
        addChild(line)
    }
    func createEdges(){
        let size1 = CGFloat(8.0)
        
        let leftBorder = SKSpriteNode(color: UIColor.green, size: CGSize(width: size1, height: size.height))
        leftBorder.position =  CGPoint(x: size1/2, y: CONTROLSIZE3)
        leftBorder.physicsBody = SKPhysicsBody(rectangleOf: leftBorder.size)
        leftBorder.physicsBody!.isDynamic = false
        addChild(leftBorder)
        //---------------------------------
        let rightBorder = leftBorder.copy() as! SKSpriteNode
        rightBorder.position =   CGPoint(x: size.width - size1/2, y: frame.height/2)
        addChild(rightBorder)
        //---------------------------------
        let size2 = (size.width / 2) - 90
        let size3 = CGSize(width: size2, height: size1)
        
        let sBPhysics = SKPhysicsBody(rectangleOf: size3)
         sBPhysics.isDynamic = false
        
        let bottomLeftBorder =  SKSpriteNode(color: UIColor.green, size: size3)
        bottomLeftBorder.position = CGPoint(x: size2/2, y: size1/2)
        bottomLeftBorder.physicsBody = sBPhysics
        addChild(bottomLeftBorder)
        //---------------------------------
        let bottomRightBorder = bottomLeftBorder.copy() as! SKSpriteNode
        bottomRightBorder.position =  CGPoint(x: size.width - size2/2, y: size1/2)
        addChild(bottomRightBorder)
        //---------------------------------
        let topLeftBorder = bottomLeftBorder.copy() as! SKSpriteNode
        topLeftBorder.position = CGPoint(x: size2/2, y: size.height - size1/2)
        addChild(topLeftBorder)
        //---------------------------------
        let topRightBorder = bottomLeftBorder.copy() as! SKSpriteNode
        topRightBorder.position =  CGPoint(x: size.width - size2/2, y: size.height - size1/2)
        addChild(topRightBorder)
        }
    
    func playerlocations(position :CGPoint,withBoundary boundary:CGRect) -> Player{
        let player = Player(gameArea: boundary)
        player.position = position
        player.delegate = self
         NSLog("P")
        addChild(player)
        return player;
    }
    func resetgamescore() {
       
        NSLog("1" )
        
        if bos(node: ball!){
            self.checkball()
            self.resetball()
            NSLog("2" )
        }}
  
  //-----------------------------------------------------------------------------------------------------------------------------
  func createPlayer(){
    
    //defines a restricted area in which player 1 can play
        let rect = CGRect(x: 0, y: 0, width: CONTROLSIZE, height: CONTROLSIZE3)
        let player1Area = rect
        let  point = CGPoint(x:rect.midX, y:CONTROLSIZE1/4)
        let player1sp = point
        //----------------------------------------------
    
    //defines a restricted area in which player 2 can play
        let rect1 = CGRect(x: 0, y: CONTROLSIZE3, width: CONTROLSIZE, height: CONTROLSIZE1)
        let player2Area = rect1
        let  point1 = CGPoint(x:rect.midX, y:size.height*0.75)
        let player2sp = point1
    //----------------------------------------------
    
        player1 = playerlocations(position: player1sp, withBoundary: player1Area)
        player2 = playerlocations(position: player2sp, withBoundary: player2Area)
        //let player2Area = CGRect(rect)
    }
    
    //---------------------------------
    //unused method
//    func clearboard(){
//        self.removeAllChildren()
//      exit(0)
//       //addChild(playButton!)
//    }
//
    //---------------------------------
    //unused method
    
    //creates the ball
    func resetball(){
      
            let p1 = CGPoint(x: 0, y: 0)
            ball = SKShapeNode()
            let rad : CGFloat = 20.0
            let ballp = CGMutablePath()
            let pi1 = CGFloat(Double.pi)
            ballp.addArc(center: p1, radius: rad, startAngle: 0, endAngle: 2*pi1, clockwise: true)
            ball!.path = ballp
            ball!.lineWidth = 0
            ball!.fillColor = UIColor.red
            
            ball!.physicsBody = SKPhysicsBody(circleOfRadius : rad)
             NSLog("ball")
            
            ball!.physicsBody!.mass = 0.1
            ball!.physicsBody!.affectedByGravity = false
        
            ball!.position = CGPoint(x: CONTROLSIZE2, y: CONTROLSIZE3)
            //let ballCenter = ball?.position
        ball!.physicsBody!.velocity = CGVector(dx: 0, dy: 0)
            
            //if ball!.parent == nil{
        addChild(self.ball!)
            //}
        //---------------------------------
        // showed a thread error
//            if !frame.contains(ballCenter!){//
//                resetball()
//            }
      //  }
        }
    
    
    func playGame(){
        
        let alert: UIAlertController = UIAlertController(title: "How to play", message:
            "  The game is a traditional Air Hockey game \nwhich has two players and a ball. \nThe players continue to play and the moment a player hits the goal.\na reset button shows up which\nresets the ball and \n increments the player score. ", preferredStyle:UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Play", style:
            UIAlertActionStyle.default, handler:
            {(action: UIAlertAction!) -> Void in
                let resetButton = Button1(defaultButtonImage: "reset.png", buttonAction: self.self.resetgamescore)
                resetButton.position = CGPoint(x: 0.15*self.CONTROLSIZE, y: 0.85*self.CONTROLSIZE1)
                self.addChild(resetButton)
                self.createEdges()
                self.createLine()
                self.createPlayer()
               self.resetball()
               self.checkball()

                }))
        self.view?.window?.rootViewController?.present(alert, animated: true, completion: nil)

    }
        
    
    func  checkball(){// method that checks win
//        if ((ball?.position.x)! > frame.maxX && (ball?.position.y)! > frame.maxY) || ((ball?.position.x)! < frame.minX && (ball?.position.y)! < frame.minY){
//            resetball()
//        }
        if ((ball?.position.y)! > frame.maxY) {
            NSLog("Player1")
            let alert: UIAlertController = UIAlertController(title: " Goal", message:
                                    "PLayer1 Scores", preferredStyle:
                                    UIAlertControllerStyle.alert)
            
                            alert.addAction(UIAlertAction(title: "ok", style:
                                UIAlertActionStyle.default, handler:
                                {(action: UIAlertAction!) -> Void in
                                    self.player1score=self.player1score+1
                                    if self.player1score>=3{
                                        print(self.player1score)
                                        
                                        let alert: UIAlertController = UIAlertController(title: " Quit", message:
                                            "PLayer1 wins as \(self.player1score) - \(self.player2score)", preferredStyle:
                                            UIAlertControllerStyle.alert)
                                        alert.addAction(UIAlertAction(title: "Quit", style:
                                            UIAlertActionStyle.default, handler:
                                            {(action: UIAlertAction!) -> Void in
                                                
                                                //self.clearboard()
                                                // System.exit(0)
                                                exit(0)
                                                
                                        }))
                                        self.view?.window?.rootViewController?.present(alert, animated: true, completion: nil)
                                        
                    }
}))
  self.view?.window?.rootViewController?.present(alert, animated: true, completion: nil)
        }
        else if  ((ball?.position.y)! < frame.minY) {
            
            NSLog("Player2")
            let alert: UIAlertController = UIAlertController(title: " Goal", message:
                "PLayer2 Scores", preferredStyle:
                UIAlertControllerStyle.alert)
            
            alert.addAction(UIAlertAction(title: "ok", style:
                UIAlertActionStyle.default, handler:
                {(action: UIAlertAction!) -> Void in
                    self.player2score=self.player2score+1
                    if self.player2score>=3{
                        print(self.player2score)
                        
                        let alert: UIAlertController = UIAlertController(title: " Quit", message:
                            "PLayer2 wins as \(self.player1score) - \(self.player2score)", preferredStyle:
                            UIAlertControllerStyle.alert)
                        alert.addAction(UIAlertAction(title: "Quit", style:
                            UIAlertActionStyle.default, handler:
                            {(action: UIAlertAction!) -> Void in
                                
                                //self.clearboard()
                                // System.exit(0)
                                exit(0)
                                
                        }))
                        self.view?.window?.rootViewController?.present(alert, animated: true, completion: nil)
                        
                        
                    }
                    
            }))
             self.view?.window?.rootViewController?.present(alert, animated: true, completion: nil)
            }
    
    }
    func bos(node :SKShapeNode) -> Bool {// method that checks if ball is in frame
         NSLog("CR")
        return(!frame.contains(node.position))

    }
   
    }



