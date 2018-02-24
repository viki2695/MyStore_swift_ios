//
//  ViewController.swift
//  MyStoreApp
//
//  Created by vigneswaran on 24/02/18.
//  Copyright © 2018 vigneswaran. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtStoreName: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func buAddStore(_ sender: Any) {
        let newStore = StoreType(context: context)
        newStore.store_name = txtStoreName.text
        
        do{
            ad.saveContext()
            txtStoreName.text = ""
        }catch{
            print("Connot store to database")
        }
        
    }
    
    @IBAction func buBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        
    }
}

