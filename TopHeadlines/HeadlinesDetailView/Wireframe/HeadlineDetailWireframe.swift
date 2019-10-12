//
//  HeadlineDetailWireframe.swift
//  TopHeadlines
//
//  Created by AASSEM Youssef on 10/12/19.
//  Copyright © 2019 TTS. All rights reserved.
//

import UIKit

class HeadlineDetailWireframe: HeadlineDetailWireframeProtocol {
    class func createDetailViewModule(for headline: Headline, from view: HeadlineDetailViewProtocol) {
        let presenter = HeadlineDetailPresenter()
        presenter.view = view
        presenter.wireframe = HeadlineDetailWireframe()
        presenter.headline = headline
        view.presenter = presenter
    }
}
