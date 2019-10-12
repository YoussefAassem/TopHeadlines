//
//  HeadlineService.swift
//  TopHeadlines
//
//  Created by AASSEM Youssef on 10/12/19.
//  Copyright © 2019 TTS. All rights reserved.
//

import Foundation

class HeadlineService {
    let getTopHeadlinesURL = "https://newsapi.org/v2/top-headlines?sources=the-next-web&apiKey=1e720f9e9cd845bea37152f911eb5dd9"
    func fetchHeadlines(completion : @escaping ([String : Any]) -> Void) {
        guard let requestURL = URL(string: getTopHeadlinesURL) else { return }
        let task = URLSession.shared.dataTask(with: requestURL) {
            (data, response, error) in
            print("Description : \(requestURL.description)")
            if error == nil,let usableData = data {
                let json = try? JSONSerialization.jsonObject(with: usableData, options: []) as? [String: Any]
                completion(json ?? [:])
            }
        }
        task.resume()
    }
}
