//
//  ImageViewCell.swift
//  Hey Beach
//
//  Created by Rafael Ferraz on 27/12/18.
//  Copyright © 2018 Rafael Ferraz. All rights reserved.
//

class ImageViewCell: UITableViewCell {
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var thumbImageView: UIImageView!
    
    var model: Image? {
        didSet {
            guard let model = model else { return }
            
            titleLabel.text = model.name
            thumbImageView.downloadImage(model.name)
        }
    }
}
