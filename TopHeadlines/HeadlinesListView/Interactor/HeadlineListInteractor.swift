//
//  HeadlineListInteractor.swift
//  TopHeadlines
//
//  Created by AASSEM Youssef on 10/12/19.
//  Copyright © 2019 TTS. All rights reserved.
//

import Foundation

class HeadlineListInteractor: HeadlineListInteractorProtocol {
    var presenter: HeadlinePresenterDelegate?

    private var manager: HeadlineNetworkManager?
    func setNetworkManager(networkManager: HeadlineNetworkManager) {
        self.manager = networkManager
    }
    func fetchHeadlineList() {
        guard let networkManager = manager else { return }
        networkManager.fetchHeadlines{ (response,status)  in
            switch status {
            case .success:
                guard let headlinesList = response else { return}
                self.presenter?.didFetchHeadlineList(listHeadlines: headlinesList)
            case .failure:
               self.presenter?.didntFetchHeadlineList()
            }

        }
    }


}
