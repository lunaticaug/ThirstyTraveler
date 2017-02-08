//
//  DetailViewController.swift
//  ThirstyTraveler
//
//  Created by 양문영 on 2017. 1. 6..
//  Copyright © 2017년 moonyoung. All rights reserved.
//

import Foundation
import UIKit
import GoogleMaps
import GoogleMapsCore
import GooglePlaces

class DetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate ,GMSMapViewDelegate {
    
    @IBOutlet var detailImage: UIImageView!
    @IBOutlet var detailTypeImage: UIImageView!
    @IBOutlet var detailName: UILabel!
    @IBOutlet var detailRatings: UILabel!
    @IBOutlet var detailAddress: UILabel!
    @IBOutlet var detailFavo: UIButton!
    @IBOutlet var detailBeen: UIButton!
    @IBOutlet var embedVC: UITableView!
    
    
    var currentPlace:BeerPlace? = nil //segway로 부터 전달받은 값
    var typeNumber:Int = 0
    var detailFactory:Factory? = nil
    var detailBrewery:Brewery? = nil
    var detailDraft:DraftBeer? = nil
    
    /*
    var factoryController = FactoryDetailTableViewController()
    var breweryController = BreweryDetailTableViewController()
    var draftController = DraftDetailTableViewController() 
    */
    
    var mapview = MapViewController()
  //  var embededVC = DetailEmbededTableViewController()
    
    /* segway를 위해서 타입을 인트형 변수로 변환해주기 */
    func selectedPlaceType(placename: BeerPlace) -> Int{
        let selectedPlaceType = placename.type
        var selectedTypeNumber = 0
        
        if selectedPlaceType == "Factory" {
            selectedTypeNumber = 0
        }
        if selectedPlaceType == "Brewery"{
            selectedTypeNumber = 1
        }
        if selectedPlaceType == "Draft"{
            selectedTypeNumber = 2
        }
        return selectedTypeNumber
    }
    // type을 인트형 변수로 변환해줌
    
    func assignTypeIcon (place:BeerPlace) -> UIImageView {
        
        var assignImage:UIImage = UIImage(named:"beer_5_black")!
        var assignedImage:UIImageView = UIImageView(image: assignImage)
        
        switch selectedPlaceType(place) {
        case 0:
            assignImage = UIImage(named: "beer_3_fill")!
        case 1:
            assignImage = UIImage(named: "beer_2_fill2")!
        case 2:
            assignImage = UIImage(named: "beer_5_fill")!
        default:
            break
        }
        
        assignedImage = UIImageView(image:assignImage)
        
        return assignedImage
        
    } //typeIcon 할당함수

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
     /* 맨 위 BeerPlace 설명부분 */
        
        detailTypeImage = assignTypeIcon(currentPlace!) // type Image
        mapview.loadFirstPhotoForPlace(currentPlace!.placeID, imageView: detailImage) // Place Image
        detailName.text = currentPlace?.name
        detailAddress.text = currentPlace?.address
        detailRatings.text = String(currentPlace!.ratings)
        
        // 여기까지
        
        
        
        typeNumber = selectedPlaceType(currentPlace!)
        
        
      /*
        func embededDetail(currentPlace : BeerPlace)->UIViewController{
            
            
            var embededVC:UIViewController!
            let currentPlaceType:Int = selectedPlaceType(currentPlace)
            
            switch(currentPlaceType){
                
            case 0:
                embededVC = UIStoryboard(name: "Main", bundle:nil).instantiateViewControllerWithIdentifier("FactoryDetail") as! FactoryDetailTableViewController
                    factoryController.currentFactory = (currentPlace as! Factory)
                    factoryController.viewDidLoad()
                break
                
            case 1:
                embededVC = UIStoryboard(name: "Main", bundle:nil).instantiateViewControllerWithIdentifier("BreweryDetail") as! BreweryDetailTableViewController
                    breweryController.currentBrewery = (currentPlace as! Brewery)
                    breweryController.viewDidLoad()
                break
                
                
            case 2:
                embededVC = UIStoryboard(name: "Main", bundle:nil).instantiateViewControllerWithIdentifier("DraftDetail") as! DraftDetailTableViewController
                    draftController.currentDraft = currentPlace
                    //draftController.viewDidLoad()
                break
                
            default :
                break
            }//switch문 닫음
            
            
            self.addChildViewController(embededVC)
            self.view.frame = embededVC.view.frame
            self.view.addSubview(embededVC.view)
            embededVC.didMoveToParentViewController(self)
            
            
            
            //            loadFirstPhotoForPlace(PlaceIdOfMark, imageView: popOverVC.PopUpImage)
            //            popOverVC.PopUpTitle.text = getNameById(PlaceIdOfMark)
            //            print("result : \(popOverVC.PopUpTitle.text)")
            //
            
            return embededVC
            
            
        } //embededdetail닫음
   */
        //
        //        func loadFactoryDetailTableView (place:BeerPlace){
        //            place.officeTime.0.day
        //
        //
        //        }
        
        //embedVC = embededDetail(currentPlace!).view
       // self.embedVC.reloadData()
        
    } //뷰딧로드닫음
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        //일단은 세개 반환
        return 3
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var rowCount:Int = 0
        
         switch section {
         case 0:
         rowCount = currentPlace!.officeTime.count
         case 1:
         if typeNumber == 0 {
         rowCount = (detailFactory?.programList.count)!
         } else if typeNumber == 1{
         rowCount = (detailBrewery?.brewedPricelist!.count)!
         } else if typeNumber == 2 {
         rowCount = (detailDraft?.draftPriceList.count)!
         }
         case 2:
         if typeNumber == 0 {
         rowCount = (detailFactory?.programList.count)!
         } else if typeNumber == 1{
         rowCount = (detailBrewery?.bottledBPricelist?.count)!
         } else if typeNumber == 2 {
         rowCount = (detailDraft?.bottledDPriceList.count)!
         }
         default:
         rowCount = 0
         }
        return rowCount
    }
    
    
     func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
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

