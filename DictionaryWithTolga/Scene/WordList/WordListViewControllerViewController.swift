//
//  WordListViewController.swift
//  DictionaryWithTolga
//
//  Created by Talip on 2.11.2022.
//

import UIKit

class WordListViewController: UIViewController {
    private let database: CoreDataManager
    
    private var wordList: [Word] = []
    
    private lazy var wordListTableView: UITableView = {
        let table = UITableView.init(frame: .zero, style: .plain)
        table.backgroundColor = .clear
        table.delegate = self
        table.dataSource = self
        table.register(WordTableViewCell.self, forCellReuseIdentifier: "WordTableViewCell")
        return table
    }()
    
    init(database: CoreDataManager) {
        self.database = database
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        self.wordList = database.fetch()
        self.wordListTableView.reloadData()
    }
}

private extension WordListViewController {
    func setupLayout() {
        view.backgroundColor = .white
        
        view.addSubview(wordListTableView)
        wordListTableView.translatesAutoresizingMaskIntoConstraints = false
        wordListTableView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor).isActive = true
        wordListTableView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor).isActive = true
        wordListTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        wordListTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
//
//        NSLayoutConstraint.activate([
//            wordListTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
//            wordListTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
//            wordListTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
//            wordListTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
//        ])
        
        
    }
}

extension WordListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return wordList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "WordTableViewCell", for: indexPath) as? WordTableViewCell else {
            fatalError()
        }

        cell.configure(with: wordList[indexPath.row])
        return cell
    }
}


final class WordTableViewCell: UITableViewCell {
    
    private lazy var nameLabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupLayout()
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    func configure(with word: Word) {
        nameLabel.text = word.name
    }
}

private extension WordTableViewCell {
    func setupLayout() {
        contentView.addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        nameLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 15).isActive = true
        nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15).isActive = true
        nameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15).isActive = true
    }
}
