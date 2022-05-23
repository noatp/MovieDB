//
//  ViewController.swift
//  MovieDB
//
//  Created by Toan Pham on 5/23/22.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet var tableViewOutlet: UITableView!
    
    private let homeViewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
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
        let cell = tableViewOutlet.dequeueReusableCell(withIdentifier: "cell") ?? UITableViewCell()
        
        cell.textLabel?.text = homeViewModel.movieTitleAtRow(indexPath.row)
        
        return cell
    }
    
    
}

