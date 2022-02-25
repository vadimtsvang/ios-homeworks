//
//  FeedViewController.swift
//  Navigation
//
//  Created by Vadim on 31.01.2022.
//

import UIKit

class FeedViewController: UIViewController {
    
    let post = Post(title: "POST")

    override func viewDidLoad() {
        super.viewDidLoad()

        let button = UIButton(frame: CGRect(x: 100, y: 300, width: 200, height: 50))
        button.setTitle("Next", for: .normal)
        view.addSubview(button)
        button.addTarget(self, action: #selector(tap), for: .touchUpInside)
    }
    
    @objc func tap() {
        
        let vc = PostViewController()
        vc.post = post
        navigationController?.pushViewController(vc, animated: true)
        
    }
}

