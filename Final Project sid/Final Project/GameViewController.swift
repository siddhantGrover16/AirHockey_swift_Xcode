//
//  GameViewController.swift
//  Final Project
//
//  Created by Grover, Siddhant on 11/22/17.
//  Copyright © 2017 Grover, Siddhant. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let scene = GameScene(size: view.bounds.size)
        let skView = view as! SKView
   skView.showsPhysics = true
        skView.showsFPS = false
        skView.showsNodeCount = false
        skView.ignoresSiblingOrder = false
        scene.scaleMode = .resizeFill
        skView.presentScene(scene)
    }

    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
       return UIInterfaceOrientationMask.portrait
           
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
