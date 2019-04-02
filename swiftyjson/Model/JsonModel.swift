//
//  JsonModel.swift
//  swiftyjson
//
//  Created by Ravindra Sharma on 02Apr2019
//

import Foundation

struct JsonModel{
    var artistName: String = ""
    var trackCensoredName: String = ""
    var artworkUrl100: String = ""
    init(){
        
    }
    
    init(json:JSON){
        artistName = json["artistName"].stringValue
        trackCensoredName = json["trackCensoredName"].stringValue
        artworkUrl100 = json["artworkUrl100"].stringValue
    }
}
