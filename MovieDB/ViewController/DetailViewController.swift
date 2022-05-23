//
//  DetailViewController.swift
//  MovieDB
//
//  Created by Toan Pham on 5/23/22.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var imageViewOutlet: UIImageView!
    @IBOutlet var lblTitleOutlet: UILabel!
    @IBOutlet var lblPopularityOutlet: UILabel!
    @IBOutlet var lblReleaseDateOutlet: UILabel!
    @IBOutlet var lblOverviewOutlet: UILabel!
    @IBOutlet var lblRuntimeOutlet: UILabel!
    @IBOutlet var lblLinkOutlet: UILabel!
    
    var movie: Movie?
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        lblTitleOutlet.text = movie?.title
//        lblPopularityOutlet.text = movie?.popularity
//        lblReleaseDateOutlet.text = movie?.releaseDate
//        lblOverviewOutlet.text = movie?.overview
//        lblRuntimeOutlet.text = movie.
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
