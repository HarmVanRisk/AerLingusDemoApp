//
//  AerLingusDemoPresenter.swift
//  AerLingusDemo
//
//  Created by mark.sharvin on 19/03/2019.
//  Copyright © 2019 Mark Sharvin. All rights reserved.
//

import UIKit

class AerLingusDemoPresenter: AerLingusDemoPresenterProtocol {
    var presenter: AerLingusDemoPresenterProtocol?
    var interactor: AerLingusDemoInputInteractorProtocol?
    var view: AerLingusDemoViewProtocol?
    var router: AerLingusDemoRouterProtocol?
    
    func viewDidLoad() {
        interactor?.loadInitialData()
    }
    
    func showAirportsList(with airport: Airport?, from view: UIViewController, addAirportDelegate: SelectAirportModuleDelegate?) {
        router?.pushToAirportList(with: airport, from: view, addAirportDelegate: addAirportDelegate)
    }
    
    func didSelect(fromAirport airport: Airport) {
        fromAirportDidGenerate(airport: airport)
    }
    
    func didSelect(toAirport airport: Airport) {
        toAirportDidGenerate(airport: airport)
    }
}

extension AerLingusDemoPresenter: AerLingusDemoOutputInteractorProtocol {
    
    func fromAirportDidGenerate(airport: Airport?) {
        view?.updateFromAirport(airport: airport)
    }
    
    func toAirportDidGenerate(airport: Airport?) {
        view?.updateToAirport(airport: airport)
    }
}
