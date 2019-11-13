//
//  HeadlinesProtocols .swift
//  TopHeadlines
//
//  Created by AASSEM Youssef on 11/1/19.
//  Copyright © 2019 TTS. All rights reserved.
//

import Foundation

protocol ViewDelegate: class {
    var presenter: PresenterDelegate? { get }
    func showHeadlines(listHeadline: [Headline])
}
protocol PresenterDelegate: class {
    var view: ViewDelegate? { get }
    func fetchHeadlines()
}
protocol InteractorDelegate: class {
    var networkManager: NetworkManager? { get }
}
protocol WireframeDelegate: class {

}

protocol NetworkManager: class {
    func getHeadlines()
}
