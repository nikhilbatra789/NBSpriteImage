//
//  ViewController.swift
//  NBSpriteImage
//
//  Created by nikhilbatra789 on 09/11/2017.
//  Copyright (c) 2017 nikhilbatra789. All rights reserved.
//

import UIKit
import NBSpriteImage

class ViewController: UIViewController {

    @IBOutlet weak var sampleImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //Image Source: Google
        let image = UIImage(named: "spriteSheet")!
        self.sampleImageView.animateWithSpriteSheet(spriteSheet: image, spriteSize: CGSize(width: 48, height: 92), fps: 15)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

