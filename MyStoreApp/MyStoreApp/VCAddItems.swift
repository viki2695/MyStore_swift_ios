//
//  VCAddItems.swift
//  MyStoreApp
//
//  Created by vigneswaran on 24/02/18.
//  Copyright © 2018 vigneswaran. All rights reserved.
//

import UIKit
import CoreData

class VCAddItems: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var txtItemName: UITextField!
    @IBOutlet weak var storePickView: UIPickerView!
    @IBOutlet weak var ivShowImage: UIImageView!
    
    var listOfStore = [StoreType]()
    var imagePicker: UIImagePickerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadStore()
        storePickView.delegate = self
        storePickView.dataSource = self
        
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        
        // Do any additional setup after loading the view.
    }

    func loadStore(){
        let fetchRequest: NSFetchRequest<StoreType> = StoreType.fetchRequest()
        do{
            listOfStore = try context.fetch(fetchRequest)
        }catch{
            print("Cannot read items from database")
        }
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return listOfStore.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let store = listOfStore[row]
        return store.store_name
    }
    
    @IBAction func buImageAdd(_ sender: Any) {
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage{
            ivShowImage.image = image
        }
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func buBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func buSave(_ sender: Any) {
        
        let newItem = Items(context: context)
        newItem.item_name = txtItemName.text
        newItem.date_add = NSDate() as? Date
        newItem.image = ivShowImage.image
        newItem.toStoreType = listOfStore[storePickView.selectedRow(inComponent: 0)]
        
        do{
            ad.saveContext()
            txtItemName.text = ""
        }catch{
            print("Cannot save item")
        }
    }
}
