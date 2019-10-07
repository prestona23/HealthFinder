//
//  ContentViewController.swift
//  HealthFinder
//
//  Created by Aaron Preston on 10/7/19.
//  Copyright © 2019 Aaron Preston. All rights reserved.
//

import UIKit

class ContentViewController: UIViewController {
    
    var content: String?

    @IBOutlet weak var contentTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupTextView()
    }
    
    private func setupTextView() {
        guard let data = content?.data(using: .utf8) else {
            return
        }
        
        let options = [NSAttributedString.DocumentReadingOptionKey.documentType: NSAttributedString.DocumentType.html]
        do {
            let attributedString = try NSAttributedString(data: data, options: options, documentAttributes: nil)
            contentTextView.attributedText = attributedString
        } catch {
            contentTextView.text = ""
        }
    }

}
