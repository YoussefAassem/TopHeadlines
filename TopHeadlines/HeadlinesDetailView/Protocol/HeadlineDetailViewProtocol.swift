//
//  HeadlineDetailViewProtocol.swift
//  TopHeadlines
//
//  Created by AASSEM Youssef on 10/12/19.
//  Copyright © 2019 TTS. All rights reserved.
//

import UIKit

protocol HeadlineDetailViewProtocol: class {
    var presenter: HeadlineDetailPresenterProtocol? { get set }
    func showHeadlineDetail(for headline: Headline)
}

protocol HeadlineDetailPresenterProtocol: class {
    var view: HeadlineDetailViewProtocol? { get set }
    var interactor: HeadlineDetailInteractorProtocol? { get set }
    var wireframe: HeadlineDetailWireframeProtocol? { get set }
    func viewDidLoad()
}

protocol HeadlineDetailInteractorProtocol: class {
    var presenter: HeadlineDetailPresenterProtocol? { get set}
}

protocol HeadlineDetailWireframeProtocol: class {
    static func createDetailViewModule(for headline: Headline, from view: HeadlineDetailViewProtocol)
}
