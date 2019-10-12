//
//  HeadlineDetailView.swift
//  TopHeadlines
//
//  Created by AASSEM Youssef on 10/12/19.
//  Copyright © 2019 TTS. All rights reserved.
//

import UIKit

class HeadlineDetailView: UIViewController, HeadlineDetailViewProtocol {
    var presenter: HeadlineDetailPresenterProtocol?
    
    @IBOutlet var headlineImage: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var authorLabel: UILabel!
    @IBOutlet var yearLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        customizeComponents()
        presenter?.viewDidLoad()
    }
    func customizeComponents() {
        titleLabel.numberOfLines = 0
        titleLabel.lineBreakMode = .byWordWrapping
        descriptionLabel.numberOfLines = 0
        descriptionLabel.lineBreakMode = .byWordWrapping
    }

    func showHeadlineDetail(for headline: Headline) {
        titleLabel.text = headline.title
        descriptionLabel.text = headline.description
        authorLabel.text = headline.author
        yearLabel.text = HeadlineHelper.getFormattedDate(date: headline.yearOfPublication)
        headlineImage.load(url: headline.imageURL)
    }
   

}

