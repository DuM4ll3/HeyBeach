//
//  ImagesDataSource.swift
//  Hey Beach
//
//  Created by Rafael Ferraz on 27/12/18.
//  Copyright © 2018 Rafael Ferraz. All rights reserved.
//

class ImagesDataSource: NSObject {
    let images: [Image]
    
    init(images: [Image]) {
        self.images = images
    }
}

extension ImagesDataSource: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return images.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "imageCell", for: indexPath) as! ImageViewCell
        let image = images[indexPath.row]
        cell.model = image
        
        return cell
    }
}
