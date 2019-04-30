//
//  AirportListPresenter.swift
//  AerLingusDemo
//
//  Created by mark.sharvin on 22/03/2019.
//  Copyright © 2019 Mark Sharvin. All rights reserved.
//

import UIKit

class AirportListPresenter: AirportListPresenterProtocol {
    var interactor: AirportListInputInteractorProtocol?
    var presenter: AirportListPresenterProtocol?
    var view: AirportListViewProtocol?
    var router: AirportListRouterProtocol?
    var selectAirportDelegate: SelectAirportModuleDelegate?
    
    func displayAirportList(with baseAirport: Airport?) {
        interactor?.loadInitialData()
        interactor?.loadAirports(baseAirport: baseAirport)
    }
    
    func didSelectFrom(airport: Airport, from view: UIViewController) {
        router?.pushToAirportHome(from: view)
        selectAirportDelegate?.didSelect(fromAirport: airport)
    }
    
    func didSelectTo(airport: Airport, from view: UIViewController) {
        router?.pushToAirportHome(from: view)
        selectAirportDelegate?.didSelect(toAirport: airport)
    }
}

extension AirportListPresenter: AirportListOutputInteractorProtocol {
    func airportsDidLoad(airports: [Airport]) {
        view?.airportListGenerated(airports: airports)
    }
}
