//
//  MovieListCoordinatorTest.swift
//  YassirTaskMoviesTests
//
//  Created by Hazem  on 22.11.23.
//

import Foundation
import XCTest
@testable import YassirTaskMovies

class MovieListCoordinatorTest: BaseTestCase {

    func test_init() {
        given("") {
            when("Initiate MovieListCoordinator") {
                let movieCoordinator = MovieListCoordinator(title: "")
                then("rootViewController and movieListViewController are not nil") {
                    XCTAssertNotNil(movieCoordinator.rootViewController)
                    XCTAssertNotNil(movieCoordinator.movieListViewController)
                }
            }
        }
    }

    func test_start() {
        given("MovieListCoordinator init") {
            let movieCoordinator = MovieListCoordinator(title: "")
            when("calling start") {
                movieCoordinator.start()
                then("viewControllers count is bigger than 0") {
                    let count = movieCoordinator.rootViewController.viewControllers.count
                    XCTAssertTrue(count > 0)
                }
            }
        }
    }
}
