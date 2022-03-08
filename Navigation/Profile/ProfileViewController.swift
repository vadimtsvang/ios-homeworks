//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Vadim on 31.01.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    private let profileContainerView = ProfileContainerView()
    private let profileHeaderView = ProfileHeaderView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        title = "Profile"
    }
    
    private func configureUI() {
        view.backgroundColor = .lightGray
        view.addSubviews(profileHeaderView, profileContainerView)
        profileHeaderView.backgroundColor = .red //TODO: for testing
    }
    
    private func configureLayout() {
        [profileHeaderView, profileContainerView].forEach { element in
            element.toAutoLayout()
        }
        
        NSLayoutConstraint.activate([
            profileHeaderView.heightAnchor.constraint(equalToConstant: 220),
            profileHeaderView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            profileHeaderView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            profileHeaderView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            
            profileContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            profileContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            profileContainerView.topAnchor.constraint(equalTo: profileHeaderView.bottomAnchor),
            profileContainerView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}
