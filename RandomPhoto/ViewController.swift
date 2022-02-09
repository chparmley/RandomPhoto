//
//  ViewController.swift
//  RandomPhoto
//
//  Created by Charles Parmley on 2/8/22.
//

import UIKit

class ViewController: UIViewController {
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .white
        return imageView
    }()
    
    // creating a button function
    private let button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setTitle("New Photo", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    // array of colors to
    let colors: [UIColor] = [
        .systemPink,
        .systemBlue,
        .systemGray,
        .systemCyan,
        .systemTeal,
        .systemOrange,
        .systemPurple
    ]
    
    
    // this function runs when the view loads
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // changing background color
        view.backgroundColor = .systemTeal
        // adding a subview and setting its type
        view.addSubview(imageView)
        // creating a square frame within the subview
        imageView.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
        // centering it on the device screen
        imageView.center = view.center
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        // calling the random photo function
        getRandPhoto(x:1)
        imageView.image = preload.last
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        button.layer.cornerRadius = 10
        imageView.layer.cornerRadius = 10
        
    }
    
    // function to see if the button was pressed
    // the objc does somthing to attach button to function
    @objc func didTapButton(){
        imageView.image = preload.last
        preload.removeLast()
        getRandPhoto(x:3)
        
//        view.backgroundColor = colors.randomElement()
    }
    
    // A new override function for the button that way safe
    //  areas are loaded before the button
    override func viewDidLayoutSubviews() {
        // this super does idk???
        super.viewDidLayoutSubviews()
        // Adding in a subview for the button
        view.addSubview(button)
        // Give button a frame within the subview
        button.frame = CGRect(x: 30, y:view.frame.size.height-150-view.safeAreaInsets.bottom,
          width: view.frame.size.width-60,
          height: 55)
    }
    
    // storing pre loaded images
    var preload: [UIImage] = []
    func getRandPhoto(x:Int){
        let urlString = "https://picsum.photos/200"
        let url = URL(string: urlString)!
        for _ in 1...x {
                guard let data = try? Data(contentsOf: url) else{
                return
            }
            // preloading images to display them faster
            preload.append(UIImage(data: data)!)
        }
        
    }

}

