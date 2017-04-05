//
//  PostCell.swift
//  SocialDevSlopes
//
//  Created by Laura Calinoiu on 05/04/2017.
//  Copyright © 2017 Laura Calinoiu. All rights reserved.
//

import UIKit
class PostCell: UITableViewCell {

    @IBOutlet weak var profileImg: CircleView!
    @IBOutlet weak var usernameLbl: UILabel!
    @IBOutlet weak var postImg: UIImageView!
    @IBOutlet weak var likesLbl: UILabel!
    @IBOutlet weak var caption: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
}
