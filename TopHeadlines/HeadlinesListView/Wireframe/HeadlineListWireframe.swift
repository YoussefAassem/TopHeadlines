//
//  HeadlineListWireframe.swift
//  TopHeadlines
//
//  Created by AASSEM Youssef on 10/12/19.
//  Copyright © 2019 TTS. All rights reserved.
//

import UIKit

class HeadlineListWireframe: HeadlineListWireframeProtocol {
    let detailViewIdentifier = "HeadlineDetailView"
    class func createHeadlineListModule(for view: HeadlineListViewProtocol) {
        let manager: HeadlineNetworkManager = HeadlineService()
        let presenter: HeadlinePresenterDelegate = HeadlineListPresenter() 
        let interactor = HeadlineListInteractor()
        interactor.presenter = presenter
        interactor.setNetworkManager(networkManager: manager)
        presenter.interactor = interactor
        presenter.view = view
        presenter.wireframe = HeadlineListWireframe()
        view.presenter = presenter
    }

    func pushToHeadlineDetail(with headline: Headline,from view: UIViewController) {
        let headlineDetailView = view.storyboard?.instantiateViewController(withIdentifier: detailViewIdentifier) as! HeadlineDetailView
        HeadlineDetailWireframe.createDetailViewModule(for: headline, from: headlineDetailView)
        view.navigationController?.pushViewController(headlineDetailView, animated: true)
    }

}
