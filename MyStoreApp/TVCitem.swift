//
//  TVCitem.swift
//  MyStoreApp
//
//  Created by vigneswaran on 24/02/18.
//  Copyright © 2018 vigneswaran. All rights reserved.
//

import UIKit

class TVCitem: UITableViewCell {

    
    @IBOutlet weak var laStoreName: UILabel!
    @IBOutlet weak var laDateAdd: UILabel!
    @IBOutlet weak var ivItemImage: UIImageView!
    @IBOutlet weak var laItemName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setItems(item: Items){
        laItemName.text = item.item_name
        laStoreName.text = item.toStoreType?.store_name
        ivItemImage.image = item.image as? UIImage
        
        let dateFormate = DateFormatter()
        dateFormate.dateFormat = "MM/DD/yy h:mm a"
        
        laDateAdd.text = dateFormate.string(from: item.date_add as! Date)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
