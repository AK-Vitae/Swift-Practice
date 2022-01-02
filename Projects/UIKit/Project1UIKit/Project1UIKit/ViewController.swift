//
//  ViewController.swift
//  Project1UIKit
//
//  Created by Ramadugu, Akshith on 1/1/22.
//

import UIKit

class ViewController: UIViewController {
    var pictures = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let fm = FileManager.default // Lets us work with the filesystem
        let path = Bundle.main.resourcePath! // A constant path
        let items = try! fm.contentsOfDirectory(atPath: path) // Gets contents from directory at path
        
        for item in items {
            if item.hasPrefix("nssl") {
                pictures.append(item)
            }
        }
        
        print(pictures)
    }
}

