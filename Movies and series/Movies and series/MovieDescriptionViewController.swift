//
//  MovieDescriptionViewController.swift
//  Movies and series
//
//  Created by Русинов Евгений on 29.03.2023.
//
import UIKit
import SnapKit

final class MovieDescriptionViewController: UIViewController {
    
    
    private let titleInfo: String
    private let descriptionInfo: String
    private let imageURL: String
    
    private let container = AppDelegate.container
        
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.text = descriptionInfo
        return label
    }()
    
    private lazy var movieImage: UIImageView = {
        let image = UIImageView()
        guard let url = URL(string: imageURL) else { return UIImageView() }
        image.load(url: url)
        return image
    }()
    
    private lazy var addToWaitListButton: UIButton = {
       let button = UIButton()
        button.backgroundColor = .blue
        button.setTitle("Will watch later", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
        return button
    }()
    
    @objc func addButtonTapped() {
        let waitList = self.tabBarController?.viewControllers?[1] as! WaitListViewController
        waitList.savedMovies.append(SavedMovie(movieImage: imageURL, movieTitle: titleInfo, movieDescription: descriptionInfo))
        navigationController?.popViewController(animated: true)
        container.viewContext.perform {
            let savedMovieEntity  = SavedMovieEntity(context: self.container.viewContext)
            savedMovieEntity.movieTitle = self.titleInfo
            savedMovieEntity.movieDescription = self.descriptionInfo
            savedMovieEntity.movieImage = self.imageURL
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = titleInfo
        setupViews()
        setupConstraints()
    }
    init(title: String, description: String, image: String) {
        self.titleInfo = title
        self.descriptionInfo = description
        self.imageURL = image
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        view.addSubview(descriptionLabel)
        view.addSubview(movieImage)
        view.addSubview(addToWaitListButton)
    }
    
    private func setupConstraints() {
        
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(10)
            make.trailing.equalTo(view.snp.trailing).offset(-10)
            make.leading.equalTo(view.snp.leading).offset(10)
        }
        
        movieImage.snp.makeConstraints { make in
            make.top.equalTo(descriptionLabel.snp.top).offset(20)
            make.width.equalTo(view.safeAreaLayoutGuide.snp.width)
            make.bottom.equalTo(addToWaitListButton.snp.top)
        }
        
        addToWaitListButton.snp.makeConstraints { make in
            make.height.equalTo(100)
            make.width.equalTo(view.safeAreaLayoutGuide.snp.width)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
        
    }
}

