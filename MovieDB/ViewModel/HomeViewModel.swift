//
//  HomeViewModel.swift
//  MovieDB
//
//  Created by Toan Pham on 5/23/22.
//

import Foundation


class HomeViewModel{
    private var movieList: [Movie] = []
    private var error: Error?
    
    func getMovieList(completionHandler: @escaping (_ success: Bool) -> Void){
        APIHandler.shared.getDiscoverMovieList { receivedMovieList, error in
            if let error = error {
                self.error = error
                completionHandler(false)
            }
            else if let receivedMovieList = receivedMovieList {
                self.movieList = receivedMovieList
                completionHandler(true)
            }
            
        }
    }
    
    func movieListCount() -> Int{
        return movieList.count
    }
    
    func movieThumbnailURLAtRow(_ index: Int) -> URL{
        let urlString = imageBaseUrl + movieList[index].posterPath
        return URL(string: urlString)!
    }
    
    func movieAtRow(_ index: Int) -> Movie{
        return movieList[index]
    }
    
    func errorMessage() -> String?{
        return error?.localizedDescription
    }
}
