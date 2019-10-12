//
//  HeadlineDetailPresenter.swift
//  TopHeadlines
//
//  Created by AASSEM Youssef on 10/12/19.
//  Copyright © 2019 TTS. All rights reserved.
//

import Foundation

class HeadlineDetailPresenter: HeadlineDetailPresenterProtocol {
    var view: HeadlineDetailViewProtocol?
    var interactor: HeadlineDetailInteractorProtocol?
    var wireframe: HeadlineDetailWireframeProtocol?
    var headline: Headline?

    func viewDidLoad() {
      view?.showHeadlineDetail(for: headline!)
    }
}
