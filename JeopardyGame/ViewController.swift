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
        
        /**
         * Example loading and parsing Categories
         */
        NetworkManager.shared.loadCategories(completed: { (data) in
            print("categories data")
            
            let parser = CategoryParser()
            parser.parse(data: data) { (categories) in
                for category in categories {
                    print(category.title)
                }
            }
            
        })

        /**
         * Example loading and paring Clues
         *
        NetworkManager.shared.loadClues(completed: { (data) in
            print("clues data")
            
            let parser = ClueParser()
            parser.parse(data: data) { (clues) in
                for clue in clues {
                    print(clue.question)
                    print("\t\(clue.answer)")
                }
            }
            
        })
*/
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
