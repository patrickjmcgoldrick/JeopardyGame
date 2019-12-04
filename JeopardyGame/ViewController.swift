//
//  ViewController.swift
//  JeopardyGame
//
//  Created by Ryan Ofori on 12/4/19.
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
