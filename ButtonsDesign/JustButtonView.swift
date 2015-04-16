//
//  JustButton.swift
//  ButtonsDesign
//
//  Created by Mauricio Lucon on 4/15/15.
//  Copyright (c) 2015 AppFact. All rights reserved.
//

import UIKit

class JustButtonView: UIButton {
    
    // Variáveis
    let onImage = UIImage(named: "justOn.png")
    let offImage = UIImage(named: "justOff.png")
    
    // Propriedade Bool
    var Pressed:Bool = false {
        didSet {
            if Pressed == true {
                self.setImage(onImage, forState: .Normal)
                NSLog("Ligado")
                
            } else {
                self.setImage(offImage, forState: .Normal)
                NSLog("Desligado")
            }
        }
    }
    
    
    
    override func awakeFromNib() {
        self.addTarget(self, action: "BotaoClicado:", forControlEvents: UIControlEvents.TouchUpInside)
        self.Pressed = false
    }
    
    
    
    func BotaoClicado(sender:UIButton) {
        if(sender == self){
            if Pressed == true {
                Pressed = false
            } else{
                Pressed = true
            }
        }
    }
    
    
   
}
