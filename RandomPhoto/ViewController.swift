//
//  ViewController.swift
//  RandomPhoto
//
//  Created by Srivastava, Anshika on 31/12/23.
//

import UIKit

class ViewController: UIViewController {
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .white
        return imageView
    }()
    
    private let button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setTitle("Random Photo", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    let colors: [UIColor] = [
        .systemBlue,
        .systemGreen,
        .systemRed,
        .systemPink,
        .systemMint,
        .systemTeal,
        .systemOrange,
        .systemPurple
    
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .systemBlue
        view.addSubview(imageView)
        imageView.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
        imageView.center = view.center
        
        
        view.addSubview(button)
        
        getRandomPhoto()
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        
    }
    
    @objc func didTapButton(){
        getRandomPhoto()
        view.backgroundColor = colors.randomElement()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        button.frame = CGRect(x: 20, y: view.frame.size.height-50-view.safeAreaInsets.bottom, width: view.frame.size.width-40, height: 50)
        
    }
    
    func getRandomPhoto(){
        let urlString = "https://source.unsplash.com/random/600x600"
        let url = URL(string: urlString)!
        guard let data = try? Data(contentsOf: url) else {
            return
        }
        imageView.image = UIImage(data: data)
    }

}

