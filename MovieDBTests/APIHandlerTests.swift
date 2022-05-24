//
//  APIHandlerTests.swift
//  MovieDBTests
//
//  Created by Toan Pham on 5/23/22.
//

import XCTest
@testable import MovieDB

class APIHandlerTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testGetDiscoverMovieList(){
        let expectation = expectation(description: "Fetch movie list")
        var movieList: [Movie] = []
        APIHandler.shared.getDiscoverMovieList(page: 1) { receivedMoviePage, error in
            if let error = error {
                print("error: \(error)")
            }
            else if let receivedMoviePage = receivedMoviePage {
                movieList = receivedMoviePage.results
                expectation.fulfill()
            }
        }
        wait(for: [expectation], timeout: 10.0)
        XCTAssertTrue(!movieList.isEmpty)
        XCTAssertTrue(movieList.count == 20)
    }
    
    func testGetMovieDetail(){
        let expectation = expectation(description: "Fetch movie detail")
        var movie: Movie? = nil
        APIHandler.shared.getMovieDetail(movieId: 752623) { receivedMovie, error in
            if let error = error {
                print("error: \(error)")
            }
            else if let receivedMovie = receivedMovie {
                movie = receivedMovie
                expectation.fulfill()
            }
        }
        wait(for: [expectation], timeout: 10.0)
        XCTAssertNotNil(movie)
        XCTAssertEqual(movie?.title, "The Lost City")
        XCTAssertNotNil(movie?.runtime)
        XCTAssertNotNil(movie?.homepage)
    }

}
