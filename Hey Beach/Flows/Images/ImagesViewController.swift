//
//  ImagesViewController.swift
//  Hey Beach
//
//  Created by Rafael Ferraz on 24/12/18.
//  Copyright © 2018 Rafael Ferraz. All rights reserved.
//

final class ImagesViewController: UIViewController, ImagesView {
    
    // MARK: - Private
    private var dataSource: UITableViewDataSource? {
        didSet {
            imagesTableView.dataSource = dataSource
            imagesTableView.reloadData()
        }
    }
    
    // MARK: - ImagesView
    // MARK: Outputs
    func display(_ images: [Image]) {
        dataSource = ImagesDataSource(images: images)
    }
    
    // MARK: - ViewController
    @IBOutlet var imagesTableView: UITableView!
}
