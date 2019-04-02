//
//  TableViewCell.swift
//  swiftyjson
//
//  Created by Ravindra Sharma on 02Apr2019
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet var lblArtist: UILabel!
    @IBOutlet weak var publishDate: UILabel!
    
    @IBOutlet var img: UIImageView!
    @IBOutlet var lblTrack: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
      
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func populateCell(  newsTitle:String ,  author:String ,  mydate:String)  {
        
        self.lblArtist.text = newsTitle
        self.lblTrack.text = author
        self.publishDate.text = mydate
    }

}
