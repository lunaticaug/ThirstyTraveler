//
//  DetailEmbededTableViewController.swift
//  ThirstyTraveler
//
//  Created by 양문영 on 2017. 2. 6..
//  Copyright © 2017년 moonyoung. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces
import GoogleMapsCore

class DetailEmbededTableViewController: UIViewController, UITableViewDelegate {

    var detailPlace:BeerPlace? = nil
    var detailView = DetailViewController()
    var detailType:Int? = nil
    var detailFactory:Factory? = nil
    var detailBrewery:Brewery? = nil
    var detailDraft:DraftBeer? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       /* detailType = detailView.selectedPlaceType(detailPlace!)

        if detailType == 0 {
            detailFactory = detailPlace as? Factory
        } else if detailType == 1{
            detailBrewery = detailPlace as? Brewery
        } else if detailType == 2 {
            detailDraft = detailPlace as? DraftBeer
        }
        */
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

   
    func numberOfSections(in tableView: UITableView) -> Int {
        //일단은 세개 반환
        return 3
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var rowCount:Int = 0
        
       /* switch section {
        case 0:
            rowCount = detailPlace!.officeTime.count
        case 1:
           if detailType == 0 {
                rowCount = (detailFactory?.programList.count)!
            } else if detailType == 1{
                rowCount = (detailBrewery?.brewedPricelist!.count)!
            } else if detailType == 2 {
                rowCount = (detailDraft?.draftPriceList.count)!
            }
        case 2:
             if detailType == 0 {
                rowCount = (detailFactory?.programList.count)!
            } else if detailType == 1{
                rowCount = (detailBrewery?.bottledBPricelist?.count)!
            } else if detailType == 2 {
                rowCount = (detailDraft?.bottledDPriceList.count)!
            }
        default:
            1
        } */
        rowCount = 1
        return rowCount
    }

    /*
    func tableView(tableView: UITableView, cellForRowAt indexPath: NSIndexPath) -> UITableViewCell {
        let timeCell = tableView.dequeueReusableCellWithIdentifier("timeCell", forIndexPath: indexPath) as! DetailOfficeTimeCell

        let productCell = tableView.dequeueReusableCellWithIdentifier("productCell", forIndexPath: indexPath)
        // Configure the cell...

        switch indexPath {
        case 0:
            return timeCell
        default:
            return productCell
        }
        
        return timeCell
    }
    */

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
