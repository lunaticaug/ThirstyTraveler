//: Playground - noun: a place where people can play

import UIKit

typealias OpenTime = (day:String, open:Int, close:Int)

class BeerPlace:NSObject {
    
    
    var name:String = ""
    var type:String = ""
    var ratings:Double = 0.0
    var location:(Double,Double)
    var wishlist:Bool=true
    var haveBeen:Bool=false
    var officeNumber:String
    var officeTime:[OpenTime]
    var address:String=""
    var placeID:String=""
    
    init (name:String, type:String, location:(Double,Double), officeNumber:String, officeTime:[OpenTime]){
        self.name = name
        self.type = type
        self.location = location
        self.officeNumber = officeNumber
        self.officeTime = officeTime
        
    } // init
    
        
} //class 닫음





