//
//  PostCell.swift
//  instagram-clone
//
//  Created by Rodrigo Bell on 3/5/17.
//  Copyright © 2017 Rodrigo Bell. All rights reserved.
//

import UIKit
import ParseUI

class PostCell: UITableViewCell {

    @IBOutlet weak var postPFImageView: PFImageView!
    @IBOutlet weak var captionLabel: UILabel!
    
    var post: PFObject! {
        didSet {
            self.postPFImageView.file = post["media"] as? PFFile
            self.postPFImageView.loadInBackground()
        }
    }

}
