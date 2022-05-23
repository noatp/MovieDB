//
//  DetailViewModel.swift
//  MovieDB
//
//  Created by Toan Pham on 5/23/22.
//

import Foundation

class DetailViewModel{
    private var movie: Movie?
    private var error: Error?
    
    func getMovieDetailWithId(_ movieId: Int, completionHandler: @escaping (_ success: Bool) -> Void){
        APIHandler.shared.getMovieDetail(movieId: movieId) { receivedMovie, error in
            if let error = error {
                self.error = error
                completionHandler(false)
            }
            else if let receivedMovie = receivedMovie {
                self.movie = receivedMovie
                completionHandler(true)
            }
        }
    }
    
    func movieDetail() -> Movie{
        return movie!
    }
    
    func errorMessage() -> String?{
        return error?.localizedDescription
    }
    
    func movieBackdropURL() -> URL?{
        guard let backdropPath = movie?.backdropPath else{
            return nil
        }
        let urlString = imageBaseUrl + backdropPath
        return URL(string: urlString)!
    }
}
