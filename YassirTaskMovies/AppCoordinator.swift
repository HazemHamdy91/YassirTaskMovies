//
//  AppCoordinator.swift
//  YassirTaskMovies
//
//  Created by Hazem  on 08.11.23.
//

import Foundation
import UIKit

class AppCoordinator {
    
    public let rootViewController: UIViewController

    // MARK: Init

    public init(rootViewController: UIViewController) {
        self.rootViewController = rootViewController
    }

    // MARK: Properties

    static let shared = AppCoordinator(rootViewController: .init())

    private(set) var window: UIWindow!
    private let mainCoordinator = MovieListCoordinator(title: "Trending Movies")
    
    // MARK: Start

    func start(window: UIWindow) {
        self.window = window

        mainCoordinator.start()

        window.rootViewController = mainCoordinator.rootViewController
        window.makeKeyAndVisible()
    }
}
