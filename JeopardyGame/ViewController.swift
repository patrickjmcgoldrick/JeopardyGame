//
//  ViewController.swift
//  JeopardyGame
//
//  Created by dirtbag on 12/4/19.
//  Copyright © 2019 dirtbag. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        NetworkManager.shared.loadCategories(completed: { (data) in
            print("categories data")
            
            let parser = CategoryParser()
            parser.parse(data: data) { (categories) in
                for category in categories {
                    print(category.title)
                }
            }
            
        })
    }
}

