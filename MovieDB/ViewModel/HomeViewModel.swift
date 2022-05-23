//
//  HomeViewModel.swift
//  MovieDB
//
//  Created by Toan Pham on 5/23/22.
//

import Foundation


class HomeViewModel{
    private var currentMoviePage: MoviePage?
    private var movieList: [Movie] = []
    private var error: Error?
    private var currentPage: Int = 1
    private var isLoadingMore: Bool = false
    
    func getMovieList(completionHandler: @escaping (_ success: Bool) -> Void){
        APIHandler.shared.getDiscoverMovieList(page: currentPage) { receivedMoviePage, error in
            if let error = error {
                self.error = error
                completionHandler(false)
            }
            else if let receivedMoviePage = receivedMoviePage {
                self.movieList = receivedMoviePage.results
                self.currentMoviePage = receivedMoviePage
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
    
    func movieAtRow(_ index: Int, completionHandler: ((_ success: Bool) -> Void)? = nil) -> Movie{
        if let completionHandler = completionHandler {
            if index == movieList.count - 2{
                print(currentPage, currentMoviePage!.totalPages)
                if currentPage < currentMoviePage!.totalPages {
                    currentPage += 1
                    fetchMoreMovies(completionHandler: completionHandler)
                }
            }
        }
        
        return movieList[index]
    }
    
    func errorMessage() -> String?{
        return error?.localizedDescription
    }
    
    func movieReleaseYearAt(_ index: Int) -> String{
        let releaseDate = movieList[index].releaseDate
        
        return String(releaseDate.dropLast(6))
    }
    
    func fetchMoreMovies(completionHandler: @escaping (_ success: Bool) -> Void){
        print("TRY TO FETCH")
        if !isLoadingMore{
            print("FETCH")
            isLoadingMore = true
            APIHandler.shared.getDiscoverMovieList(page: currentPage) { receivedMoviePage, error in
                if let error = error {
                    self.error = error
                    completionHandler(false)
                    self.isLoadingMore = false
                }
                else if let receivedMoviePage = receivedMoviePage {
                    self.movieList = self.movieList + receivedMoviePage.results
                    self.currentMoviePage = receivedMoviePage
                    completionHandler(true)
                    self.isLoadingMore = false
                }
            }
            
        }
        
    }
}
