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
        APIHandler.shared.getData { receivedMovieList, error in
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
    
    func movieTitleAtRow(_ index: Int) -> String{
        return movieList[index].title
    }
    
    func errorMessage() -> String?{
        return error?.localizedDescription
    }
}
