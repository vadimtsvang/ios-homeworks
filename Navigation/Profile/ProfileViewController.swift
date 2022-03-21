//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Vadim on 31.01.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    private let profileHeaderView = ProfileHeaderView()
    private var posts = [Post]()
    private let tableView = UITableView()
    
//    private var profileButton: UIButton = {
//        let button = UIButton()
//        button.backgroundColor = .systemBlue
//        button.setTitle("Profile Button", for: .normal)
//        button.layer.cornerRadius = 4
//        button.layer.shadowColor = UIColor.black.cgColor
//        button.layer.shadowOffset = CGSize(width: 4, height: 4)
//        button.layer.shadowOpacity = 0.7
//        button.layer.shadowRadius = 10
//        button.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
//        return button
//    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Profile"
        configureUI()
        configureLayout()
        appendPosts()
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: "Cell")

    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//
//    }
//
    private func configureUI() {
        view.backgroundColor = .lightGray
        view.addSubviews(profileHeaderView, tableView) //profileButton)
        
    }
    
    private func configureLayout() {
        profileHeaderView.toAutoLayout()
        //profileButton.toAutoLayout()
        tableView.toAutoLayout()
        tableView.delegate = self
        tableView.dataSource = self
        
        NSLayoutConstraint.activate([
            profileHeaderView.heightAnchor.constraint(equalToConstant: 220),
            profileHeaderView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            profileHeaderView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            profileHeaderView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: profileHeaderView.bottomAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)

            
//            profileButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
//            profileButton.heightAnchor.constraint(equalToConstant: 50),
//            profileButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
//            profileButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
    }
    
    private func appendPosts() {
        posts.append(.init(author: "Houston Rockets", description: "The Houston Rockets currently have the worst record in the league at 17-51, which is a half-game worse (or better depending on how you look at it) than the Orlando Magic. Once you get to this point in a season where you aren't competing for a playoff spot, you have to start evaluating your current roster to see what you have for the following season.", image: "Rockets", likes: 3412, views: 11390))
        posts.append(.init(author: "Boston Celtics", description: "You would be hard-pressed to find a fan of the NBA who did not believe Boston Celtics All-Star forward Jayson Tatum should not be described as a star — for good reason given the numbers the St. Louis native has put up in this and recent seasons.", image: "Celtics", likes: 2188, views: 8756))
        posts.append(.init(author: "New York Knicks", description: "The New York Knicks (29-40) enjoyed a rare blowout win Wednesday, shoving the Portland Trail Blazers in a locker in a 128-98 smackdown. Looking to build off that momentum, the Knicks will welcome a Washington Wizards (29-39) team that has all but given up on this season. The Wizards come in losers of their last five games and remain without their star, Bradley Beal, who they lost for the season.", image: "Knicks", likes: 4389, views: 7998))
        posts.append(.init(author: "Phoenix Suns", description: "The Phoenix Suns are currently off to their best start in franchise history as they sit atop the NBA with a 56-14 record. They have the top seed in the West all but locked up, and the best record in all the land by an 8-game margin. There are numerous reasons why this has occurred; from team cohesion to organic chemistry, from offensive firepower to depth, from clutch time performance to defensive intensity.", image: "Suns", likes: 1190, views: 3879))
    }
    
    @objc func buttonClicked() {
  //      print(statusTextField.text ?? "No text")
    }
}

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView (_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView (_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! PostTableViewCell
        let post = posts[indexPath.row]
        cell.configure(with:post)
        self.tableView.rowHeight = UITableView.automaticDimension
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.rowHeight
    }
}
