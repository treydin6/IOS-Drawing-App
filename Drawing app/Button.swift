//
//  Button.swift
//  Drawing app
//
//  Created by Trey Winward on 12/5/19.
//  Copyright © 2019 Trey Winward. All rights reserved.
//

import UIKit

class Button: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpButton()
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUpButton()
    }
    
    func setUpButton() {
        setShadow()
        setTitleColor(.white, for: .normal)
        
        backgroundColor      = UIColor.red
        titleLabel?.font     = UIFont(name: "AvenirNext-DemiBold", size: 18)
        layer.cornerRadius   = 10
        layer.borderWidth    = 3.0
        layer.borderColor    = UIColor.red.cgColor
    }
    
    
    private func setShadow() {
        layer.shadowColor   = UIColor.black.cgColor
        layer.shadowOffset  = CGSize(width: 0.0, height: 6.0)
        layer.shadowRadius  = 8
        layer.shadowOpacity = 0.5
        clipsToBounds       = true
        layer.masksToBounds = false
    }
    
    
    
    
    
}
