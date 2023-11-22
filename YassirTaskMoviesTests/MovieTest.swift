//
//  MovieTest.swift
//  YassirTaskMoviesTests
//
//  Created by Hazem  on 22.11.23.
//

import Foundation
import XCTest
@testable import YassirTaskMovies

class MovieTest: BaseTestCase {

    func test_init() {
        given("init movie with vaild Data") {
            let movie = Movie(title: "testTitle", releaseDate: "1992-01-01", movieId: 10, posterPath: "path")
            when("") {
                then("all data are valid") {
                    XCTAssertEqual(movie.title, "testTitle")
                    XCTAssertEqual(movie.releaseDate, "1992-01-01")
                    XCTAssertEqual(movie.movieId, 10)
                    XCTAssertEqual(movie.posterPath, "path")
                }
            }
        }
    }

    func test_apadtedReleaseYear_valid() {
        given("init movie with valid release date") {
            let movie = Movie(title: "", releaseDate: "1992-01-01", movieId: 0, posterPath: "")
            when("get apadtedReleaseYear") {
                let releaseYear = movie.apadtedReleaseYear()
                then("releaseYear is 1992") {
                    XCTAssertEqual(releaseYear, "1992")
                }
            }
        }
    }

    func test_apadtedReleaseYear_inValid() {
        given("init movie with valid release date") {
            let movie = Movie(title: "", releaseDate: "01-01", movieId: 0, posterPath: "")
            when("get apadtedReleaseYear") {
                let releaseYear = movie.apadtedReleaseYear()
                then("releaseYear is empty") {
                    XCTAssertEqual(releaseYear, "")
                }
            }
        }
    }
}
