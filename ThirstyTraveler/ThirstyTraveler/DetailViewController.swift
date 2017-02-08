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

class DetailViewController: UIViewController ,GMSMapViewDelegate {
    
    @IBOutlet var detailImage: UIImageView!
    @IBOutlet var detailTypeImage: UIImageView!
    @IBOutlet var detailName: UILabel!
    @IBOutlet var detailRatings: UILabel!
    @IBOutlet var detailAddress: UILabel!
    @IBOutlet var detailFavo: UIButton!
    @IBOutlet var detailBeen: UIButton!
    @IBOutlet var embedVC: UIView!
    
    
    var currentPlace:BeerPlace? = nil //segway로 부터 전달받은 값
    /*
    var factoryController = FactoryDetailTableViewController()
    var breweryController = BreweryDetailTableViewController()
    var draftController = DraftDetailTableViewController() 
    */
    
    var favoController = FavoBeenViewController()
    var embededVC = DetailEmbededTableViewController()
    
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
        
        embededVC.detailPlace = currentPlace
        
        
        detailTypeImage = assignTypeIcon(currentPlace!) // type Image
        favoController.mapview.loadFirstPhotoForPlace(currentPlace!.placeID, imageView: detailImage) // Place Image
        detailName.text = currentPlace?.name
        detailAddress.text = currentPlace?.address
        detailRatings.text = String(currentPlace!.ratings)
        
        
        
        
        
        
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
    
    
}

