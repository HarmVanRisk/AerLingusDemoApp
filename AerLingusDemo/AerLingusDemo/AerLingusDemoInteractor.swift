//
//  AerLingusDemoInteractor.swift
//  AerLingusDemo
//
//  Created by mark.sharvin on 19/03/2019.
//  Copyright © 2019 Mark Sharvin. All rights reserved.
//

import UIKit

class AerLingusDemoInteractor: AerLingusDemoInputInteractorProtocol {
    weak var presenter: AerLingusDemoOutputInteractorProtocol?
    
    func loadInitialData() {
        presenter?.fromAirportDidGenerate(airport: nil)
        presenter?.toAirportDidGenerate(airport: nil)
    }
    
    func generateAirportData() -> AllAirportDetails? {
        if let filePath = Bundle.main.path(forResource: "AirportDetails", ofType: "json") {
            do {
                let fileURL = URL(fileURLWithPath: filePath);
                let allAirportData = try Data(contentsOf: fileURL, options:.mappedIfSafe)
                let detailsSelf = AllAirportDetails.self
                let allAirportDetails = try JSONDecoder().decode(detailsSelf, from: allAirportData)
                return allAirportDetails
            } catch {
                print("error")
            }
        }
        return nil
    }
    
    
}
