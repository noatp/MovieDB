//
//  HomeViewModelTests.swift
//  MovieDBTests
//
//  Created by Toan Pham on 5/24/22.
//

import XCTest
@testable import MovieDB

class HomeViewModelTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testGetMovieList(){
        let expectation = expectation(description: "Fetch initial movie list")
        let homeViewModel = HomeViewModel()
        homeViewModel.getMovieList { success in
            if success{
                XCTAssertTrue(homeViewModel.movieListCount() != 0)
            }
            else{
                XCTAssertNotNil(homeViewModel.errorMessage())
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10.0)
    }
    
    func testFetchMoreMovies(){
        let expectation = expectation(description: "Fetch more movie list")
        let homeViewModel = HomeViewModel()
        homeViewModel.fetchMoreMovies { success in
            if success{
                XCTAssertTrue(homeViewModel.movieListCount() != 0)
            }
            else{
                XCTAssertNotNil(homeViewModel.errorMessage())
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10.0)
    }
}
