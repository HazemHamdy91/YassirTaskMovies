//
//  NetworkManager.swift
//  YassirTaskMovies
//
//  Created by Hazem  on 08.11.23.
//

import Foundation
import Alamofire

class NetworkManager {

    static let shared = NetworkManager()
    let baseURL = "https://api.themoviedb.org/3/"
    // If I have enough time i would store this encrypted in the Keychain
    // swiftlint:disable:next line_length
    let authToken = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI5MTkzZGExYmQwZDFlMmI4OWEwMTI3ODkzNDdmNTQxYiIsInN1YiI6IjY1NTBiMDVmMmI5MzIwMDlmZTUzNjkwZCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.DFh9qdHKT6NNL3_Q8ak0IGNmSwe2SSwzVQrx_9L_UWg"

    private lazy var headers: HTTPHeaders = [
        .accept("application/json"),
        .authorization(bearerToken: authToken)
    ]
    
    // swiftlint:disable:next line_length
    func loadMovies<T: Codable>(movieListType: T.Type, completion: @escaping (_ result: Swift.Result<T, AFError>) -> Void) {
        // swiftlint:disable:next line_length
        AF.request("\(baseURL)discover/movie?include_adult=false&include_video=false&language=en-US&page=1&sort_by=popularity.desc", headers: headers)
        .responseDecodable(of: movieListType) { response in
            completion(response.result)
        }
    }

    func loadImageConfiguration(completion: @escaping (_ result: Swift.Result<Image, AFError>) -> Void) {
        AF.request("\(baseURL)configuration", headers: headers)
            .responseDecodable(of: Image.self) { response in
            completion(response.result)
        }
    }

    // swiftlint:disable:next line_length
    func loadMovieDetails<T: Codable>(movieID: Int, movieDetailsType: T.Type, completion: @escaping (_ result: Swift.Result<T, AFError>) -> Void) {
        AF.request("\(baseURL)movie/\(movieID)", headers: headers)
            .responseDecodable(of: movieDetailsType) { response in
            completion(response.result)
        }
    }
}
