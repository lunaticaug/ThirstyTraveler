//
//  DetailViewController.swift
//  ThirstyTraveler
//
//  Created by 양문영 on 2017. 1. 6..
//  Copyright © 2017년 moonyoung. All rights reserved.
//

import Foundation
import UIKit

class DetailViewController: UIViewController {
    
    var currentPlace:BeerPlace? = nil //segway로 부터 전달받은 값
    
    var factoryController = FactoryDetailTableViewController()
    var breweryController = BreweryDetailTableViewController()
    var draftController = DraftDetailTableViewController() 
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        //
        
        
        func embededDetail(currentPlace : BeerPlace){
            
            
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
                    draftController.viewDidLoad()
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
            
            
            
        } //embededdetail닫음
        //
        //        func loadFactoryDetailTableView (place:BeerPlace){
        //            place.officeTime.0.day
        //
        //
        //        }
        
        embededDetail(currentPlace!)
        
        
    } //뷰딧로드닫음
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

