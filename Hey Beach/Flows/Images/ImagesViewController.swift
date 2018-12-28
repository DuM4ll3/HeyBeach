//
//  ImagesViewController.swift
//  Hey Beach
//
//  Created by Rafael Ferraz on 24/12/18.
//  Copyright © 2018 Rafael Ferraz. All rights reserved.
//

final class ImagesViewController: UIViewController, ImagesView {
    
    // MARK: - Private
    private var imagesDataSource: ImagesDataSource? {
        didSet {
            imagesTableView.dataSource = imagesDataSource
            imagesTableView.reloadData()
        }
    }
    
    private var shouldLoadMore = false
    private var nextPage = 1
    
    // MARK: - ImagesView
    // MARK: Inputs
    var onLoadMoreImages: ((Int) -> Void)?
    // MARK: Outputs
    func display(_ images: [Image]) {
        // don't do nothing if images is empty
        // & stop loading more
        guard images.isEmpty == false else {
            shouldLoadMore = false
            return
        }
        // if dataSource's images is not empty append more and reload the respective rows
        if let dataSource = imagesDataSource, dataSource.images.isEmpty == false {
            dataSource.images.append(contentsOf: images)
            imagesTableView.reloadData()
        }
        
        if imagesDataSource == nil {
            imagesDataSource = ImagesDataSource(images: images)
        }
        
        shouldLoadMore = true
    }
    
    // MARK: - ViewController
    @IBOutlet var imagesTableView: UITableView!
}

extension ImagesViewController: UITableViewDelegate {

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard shouldLoadMore else { return }

        let actualPosition = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height - scrollView.frame.height + 10

        if actualPosition > contentHeight {
            shouldLoadMore = false
            onLoadMoreImages?(nextPage)
            print("Loading more images at page \(nextPage)")
            nextPage += 1
        }
    }
}
