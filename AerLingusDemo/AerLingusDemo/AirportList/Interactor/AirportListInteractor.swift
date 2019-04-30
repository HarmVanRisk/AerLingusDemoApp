//
//  AirportListInteractor.swift
//  AerLingusDemo
//
//  Created by mark.sharvin on 22/03/2019.
//  Copyright © 2019 Mark Sharvin. All rights reserved.
//

import UIKit

class AirportListInteractor: AirportListInputInteractorProtocol {
    var presenter: AirportListOutputInteractorProtocol?
    var allAirportDetails: AllAirportDetails?
    var allAirports = [String:Airport]()
    var allCountries = [String:Country]()
    var airportToCountry = [String : String]()
    var countryToAirport = [String : String]()
    
    func loadInitialData() {
        if let filePath = Bundle.main.path(forResource: "AirportDetails", ofType: "json") {
            do {
                let fileURL = URL(fileURLWithPath: filePath);
                let allAirportData = try Data(contentsOf: fileURL, options:.mappedIfSafe)
                let detailsSelf = AllAirportDetails.self
                allAirportDetails = try JSONDecoder().decode(detailsSelf, from: allAirportData)
                if let countries = allAirportDetails?.countries {
                    for country in countries {
                        for wrapper in country.airports {
                            airportToCountry[wrapper.airport.code] = country.code
                            countryToAirport[country.code] = wrapper.airport.code
                            allAirports[wrapper.airport.code] = wrapper.airport
                        }
                        allCountries[country.code] = country
                    }
                }
            } catch {
                print("Error on loading initial data")
            }
        }
    }
    
    func loadAirports(baseAirport: Airport?) {
        var airports = [Airport]()
        if (baseAirport != nil) {
            if let baseCountryCode = airportToCountry[baseAirport!.code] {
                for (_,airport) in allAirports {
                    if let airportDestinations = airport.destinations {
                        for destionation in airportDestinations {
                            if destionation.country.code == baseCountryCode {
                                airports.append(airport)
                            }
                        }
                    }
                }
            }
        } else {
            for (_,airport) in allAirports {
                airports.append(airport)
            }
        }
        airports.sort { $0.name < $1.name }
        presenter?.airportsDidLoad(airports: airports)
    }

}
