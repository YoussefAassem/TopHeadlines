//
//  HeadlineListView.swift
//  TopHeadlines
//
//  Created by AASSEM Youssef on 10/12/19.
//  Copyright © 2019 TTS. All rights reserved.
//

import UIKit

class HeadlineListView: UIViewController, HeadlineListViewProtocol{
    var presenter: HeadlineListPresenterProtocol?
    var listHeadlines: [Headline] = []
    @IBOutlet var collectionView: UICollectionView!
    let cellIdentifier = "headlineCell"
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "HeadlineCollectionViewCell", bundle: .main), forCellWithReuseIdentifier: cellIdentifier)
        HeadlineListWireframe.createHeadlineListModule(for: self)
        presenter?.getHeadlineList()


    }

    func showHeadlineList(list: [Headline]) {
        self.listHeadlines = list
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }

}

extension HeadlineListView: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
         return listHeadlines.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
         let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! HeadlineCollectionViewCell
         let headline = listHeadlines[indexPath.row]
         cell.setupCell(title: headline.title, image: headline.imageURL)
         return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.collectionView.bounds.width * (2/3), height: self.collectionView.bounds.height)
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedHeadline = listHeadlines[indexPath.row]
        presenter?.showHeadlineDetail(for: selectedHeadline, from: self)
    }
     
}

