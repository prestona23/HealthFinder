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

    override func prepareForReuse() {
        resourceImageView.image = nil
        resourceTitleLabel.text = nil
    }
    
    func configureCell(forResource resource: Resource?) {
        resourceTitleLabel.text = resource?.title ?? ""
        
        if let urlPath = resource?.imageUrl, let url = URL(string: urlPath) {
            resourceImageView.af_setImage(withURL: url)
        }
        
    }

}
