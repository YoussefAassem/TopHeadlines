//
//  Headline.swift
//  TopHeadlines
//
//  Created by AASSEM Youssef on 10/12/19.
//  Copyright © 2019 TTS. All rights reserved.
//

import Foundation

class Headline: Codable {
    var title: String
    var description: String
    var author: String
    var yearOfPublication: String
    private var image: String
    var imageURL: URL {
        get { return URL(string: image)!}
    }

    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        title = try values.decode(String.self, forKey: .title)
        description = try values.decode(String.self, forKey: .description)
        author = try values.decode(String.self, forKey: .author)
        yearOfPublication = try values.decode(String.self, forKey: .yearOfPublication)
        image = try values.decode(String.self, forKey: .imageURL)
    }
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(title, forKey: .title)
        try container.encode(yearOfPublication, forKey: .yearOfPublication)
        try container.encode(description, forKey: .description)
        try container.encode(author, forKey: .author)
        try container.encode(image, forKey: .imageURL)
    }

    enum CodingKeys: String, CodingKey {
        case title = "title"
        case description = "description"
        case author = "author"
        case yearOfPublication = "publishedAt"
        case imageURL = "urlToImage"
    }


}

class HeadlineResponse: Codable {
    var headlines: [Headline]
    var status: String
    var totalResults: Int

    enum CodingKeys: String, CodingKey {
        case headlines = "articles"
        case status
        case totalResults = "totalResults"
    }


    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        headlines = try values.decode([Headline].self, forKey: .headlines)
        status = try values.decode(String.self, forKey: .status)
        totalResults = try values.decode(Int.self, forKey: .totalResults)
    }
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(headlines, forKey: .headlines)
        try container.encode(status, forKey: .status)
        try container.encode(totalResults, forKey: .totalResults)
    }
}
