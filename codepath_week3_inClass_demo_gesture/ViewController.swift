//
//  ViewController.swift
//  codepath_week3_inClass_demo_gesture
//
//  Created by StudyBlue on 10/25/16.
//  Copyright © 2016 myself. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var bikerImageView: UIImageView!
    var bikerOriginalCenter: CGPoint!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func didTapBiker(_ sender: AnyObject) {
        let alertController = UIAlertController(title: "Back off bro...", message: "Don't tap me.", preferredStyle: .alert)
        let sorryAction = UIAlertAction(title: "Sorry Dude", style: .default, handler: nil)
        alertController.addAction(sorryAction)
        present(alertController, animated: true, completion: nil)
    }

    @IBAction func didPanBiker(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: view)
        
        if sender.state == .began {
            bikerOriginalCenter = bikerImageView.center
            
            //print("Gesture began")
        } else if sender.state == .changed {
            
            bikerImageView.center = CGPoint(x: bikerOriginalCenter.x + translation.x, y: bikerOriginalCenter.y + translation.y)
            //print("Gesture is changing")
            
        } else if sender.state == .ended {
            //print("Gesture ended")
            
        }

    // end didPanBiker
    }
    

    @IBAction func didPinchBiker(_ sender: UIPinchGestureRecognizer) {
        
        let scale = sender.scale
        
        bikerImageView.transform = CGAffineTransform(scaleX: scale, y: scale)
        print (scale)
        
    }
    
    
    @IBAction func didRotate(_ sender: UIRotationGestureRecognizer) {
        
        let rotation = sender.rotation
        
        bikerImageView.transform = CGAffineTransform(rotationAngle: rotation)
    }

}

