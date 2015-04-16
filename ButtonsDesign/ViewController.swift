//
//  ViewController.swift
//  ButtonsDesign
//
//  Created by Mauricio Lucon on 4/14/15.
//  Copyright (c) 2015 AppFact. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // Propriedade da View Parar
    @IBOutlet weak var pararAnimation: PararView!
    
    
    // Propriedade do Botao On/Off
    @IBOutlet weak var onOffButtonProp: UIButton!
    
    // Propriedade do Power Button
    @IBOutlet weak var powerButton: PowerButton!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
    }

    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    
    
    
    @IBAction func playAnimation(sender: AnyObject) {
        
        pararAnimation.addPlayAnimation()
        
        
    }
    

    
}

