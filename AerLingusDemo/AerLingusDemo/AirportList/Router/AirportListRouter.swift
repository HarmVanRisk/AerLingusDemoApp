//
//  AirportListRouter.swift
//  AerLingusDemo
//
//  Created by mark.sharvin on 19/03/2019.
//  Copyright © 2019 Mark Sharvin. All rights reserved.
//

import UIKit

class AirportListRouter: AirportListRouterProtocol {
    func pushToAirportHome(from view: UIViewController) {
        view.dismiss(animated: true, completion: nil)
    }
    
    static func createAirportListModule(airportList: AirportsListViewController) {
        //something
        let presenter: AirportListPresenterProtocol & AirportListOutputInteractorProtocol = AirportListPresenter()
        airportList.presenter = presenter
        airportList.presenter?.router = AirportListRouter()
        airportList.presenter?.view = airportList
        airportList.presenter?.interactor = AirportListInteractor()
        airportList.presenter?.interactor?.presenter = presenter
        airportList.presenter?.selectAirportDelegate = airportList.addAirportDelegate
    }
    
}
