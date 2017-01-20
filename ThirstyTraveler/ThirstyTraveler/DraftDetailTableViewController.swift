//
//  DraftDetailTableViewController.swift
//  ThirstyTraveler
//
//  Created by cscoi017 on 2016. 11. 11..
//  Copyright © 2016년 moonyoung. All rights reserved.
//

import UIKit

class DraftDetailTableViewController: UITableViewController {
    
    
    var myData:[DraftBeer] = []
    var currentDraft:BeerPlace? = nil
    var currentItem:DraftBeer? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        
        currentItem = currentDraft as! DraftBeer
        
       //myData += defaultDraft()
        
       //currentDraft = myData[0] // to be modified** get info from previous tap
        
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
            rowCount = currentItem!.officeTime.count
        }
        if section == 2{
            rowCount = currentItem!.draftPriceList.count
        }
        if section == 3{
            rowCount = currentItem!.bottledDPriceList.count
        }
        
        return rowCount
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var identifier:String
        
        switch indexPath.section{
        case 0:
            identifier = "D_ProfileTableViewCell"
        case 1:
            identifier = "D_OfficeTimeTableViewCell"
        case 2:
            identifier = "D_DraftBeerTableViewCell"
        case 3:
            identifier = "D_BottleBeerTableViewCell"
            
        default : identifier = ""
            
        }
        
        let cell = tableView.dequeueReusableCellWithIdentifier(identifier, forIndexPath: indexPath)
        
        //configure the cell
        
        if let cleanDraft = currentItem{
            let openTime:OpenTime = cleanDraft.officeTime[indexPath.row]
            
            func vacay(openTime: OpenTime) -> String{
                var isVacay:String = ""
                
                if openTime.open == openTime.close
                {isVacay = "휴무"}
                else{isVacay = "\(openTime.open)~\(openTime.close)"}
                
                return isVacay
            }
            var dBNameList:[String] = []
            dBNameList += cleanDraft.draftPriceList.keys
            
            var dBPriceList:[Int] = []
            dBPriceList += cleanDraft.draftPriceList.values
            
            var bBNameList:[String] = []
            bBNameList += cleanDraft.bottledDPriceList.keys
            
            var bBPriceList:[Int] = []
            bBPriceList += cleanDraft.bottledDPriceList.values
            
            
            switch indexPath.section{
            case 0:
                let cell0 = cell as! D_ProfileTableViewCell
                cell0.DraftNameLabel.text = cleanDraft.name
                cell0.DraftRatingsLabel.text = String(cleanDraft.ratings)
                cell0.DraftAddressLabel.text = cleanDraft.address
                cell0.DraftFavoritesLabel.enabled = cleanDraft.wishlist
                cell0.DraftVisitedLabel.enabled = cleanDraft.haveBeen
                //cell0.DraftImageLabel
            case 1:
                let cell1 = cell as! D_OfficeTimeTableViewCell
                cell1.DraftDayLabel.text = openTime.day
                cell1.DraftTimeLabel.text = vacay(openTime)
            case 2:
                let cell2 = cell as! D_DraftBeerTableViewCell
                let(dBname) = dBNameList[indexPath.row]
                let(dBprice) = dBPriceList[indexPath.row]
                cell2.DraftDBNameLabel.text = dBname
                cell2.DraftDBPriceLabel.text = "\(dBprice)원"
            case 3:
                let cell3 = cell as! D_BottleBeerTableViewCell
                let(bBname) = bBNameList[indexPath.row]
                let(bBprice) = bBPriceList[indexPath.row]
                cell3.DraftBBNameLabel.text = bBname
                cell3.DraftBBPriceLabel.text = "\(bBprice)원"
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
            returnValue = "Draft Beer"
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
