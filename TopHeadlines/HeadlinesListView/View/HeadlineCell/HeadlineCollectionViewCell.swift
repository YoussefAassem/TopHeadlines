//
//  HeadlineCollectionViewCell.swift
//  TopHeadlines
//
//  Created by AASSEM Youssef on 10/12/19.
//  Copyright © 2019 TTS. All rights reserved.
//

import UIKit

class HeadlineCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var headlineImage: UIImageView!
    @IBOutlet weak var headlineTitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        headlineTitle.lineBreakMode = .byWordWrapping
        headlineTitle.numberOfLines = 0
        self.layer.cornerRadius = 8
    }
    func setupCell(title: String, image: URL) {
        headlineImage.load(url: image)
        headlineTitle.text = title
    }

}
