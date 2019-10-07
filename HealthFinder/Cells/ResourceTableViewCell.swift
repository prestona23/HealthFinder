//
//  ResourceTableViewCell.swift
//  HealthFinder
//
//  Created by Aaron Preston on 10/7/19.
//  Copyright © 2019 Aaron Preston. All rights reserved.
//

import UIKit
import AlamofireImage

class ResourceTableViewCell: UITableViewCell {

    @IBOutlet weak var resourceImageView: UIImageView!
    @IBOutlet weak var resourceTitleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(forResource resource: Resource?) {
        resourceTitleLabel.text = resource?.title ?? ""
        
        if let urlPath = resource?.imageUrl, let url = URL(string: urlPath) {
            resourceImageView.af_setImage(withURL: url)
        }
        
    }

}
