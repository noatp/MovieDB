//
//  APIHandler.swift
//  MovieDB
//
//  Created by Toan Pham on 5/23/22.
//

import Foundation

class APIHandler{
    
    static let shared: APIHandler = .init()
    
    private let discoverURLString = "https://api.themoviedb.org/3/discover/movie?api_key=\(apiKey)"
    
    private init(){}
    
    func getDiscoverMovieList(completionHandler: @escaping ([Movie]?, Error?) -> Void){
        guard let discoverURL = URL(string: discoverURLString) else{
            print("\(#fileID) \(#function) Could not get URL from string provided")
            return
        }
        let urlRequest = URLRequest(url: discoverURL)
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            if let error = error {
                print("\(#fileID) \(#function) fetching error")
                completionHandler(nil, error)
                return
            }
            guard let httpResponse = response as? HTTPURLResponse,
                    (200...299).contains(httpResponse.statusCode) else {
                print("\(#fileID) \(#function) \(response.debugDescription)")
                return
            }
            if let data = data {
                do{
                    let requestResult = try JSONDecoder().decode(FetchResult.self, from: data)
                    let movieList = requestResult.results
                    completionHandler(movieList, nil)
                }
                catch{
                    print("\(#fileID) \(#function) error")
                    completionHandler(nil, error)
                }
            }
        }.resume()
    }
    func getMovieDetail(movieId: Int, completionHandler: @escaping (Movie?, Error?) -> Void){
        guard let movieURL = URL(string: "https://api.themoviedb.org/3/movie/\(movieId)?api_key=\(apiKey)") else{
            print("\(#fileID) \(#function) Could not get URL from string provided")
            return
        }
        let urlRequest = URLRequest(url: movieURL)
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            if let error = error {
                print("\(#fileID) \(#function) fetching error")
                completionHandler(nil, error)
                return
            }
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                print("\(#fileID) \(#function) \(response.debugDescription)")
                return
            }
            if let data = data {
                do{
                    let requestResult = try JSONDecoder().decode(Movie.self, from: data)
                    let movie = requestResult
                    completionHandler(movie, nil)
                }
                catch{
                    print("\(#fileID) \(#function) error")
                    completionHandler(nil, error)
                }
            }
        }.resume()
    }
}
