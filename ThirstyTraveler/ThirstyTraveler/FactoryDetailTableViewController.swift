//
//  FactoryDetailTableViewController.swift
//  ThirstyTraveler
//
//  Created by cscoi017 on 2016. 8. 23..
//  Copyright © 2016년 moonyoung. All rights reserved.
//

import UIKit

class FactoryDetailTableViewController: UITableViewController {
    
    
    var myData:[Factory] = []
    var currentFactory:Factory? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        myData += defaultFactory()
//        
//        currentFactory = myData[0] // to be modified** get info from previous tap
//        
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
            rowCount = currentFactory!.officeTime.count
        }
        if section == 2{
            rowCount = currentFactory!.programList.count
        }
        if section == 3{
            rowCount = 1
        }
        
        return rowCount
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var identifier:String
        
        switch indexPath.section{
        case 0:
            identifier = "F_ProfileTableViewCell"
        case 1:
            identifier = "F_OfficeTimeTableViewCell"
        case 2:
            identifier = "F_ProgramTableViewCell"
        case 3:
            identifier = "F_URLTableViewCell"
            
        default : identifier = ""
            
        }
        
        let cell = tableView.dequeueReusableCellWithIdentifier(identifier, forIndexPath: indexPath)
        
        //configure the cell
        
        if let cleanFactory = currentFactory{
            let openTime:OpenTime = cleanFactory.officeTime[indexPath.row]
            
            func vacay(openTime: OpenTime) -> String{
                var isVacay:String = ""
                
                if openTime.open == openTime.close
                {isVacay = "휴무"}
                else{isVacay = "\(openTime.open)~\(openTime.close)"}
                
                return isVacay
            }
            var programList:[String] = []
            programList += cleanFactory.programList
            
            
            
            switch indexPath.section{
            case 0:
                let cell0 = cell as! F_ProfileTableViewCell
                cell0.FactoryNameLabel.text = cleanFactory.name
                cell0.FactoryRatingsLabel.text = String(cleanFactory.ratings)
                cell0.FactoryAddressLabel.text = cleanFactory.address
                cell0.FactoryFavoritesLabel.enabled = cleanFactory.wishlist
                cell0.FactoryVisitedLabel.enabled = cleanFactory.haveBeen
            //cell0.DraftImageLabel
            case 1:
                let cell1 = cell as! F_OfficeTimeTableViewCell
                cell1.FactoryDayLabel.text = openTime.day
                cell1.FactoryTimeLabel.text = vacay(openTime)
            case 2:
                let cell2 = cell as! F_ProgramTableViewCell
                let(programname) = programList[indexPath.row]
                
                cell2.FactoryProgramLabel.text = programname
                
            case 3:
                let cell3 = cell as! F_URLTableViewCell
                let(url) = cleanFactory.officeURL
                cell3.FactoryURLLabel.text = url

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
            returnValue = "Programs"
        }
        if (section == 3){
            returnValue = "Homepage"
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
