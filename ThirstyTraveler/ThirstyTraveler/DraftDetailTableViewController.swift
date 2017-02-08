//
//  DraftDetailTableViewController.swift
//  ThirstyTraveler
//
//  Created by cscoi017 on 2016. 11. 11..
//  Copyright © 2016년 moonyoung. All rights reserved.
//

import UIKit

class DraftDetailTableViewController: UITableViewController {
    
    
    var currentDraft:BeerPlace? = nil
    var currentItem:DraftBeer? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        
        currentItem = currentDraft as? DraftBeer
        // 여기까지 current Draft, current Item에 값 할당 ㅇㅋ
      
        
        //tableView.rowHeight = UITableViewAutomaticDimension
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

// 왜 nil값으로 바뀌었지? ㅠㅠ 
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 3
    }

    
    /* 커스텀 테이블 뷰 섹션별 셀의 갯수 할당 */
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        var rowCount:Int = 1
        
        if section == 0{
            rowCount = currentItem!.officeTime.count
        }
        if section == 1{
            rowCount = currentItem!.draftPriceList.count
        }
        if section == 2{
            rowCount = currentItem!.bottledDPriceList.count
        }
        
        return rowCount
    } // NORIS끝 
    

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
    

}
