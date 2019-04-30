//
//  AerLingusDemoProtocols.swift
//  AerLingusDemo
//
//  Created by mark.sharvin on 19/03/2019.
//  Copyright © 2019 Mark Sharvin. All rights reserved.
//

import UIKit

protocol AerLingusDemoViewProtocol: class {
    //Presenter -> View
    func updateFromAirport(airport: Airport?)
    func updateToAirport(airport: Airport?)
}

protocol AerLingusDemoPresenterProtocol: class, SelectAirportModuleDelegate {
    //View -> Presenter
    var interactor: AerLingusDemoInputInteractorProtocol? {get set}
    var presenter: AerLingusDemoPresenterProtocol? {get set}
    var view: AerLingusDemoViewProtocol? {get set}
    var router: AerLingusDemoRouterProtocol? {get set}
    
    func viewDidLoad()
    func showAirportsList(with airport: Airport?, from view: UIViewController, addAirportDelegate:SelectAirportModuleDelegate?)
}

protocol AerLingusDemoRouterProtocol: class {
    //Presenter -> Router
    func pushToAirportList(with airport: Airport?, from view: UIViewController, addAirportDelegate:SelectAirportModuleDelegate?)
    static func createAerLingusDemoModule(demoRef: ViewController)
}

protocol AerLingusDemoInputInteractorProtocol: class {
    //Presenter -> Interactor
    var presenter: AerLingusDemoOutputInteractorProtocol? {get set}
    func loadInitialData()
    func generateAirportData() -> AllAirportDetails?
}

protocol AerLingusDemoOutputInteractorProtocol: class {
    //Interactor -> Presenter
    func fromAirportDidGenerate(airport: Airport?)
    func toAirportDidGenerate(airport: Airport?)
}
