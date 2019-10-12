//
//  HeadlineListPresenter.swift
//  TopHeadlines
//
//  Created by AASSEM Youssef on 10/12/19.
//  Copyright © 2019 TTS. All rights reserved.
//

import UIKit

class HeadlineListPresenter: HeadlineListPresenterProtocol {
    var view: HeadlineListViewProtocol?
    var interactor: HeadlineListInteractorProtocol?
    var wireframe: HeadlineListWireframeProtocol?

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
