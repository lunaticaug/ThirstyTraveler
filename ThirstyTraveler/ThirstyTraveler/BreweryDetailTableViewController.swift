//
//  BreweryDetailTableViewController.swift
//  ThirstyTraveler
//
//  Created by cscoi017 on 2016. 8. 23..
//  Copyright © 2016년 moonyoung. All rights reserved.
//

import UIKit

class BreweryDetailTableViewController: UITableViewController {
    
    
    var myData:[Brewery] = []
    var currentBrewery:Brewery? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    //    myData += defaultBrewery()
        
    //    currentBrewery = myData[0] // to be modified** get info from previous tap
        
        tableView.rowHeight = UITableViewAutomaticDimension
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 4
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        var rowCount:Int = 0
        
        if section == 0{
            rowCount = 1
        }
        if section == 1{
            rowCount = currentBrewery!.officeTime.count
        }
        if section == 2{
            rowCount = currentBrewery!.brewedPricelist!.count
        }
        if section == 3{
            rowCount = currentBrewery!.bottledBPricelist!.count
        }
        
        return rowCount
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var identifier:String
        
        switch indexPath.section{
        case 0:
            identifier = "B_ProfileTableViewCell"
        case 1:
            identifier = "B_OfficeTimeTableViewCell"
        case 2:
            identifier = "B_BrewedBeerTableViewCell"
        case 3:
            identifier = "B_BottleBeerTableViewCell"
            
        default : identifier = ""
            
        }
        
        let cell = tableView.dequeueReusableCellWithIdentifier(identifier, forIndexPath: indexPath)
        
        //configure the cell
        
        if let cleanBrewery = currentBrewery{
            let openTime:OpenTime = cleanBrewery.officeTime[indexPath.row]
            
            func vacay(openTime: OpenTime) -> String{
                var isVacay:String = ""
                
                if openTime.open == openTime.close
                {isVacay = "휴무"}
                else{isVacay = "\(openTime.open)~\(openTime.close)"}
                
                return isVacay
            }
            var brBNameList:[String] = []
            brBNameList += cleanBrewery.brewedPricelist!.keys
            
            var brBPriceList:[Int] = []
            brBPriceList += cleanBrewery.brewedPricelist!.values
            
            var bbBNameList:[String] = []
            bbBNameList += cleanBrewery.bottledBPricelist!.keys
            
            var bbBPriceList:[Int] = []
            bbBPriceList += cleanBrewery.bottledBPricelist!.values
            
            
            switch indexPath.section{
            case 0:
                let cell0 = cell as! B_ProfileTableViewCell
                cell0.BreweryNameLabel.text = cleanBrewery.name
                cell0.BreweryRatingsLabel.text = String(cleanBrewery.ratings)
                cell0.BreweryAddressLabel.text = cleanBrewery.address
                cell0.BreweryFavoritesLabel.enabled = cleanBrewery.wishlist
                cell0.BreweryVisitedLabel.enabled = cleanBrewery.haveBeen
            //cell0.DraftImageLabel
            case 1:
                let cell1 = cell as! B_OfficeTimeTableViewCell
                cell1.BreweryDayLabel.text = openTime.day
                cell1.BreweryTimeLabel.text = vacay(openTime)
            case 2:
                let cell2 = cell as! B_BrewedBeerTableViewCell
                let(brBname) = brBNameList[indexPath.row]
                let(brBprice) = brBPriceList[indexPath.row]
                cell2.BreweryBrBNameLabel.text = brBname
                cell2.BreweryBrBPriceLabel.text = "\(brBprice)원"
            case 3:
                let cell3 = cell as! B_BottleBeerTableViewCell
                let(bbBname) = bbBNameList[indexPath.row]
                let(bbBprice) = bbBPriceList[indexPath.row]
                cell3.BreweryBBNameLabel.text = bbBname
                cell3.BreweryBBPriceLabel.text = "\(bbBprice)원"
            default: break
            }
            
        }
        return cell
    }
    
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        var returnValue:String = ""
        if (section == 1){
            returnValue = "영업시간"
        }
        if (section == 2){
            returnValue = "Brewed Beer"
        }
        if (section == 3){
            returnValue = "Bottle Beer"
        }
        
        return returnValue
        
    }
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
}
