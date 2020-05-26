//
//  ViewController.swift
//  ARTest
//
//  Created by Camilo Cabana on 26/05/20.
//  Copyright © 2020 Camilo Cabana. All rights reserved.
//

import UIKit
import RealityKit

class ViewController: UIViewController {
    
    @IBOutlet var arView: ARView!
    var testAnchor: Test.RoboTest!
    var planeAnchor: Test1.Plane!
    let startButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Load the "Box" scene from the "Experience" Reality File
        testAnchor = try! Test.loadRoboTest()
        planeAnchor = try! Test1.loadPlane()
        // push AR buttons
        testAnchor.generateCollisionShapes(recursive: true)
        // Add the box anchor to the scene
        arView.scene.anchors.append(testAnchor)
        arView.scene.anchors.append(planeAnchor)
        //..
        setStartButton()
    }
    
    func setStartButton() {
        startButton.frame = CGRect(x: view.center.x - 50, y: -50, width: 100, height: 50)
        view.addSubview(startButton)
        startButton.layer.cornerRadius = 25
        startButton.backgroundColor = .white
        startButton.setTitle("Call Friend", for: .normal)
        startButton.setTitleColor(.systemBlue, for: .normal)
        UIView.animate(withDuration: 0.3) {
            self.startButton.frame = CGRect(x: self.view.center.x - 75, y: 50, width: 150, height: 50)
        }
        startButton.addTarget(self, action: #selector(startARTest), for: .touchUpInside)
    }
    
    @objc func startARTest(_ sender: UIButton) {
        //call the animation
        planeAnchor.notifications.plane.post()
        
    }
}
