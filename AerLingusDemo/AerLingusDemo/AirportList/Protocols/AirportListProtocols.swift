//
//  AirportListProtocols.swift
//  AerLingusDemo
//
//  Created by mark.sharvin on 19/03/2019.
//  Copyright © 2019 Mark Sharvin. All rights reserved.
//

import UIKit

protocol SelectAirportModuleDelegate {
    func didSelect(fromAirport: Airport)
    func didSelect(toAirport: Airport)
}

protocol AirportListPresenterProtocol: class {
    //View -> Presenter
    var interactor: AirportListInputInteractorProtocol? {get set}
    var presenter: AirportListPresenterProtocol? {get set}
    var view: AirportListViewProtocol? {get set}
    var router: AirportListRouterProtocol? {get set}
    var selectAirportDelegate: SelectAirportModuleDelegate? {get set}
    
    func displayAirportList(with baseAirport:Airport?)
    func didSelectFrom(airport: Airport, from view:UIViewController)
    func didSelectTo(airport: Airport, from view:UIViewController)
}

protocol AirportListRouterProtocol: class {
    //Presenter -> Router
    static func createAirportListModule(airportList: AirportsListViewController)
    func pushToAirportHome(from view:UIViewController)
}

protocol AirportListInputInteractorProtocol: class {
    //Presenter -> Interactor
    var presenter: AirportListOutputInteractorProtocol? {get set}
    
    func loadInitialData()
    func loadAirports(baseAirport:Airport?)
}

protocol AirportListOutputInteractorProtocol: class {
    // Interactor -> Presenter
    func airportsDidLoad(airports: [Airport])
}

protocol AirportListViewProtocol: class {
    //Presenter -> View
    func airportListGenerated(airports: [Airport])
}

