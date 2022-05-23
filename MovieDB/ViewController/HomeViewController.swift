//
//  ViewController.swift
//  MovieDB
//
//  Created by Toan Pham on 5/23/22.
//

import UIKit
import Kingfisher

class HomeViewController: UIViewController {

    @IBOutlet var tableViewOutlet: UITableView!
    
    private let homeViewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableViewOutlet.register(.init(nibName: "MovieTableViewCell", bundle: .main), forCellReuseIdentifier: "movieCell")
        tableViewOutlet.delegate = self
        tableViewOutlet.dataSource = self
        homeViewModel.getMovieList { success in
            DispatchQueue.main.async {
                if success{
                    self.tableViewOutlet.reloadData()
                }
                else{
                    let uiac = UIAlertController(
                        title: "Error",
                        message: self.homeViewModel.errorMessage()!,
                        preferredStyle: .alert)
                    let ok = UIAlertAction(title: "OK", style: .cancel)
                    uiac.addAction(ok)
                    self.present(uiac, animated: true)
                }
            }
        }
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        homeViewModel.movieListCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableViewOutlet.dequeueReusableCell(withIdentifier: "movieCell") as? MovieTableViewCell ?? MovieTableViewCell()
        
        let movie = homeViewModel.movieAtRow(indexPath.row)
        
        cell.lblTitleOutlet.text = movie.title
        cell.lblPopularityOutlet.text = String(movie.popularity)
        cell.lblReleaseYearOutlet.text = movie.releaseDate
        cell.imageViewOutlet.kf.setImage(with: homeViewModel.movieThumbnailURLAtRow(indexPath.row))
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = UIStoryboard(name: "Main", bundle: .main).instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController ?? DetailViewController()
        vc.movieId = homeViewModel.movieAtRow(indexPath.row).id
        navigationController?.pushViewController(vc, animated: true)
    }
}

