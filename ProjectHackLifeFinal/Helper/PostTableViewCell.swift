//
//  PostTableViewCell.swift
//  HackLifeElementalAdd
//
//  Created by Abenayan Ketheeswaran on 12/4/19.
//  Copyright © 2019 THE WINDOW SPECIALISTS. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell {

    @IBOutlet weak var titleHack: UILabel!
    @IBOutlet weak var descriptionHack: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func set(post: HackPost){
        titleHack.text = post.title
        descriptionHack.text = post.description
    }
}
