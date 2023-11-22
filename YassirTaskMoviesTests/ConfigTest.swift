//
//  ConfigTest.swift
//  YassirTaskMoviesTests
//
//  Created by Hazem  on 22.11.23.
//

import Foundation
import XCTest
@testable import YassirTaskMovies

class ConfigTest: BaseTestCase {

    func test_imageBaseURL_vaildThumbnil() {
        given("Config instance with imageConfiguration contains w500") {
            let config = Config.shared
            config.imageConfiguration = Configuration(baseURL: "BaseURL/", posterSizes: ["w500", "original"])
            when("call with isThumbnil") {
                let imageURL = config.imageBaseURL(isThumbnail: true)
                then("get the expected path with w500 inside") {
                    XCTAssertEqual(imageURL, "BaseURL/w500")
                }
            }
        }
    }

    func test_imageBaseURL_invaildThumbnil() {
        given("Config instance with imageConfiguration doesn't contain w500") {
            let config = Config.shared
            config.imageConfiguration = Configuration(baseURL: "BaseURL/", posterSizes: ["w300", "original"])
            when("call with isThumbnil") {
                let imageURL = config.imageBaseURL(isThumbnail: true)
                then("get the expected path with orginal inside") {
                    XCTAssertEqual(imageURL, "BaseURL/original")
                }
            }
        }
    }

    func test_imageBaseURL_vaild_orginalPoster() {
        given("Config instance with imageConfiguration doesn't contain w500") {
            let config = Config.shared
            config.imageConfiguration = Configuration(baseURL: "BaseURL/", posterSizes: ["w500", "original"])
            when("call with isThumbnil") {
                let imageURL = config.imageBaseURL(isThumbnail: false)
                then("get the expected path with orginal inside") {
                    XCTAssertEqual(imageURL, "BaseURL/original")
                }
            }
        }
    }
}
