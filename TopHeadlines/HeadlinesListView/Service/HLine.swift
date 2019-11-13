//
//  Headline.swift
//  TopHeadlines
//
//  Created by AASSEM Youssef on 10/25/19.
//  Copyright © 2019 TTS. All rights reserved.
//
import Moya

// Constants
enum HLine {
    static private let apiKey = "1e720f9e9cd845bea37152f911eb5dd9"
    static private let source = "the-next-web"
    static private let sourceParam = "sources"
    static private let apiKeyParam = "apiKey"
    case listTopHeadlines
}

extension HLine: TargetType {
    var baseURL: URL {
        return URL(string: "https://newsapi.org/v2")!
    }

    // Define path to endpoints
    var path: String {
        switch self {
        case .listTopHeadlines: return "/top-headlines"
        }
    }
    // For each path define the used method
    var method: Method {
        switch self {
        case .listTopHeadlines: return .get
        }
    }
    // Define the mocked data
    var sampleData: Data {
        return Data()
    }
    // Define the type of data sent in the request
    var task: Task {
        switch self {
        case .listTopHeadlines :
            let params = [ HLine.sourceParam: HLine.source, HLine.apiKeyParam: HLine.apiKey]
            return .requestParameters(parameters: params, encoding: URLEncoding.queryString )
        }
    }
   // Define the header for each request
    var headers: [String : String]? {
        return ["Content-Type": "application/json"]
    }
    // Define validation type for response
    public var validationType: ValidationType {
        return .successCodes
    }

}
