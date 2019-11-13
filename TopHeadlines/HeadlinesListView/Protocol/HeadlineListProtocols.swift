//
//  HeadlineListProtocols.swift
//  TopHeadlines
//
//  Created by AASSEM Youssef on 10/12/19.
//  Copyright © 2019 TTS. All rights reserved.
//

import Moya

//protocol HeadlineListViewProtocol: class {
//    var presenter: HeadlineListPresenterProtocol? { get set }
//    func showHeadlineList(list: [Headline])
//}
//
//
//
//protocol HeadlineListPresenterProtocol: class {
//    var view: HeadlineListViewProtocol? { get set }
//    var interactor: HeadlineListInteractorProtocol? {get set }
//    var wireframe: HeadlineListWireframeProtocol? { get set }
//
//    func getHeadlineList()
//    func didFetchHeadlineList(listHeadlines: [Headline])
//    func showHeadlineDetail(for headline: Headline, from view: UIViewController)
//}
//
//protocol HeadlineListInteractorProtocol: class {
//    var presenter: HeadlineListPresenterProtocol? { get set }
//    func setNetworkManager(networkManager: HeadlineNetworkManager)
//    func fetchHeadlineList()
//}
//
//protocol HeadlineListWireframeProtocol: class {
//    static func createHeadlineListModule(for view: HeadlineListViewProtocol )
//    func pushToHeadlineDetail(with headline: Headline,from view: UIViewController)
//}
//
//protocol HeadlineNetworkManager: class {
//     var provider: MoyaProvider<HLine>? { get }
//    func fetchHeadlines(completion : @escaping ([Headline]?,CallState) -> Void)
//}

// --------- Delegates ------------------------
protocol HeadlinePresenterDelegate {
    func didFetchHeadlineList(listHeadlines: [Headline])
    func didntFetchHeadlineList()
}
protocol HeadlineViewDelegate {
    func showHeadlineList(list: [Headline])
}

protocol HeadlineInteractorDelegate {
    func fetchHeadlineList()
}

protocol HeadlineListViewProtocol: class {
    var presenter: HeadlineListPresenterProtocol? { get set }
    func showHeadlineList(list: [Headline])
}

// --------- Protocols  ------------------------

protocol HeadlineListPresenterProtocol: class {
    var view: HeadlineViewDelegate? { get set }
    var interactor: HeadlineInteractorDelegate? {get set }
    var wireframe: HeadlineListWireframeProtocol? { get set }

    func getHeadlineList()
    func didFetchHeadlineList(listHeadlines: [Headline])
    func showHeadlineDetail(for headline: Headline, from view: UIViewController)
}

protocol HeadlineListInteractorProtocol: class {
    var presenter: HeadlinePresenterDelegate? { get set }
    func setNetworkManager(networkManager: HeadlineNetworkManager)
    func fetchHeadlineList()
}

protocol HeadlineListWireframeProtocol: class {
    static func createHeadlineListModule(for view: HeadlineListViewProtocol )
    func pushToHeadlineDetail(with headline: Headline,from view: UIViewController)
}

protocol HeadlineNetworkManager: class {
    var provider: MoyaProvider<HLine>? { get }
    func fetchHeadlines(completion : @escaping ([Headline]?,CallState) -> Void)
}



