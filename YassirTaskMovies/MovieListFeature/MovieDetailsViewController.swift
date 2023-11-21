//
//  MovieDetailsViewController.swift
//  YassirTaskMovies
//
//  Created by Hazem  on 20.11.23.
//

import Foundation
import UIKit
import AlamofireImage

protocol MovieDetailsView: AnyObject {
    func showMovieOverView(overview: String)
}

class MovieDetailsViewController: UIViewController {

    // MARK: Proprties
    public var movie: Movie?
    var presenter: MovieDetailsPresenter?

    // MARK: Views

    private var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .natural
        label.numberOfLines = 0
        label.font = UIFont.preferredFont(forTextStyle: .title3)
        label.minimumScaleFactor = 0.7
        label.adjustsFontSizeToFitWidth = true
        label.setContentCompressionResistancePriority(.defaultHigh, for: .vertical)
        return label
    }()

    private var releaseDateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .natural
        label.numberOfLines = 0
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.minimumScaleFactor = 0.7
        label.adjustsFontSizeToFitWidth = true
        label.setContentCompressionResistancePriority(.defaultHigh, for: .vertical)
        return label
    }()

    private var posterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    private var overViewTextView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isEditable = false
        textView.font = UIFont.preferredFont(forTextStyle: .body)
        return textView
    }()
    
    private let activityIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .large)
        indicator.translatesAutoresizingMaskIntoConstraints = false
        return indicator
    }()

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        setupConstraints()

        fillMovieData()
    }

    func fillMovieData() {
        guard let movie = movie else { return }
        titleLabel.text = movie.title
        releaseDateLabel.text = movie.apadtedReleaseYear()
        let imageURLString = Config.shared.imageBaseURL(isThumbnail: false) + (movie.posterPath ?? "")
        if let imageURL = URL(string: imageURLString) {
            self.posterImageView.af.setImage(withURL: imageURL)
        }
        presenter?.loadMoviesDetails(movie: movie)
    }

    // MARK: Setup

    private func setupViews() {
        view.backgroundColor = .white

        view.addSubview(containerView)
        view.addSubview(titleLabel)
        view.addSubview(releaseDateLabel)
        view.addSubview(overViewTextView)
        view.addSubview(activityIndicator)
        activityIndicator.startAnimating()

        containerView.addSubview(posterImageView)
    }

    private func setupConstraints() {

        // containerView
        view.addConstraints([
            containerView.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            containerView.heightAnchor.constraint(equalToConstant: 300)
        ])

        // logoImageView
        containerView.addConstraints([
            posterImageView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor, constant: 0),
            posterImageView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor, constant: 0),
            posterImageView.heightAnchor.constraint(equalToConstant: 250),
            posterImageView.widthAnchor.constraint(equalToConstant: 250)
        ])

        // titleLabel
        view.addConstraints([
            titleLabel.topAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 8),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8)
        ])

        // releaseDateLabel
        view.addConstraints([
            releaseDateLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            releaseDateLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor, constant: 0),
            releaseDateLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 0)
        ])

        // overViewTextView
        view.addConstraints([
            overViewTextView.topAnchor.constraint(equalTo: releaseDateLabel.bottomAnchor, constant: 16),
            overViewTextView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -8),
            overViewTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            overViewTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8)
        ])

        // activityIndicatorConstraints
        let activityIndicatorConstraints: [NSLayoutConstraint] = [
            activityIndicator.centerXAnchor.constraint(equalTo: overViewTextView.centerXAnchor, constant: 0),
            activityIndicator.centerYAnchor.constraint(equalTo: overViewTextView.centerYAnchor, constant: 0)
        ]
        view.addConstraints(activityIndicatorConstraints)
    }
}

extension MovieDetailsViewController: MovieDetailsView {
    func showMovieOverView(overview: String) {
        overViewTextView.text = overview
        activityIndicator.isHidden = true
    }
}
