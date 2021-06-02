//
//  ViewController.swift
//  Lesson17-URLSession
//
//  Created by Владислав Галкин on 02.06.2021.
//

import UIKit

class ViewController: ConfigureViewController {

    private let networkService: CommentsNetworkProtocol?
    
    init(networkService: CommentsNetworkProtocol) {
        self.networkService = networkService
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(CommentCell.self, forCellReuseIdentifier: CommentCell.identifier)
        tableView.dataSource = self
        return tableView
    }()
    
    private var dataSource = [GetCommentsResponse]()
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(tableView)
        loadData()
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        setupUI()
    }

    
    // MARK: - Private methods
    
    private func loadData() {
        isLoading = true
        self.networkService?.getComments { response in
            self.process(response)
        }
    }
    
    private func process (_ response: GetCommentsApiResponse) {
        DispatchQueue.main.async {
            switch response{
            case .success(let data):
                self.dataSource.append(contentsOf: data)
                self.tableView.reloadData()
            case .failure(let error):
                print(error)
            }
            self.isLoading = false
        }
    }
    
    private func setupUI(){
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 20),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func errorMessage(error: NetworkServiceError) -> String {
        switch error {
        case .networkError:
            return "Упал запрос"
        case .decodable:
            return "Ошибка парсинга"
        }
    }
}

// MARK: - UITableViewDataSource
extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CommentCell.identifier, for: indexPath) as? CommentCell else { return UITableViewCell() }
        cell.configureCell(model: dataSource[indexPath.row])
        return cell
    }
}

