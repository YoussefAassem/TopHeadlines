//
//  HeadlineService.swift
//  TopHeadlines
//
//  Created by AASSEM Youssef on 10/12/19.
//  Copyright © 2019 TTS. All rights reserved.
//

import Moya

enum CallState {
    case success
    case failure
}

class HeadlineService: HeadlineNetworkManager {
    internal var provider: MoyaProvider<HLine>?
    init() {
        self.provider = MoyaProvider<HLine>()
    }

    func fetchHeadlines(completion: @escaping ([Headline]?, CallState) -> Void) {
        provider?.request(.listTopHeadlines) { result in
            switch result {
            case .success(let response):
                do {
                    let data = response.data
                    let listHeadlines = try! JSONDecoder().decode(HeadlineResponse.self, from: data) as HeadlineResponse
                    completion(listHeadlines.headlines,.success)
                } catch {
                    completion(nil,.success)
                }
            case .failure:
                completion(nil, .failure)
            }
        }
    }
}
