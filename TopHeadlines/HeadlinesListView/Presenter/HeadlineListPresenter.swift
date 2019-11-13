//
//  HeadlineListPresenter.swift
//  TopHeadlines
//
//  Created by AASSEM Youssef on 10/12/19.
//  Copyright © 2019 TTS. All rights reserved.
//

import UIKit

class HeadlineListPresenter {
    var wireframe: HeadlineListWireframeProtocol?
    var view: HeadlineViewDelegate?
    var interactor: HeadlineInteractorDelegate?
    func getHeadlineList() {
        interactor?.fetchHeadlineList()
    }

    func didFetchHeadlineList(listHeadlines: [Headline]) {
        view?.showHeadlineList(list: listHeadlines)
    }

      func showHeadlineDetail(for headline: Headline, from view: UIViewController) {
        wireframe?.pushToHeadlineDetail(with: headline, from: view)
    }
}

extension HeadlineListPresenter: HeadlinePresenterDelegate {
    func didntFetchHeadlineList() {
      //  view?.showHeadlineList(list: )
    }


}
