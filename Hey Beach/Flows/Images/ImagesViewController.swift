//
//  ImagesViewController.swift
//  Hey Beach
//
//  Created by Rafael Ferraz on 24/12/18.
//  Copyright © 2018 Rafael Ferraz. All rights reserved.
//

final class ImagesViewController: UIViewController, ImagesView {
    
    @IBOutlet var imagesTableView: UITableView!
    
    private var images: [Image]? {
        didSet {
            imagesTableView.reloadData()
        }
    }
    
    func display(_ images: [Image]?) {
        self.images = images
    }
}

extension ImagesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return images?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "imageCell", for: indexPath)
        guard let image = images?[indexPath.row] else { return cell }
        
        cell.textLabel?.text = image.name
        return cell
    }
}
