//
//  Headline.swift
//  TopHeadlines
//
//  Created by AASSEM Youssef on 10/12/19.
//  Copyright © 2019 TTS. All rights reserved.
//

import Foundation

class Headline {
    var title: String!
    var description: String!
    var author: String!
    var yearOfPublication: String!
    private var image: String!
    var imageURL: URL!


    init(attributes: [String:Any]) {
        self.title = (attributes["title"] as! String)
        self.author = (attributes["author"] as! String)
        self.description = (attributes["description"] as! String)
        self.yearOfPublication = (attributes["publishedAt"] as! String)
        self.image = (attributes["urlToImage"] as! String)
        imageURL = URL(string: self.image)
    }
}
