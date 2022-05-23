//
//  MovieTableViewCell.swift
//  MovieDB
//
//  Created by Toan Pham on 5/23/22.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    
    @IBOutlet var lblReleaseYearOutlet: UILabel!
    @IBOutlet var lblPopularityOutlet: UILabel!
    @IBOutlet var lblTitleOutlet: UILabel!
    @IBOutlet var imageViewOutlet: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
