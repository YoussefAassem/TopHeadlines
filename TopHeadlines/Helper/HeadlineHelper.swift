//
//  HeadlineHelper.swift
//  TopHeadlines
//
//  Created by AASSEM Youssef on 10/12/19.
//  Copyright © 2019 TTS. All rights reserved.
//

import Foundation

class HeadlineHelper {
    static let responseKey = "articles"
    static func createHeadlineList(params: [String:Any]) -> [Headline] {
        let headlines = params[HeadlineHelper.responseKey] as! [[String:Any]]
        var list: [Headline] = []
        for item in headlines {
            list.append(Headline(attributes: item))
        }
        return list
    }

    static func getFormattedDate(date: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        guard let date = dateFormatter.date(from: date) else { return "" }
        let localFormatter = DateFormatter()
        localFormatter.dateFormat = "MM-dd-yyyy HH:mm"
        return localFormatter.string(from: date)
    }
}
