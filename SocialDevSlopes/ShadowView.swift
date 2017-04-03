//
//  ShadowView.swift
//  SocialDevSlopes
//
//  Created by Laura Calinoiu on 03/04/2017.
//  Copyright © 2017 Laura Calinoiu. All rights reserved.
//

import UIKit

class ShadowView: UIView {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.shadowColor = UIColor(red: 150/255, green: 150/255, blue: 150/255, alpha: 1.0).cgColor
        layer.shadowOffset = .zero
        layer.shadowRadius = 2.0
        layer.shadowOpacity = 0.8
    }
}
