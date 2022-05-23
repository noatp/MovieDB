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
    
    var movieId: Int?
    private let detailViewModel = DetailViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let movieId = movieId else {
            return
        }

        detailViewModel.getMovieDetailWithId(movieId) { success in
            DispatchQueue.main.async {
                if success{
                    let movieDetail = self.detailViewModel.movieDetail()
                    self.lblTitleOutlet.text = movieDetail.title
                    self.lblPopularityOutlet.text = String(movieDetail.popularity)
                    self.lblReleaseDateOutlet.text = movieDetail.releaseDate
                    self.lblOverviewOutlet.text = movieDetail.overview
                    self.lblRuntimeOutlet.text = String(movieDetail.runtime ?? -1)
                    self.lblLinkOutlet.text = movieDetail.homepage
                    self.imageViewOutlet.kf.setImage(with: self.detailViewModel.movieBackdropURL())
                }
                else{
                    let uiac = UIAlertController(
                        title: "Error",
                        message: self.detailViewModel.errorMessage()!,
                        preferredStyle: .alert)
                    let ok = UIAlertAction(title: "OK", style: .cancel)
                    uiac.addAction(ok)
                    self.present(uiac, animated: true)
                }
            }
            
        }

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
