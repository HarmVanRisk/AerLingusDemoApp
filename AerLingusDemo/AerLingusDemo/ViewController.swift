//
//  ViewController.swift
//  AerLingusDemo
//
//  Created by mark.sharvin on 08/03/2019.
//  Copyright © 2019 Mark Sharvin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let allAirportDetails : AllAirportDetails
        if let filePath = Bundle.main.path(forResource: "AirportDetails", ofType: "json") {
            do {
                let fileURL = URL(fileURLWithPath: filePath);
                let allAirportData = try Data(contentsOf: fileURL)//, options:.mappedIfSafe)
                let detailsSelf = AllAirportDetails.self
                allAirportDetails = try JSONDecoder().decode(detailsSelf, from: allAirportData)
                print(allAirportDetails.businessFares!)
            } catch {
                print("error")
            }
        }
    }


}

