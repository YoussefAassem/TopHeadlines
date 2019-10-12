//
//  HeadlineListInteractor.swift
//  TopHeadlines
//
//  Created by AASSEM Youssef on 10/12/19.
//  Copyright © 2019 TTS. All rights reserved.
//

import Foundation

class HeadlineListInteractor: HeadlineListInteractorProtocol {
    var presenter: HeadlineListPresenterProtocol?
    var headlineService: HeadlineService?

    init() {
        headlineService = HeadlineService()
    }

    func fetchHeadlineList() {
        headlineService?.fetchHeadlines{ response in
           let listHeadlines = HeadlineHelper.createHeadlineList(params: response)
           self.presenter?.didFetchHeadlineList(listHeadlines: listHeadlines)
        }
    }


}
