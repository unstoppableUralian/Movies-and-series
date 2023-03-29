//
//  WaitListViewController.swift
//  Movies and series
//
//  Created by Русинов Евгений on 29.03.2023.
//


import UIKit
import SnapKit
import CoreData

final class WaitListViewController: UIViewController {
    
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()
    
    private let container = AppDelegate.container
    
    var savedMovies = [SavedMovie]() {
        didSet {
            self.tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupConstraints()
        loadData()
        
    }

    
    
    private func setupTableView() {
        view.addSubview(tableView)
        tableView.register(MovieTableViewCell.self, forCellReuseIdentifier: "CustomCell")
        tableView.rowHeight = 77
        tableView.dataSource = self
    }
    
    private func setupConstraints() {
        tableView.snp.makeConstraints { make in
            make.leading.equalTo(view.snp.leading)
            make.trailing.equalTo(view.snp.trailing)
            make.top.equalTo(view.snp.top)
            make.bottom.equalTo(view.snp.bottom)
        }
    }
    
    
    private func loadData() {
        let request: NSFetchRequest<SavedMovieEntity> = SavedMovieEntity.fetchRequest()
        var entities = [SavedMovieEntity]()
        do {
            entities = try container.viewContext.fetch(request)
            for i in entities {
                let savedMovie = SavedMovie(movieImage: i.movieImage ?? "", movieTitle: i.movieTitle ?? "", movieDescription: i.movieDescription ?? "")
                savedMovies.append(savedMovie)
            }
        } catch {
            entities = [SavedMovieEntity]()
        }
    }
    
}

extension WaitListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return savedMovies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! MovieTableViewCell
        cell.configure(savedMovie: savedMovies[indexPath.row])
        return cell
    }
    
}

