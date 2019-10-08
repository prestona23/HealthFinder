//
//  ResourceDetailTableViewCell.swift
//  HealthFinder
//
//  Created by Aaron Preston on 10/7/19.
//  Copyright © 2019 Aaron Preston. All rights reserved.
//

import UIKit

class ResourceDetailTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(forSection section: Section?) {
        
        //Check whether both the title and description are nil, and set
        //a default value if they are.
        if section?.title == nil && section?.description == nil {
            titleLabel.text = "Read More About This Topic.."
            subtitleLabel.text = ""
        }
        else {
            titleLabel.text = section?.title ?? ""
            subtitleLabel.text = section?.description ?? ""
        }
    }

}
