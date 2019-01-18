//
//  ViewController.swift
//  GestureControlsSwift
//
//  Created by MACOS on 6/3/17.
//  Copyright © 2017 MACOS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imgv: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //tap Gesture
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handle));
        tap.numberOfTapsRequired=2;
        self.view.addGestureRecognizer(tap);
        
        //longpress Gesture
        let long = UILongPressGestureRecognizer(target: self, action: #selector(self.longpress));
        long.minimumPressDuration=0.6;
        self.view.addGestureRecognizer(long);
        
        //pan Gesture
        let pan=UIPanGestureRecognizer(target: self, action: #selector(self.pang));
        self.imgv.isUserInteractionEnabled=true;
        imgv.addGestureRecognizer(pan);
        
        //pinch Gesture
        let pinch=UIPinchGestureRecognizer(target: self, action: #selector(self.pinchg));
        self.view.addGestureRecognizer(pinch);
        
        //rotation Gesture
        let rot=UIRotationGestureRecognizer(target: self, action: #selector(self.rotg));
        self.view.addGestureRecognizer(rot);
        
        //swipe Gesture
        let left=UISwipeGestureRecognizer(target: self, action: #selector(self.swpg));
        let right=UISwipeGestureRecognizer(target: self, action: #selector(self.swpg));
        
        left.direction=UISwipeGestureRecognizerDirection.left;
        right.direction=UISwipeGestureRecognizerDirection.right;
        
        self.view.addGestureRecognizer(left);
        self.view.addGestureRecognizer(right);
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func handle(sender:UITapGestureRecognizer)
    {
        print("Tapped");
    }
    func longpress(sender:UILongPressGestureRecognizer)
    {
        print("Long Press");
    }
    func pang(sender:UIPanGestureRecognizer)
    {
        self.imgv.center = sender.location(in: self.view);
    }
    func pinchg(sender:UIPinchGestureRecognizer)
    {
        imgv.transform = CGAffineTransform(scaleX: sender.scale, y: sender.scale);
    }
    func rotg(sender:UIRotationGestureRecognizer)
    {
        imgv.transform = CGAffineTransform(rotationAngle: sender.rotation);
    }
    func swpg(sender:UISwipeGestureRecognizer)
    {
        if sender .direction == UISwipeGestureRecognizerDirection.left
        {
            imgv.frame = CGRect(x: self.imgv.frame.origin.x-100, y: self.imgv.frame.origin.y, width: self.imgv.frame.size.width, height: self.imgv.frame.size.height);
        }
            
        else
        {
            imgv.frame = CGRect(x: self.imgv.frame.origin.x+100, y: self.imgv.frame.origin.y, width: self.imgv.frame.size.width, height: self.imgv.frame.size.height);
        }
    }


}

