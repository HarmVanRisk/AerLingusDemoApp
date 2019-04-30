//
//  AerLingusDemoRouter.swift
//  AerLingusDemo
//
//  Created by mark.sharvin on 20/03/2019.
//  Copyright © 2019 Mark Sharvin. All rights reserved.
//

import UIKit


class AerLingusDemoRouter: AerLingusDemoRouterProtocol {
    func pushToAirportList(with airport: Airport?, from view: UIViewController,addAirportDelegate: SelectAirportModuleDelegate?) {
        let listViewController = AirportsListViewController(nibName:"AirportsListViewController", bundle:Bundle.main)
        listViewController.baseAirport = airport
        listViewController.addAirportDelegate = addAirportDelegate
        view.present(listViewController, animated: true, completion: nil)
    }
    
    class func createAerLingusDemoModule(demoRef: ViewController) {
        let presenter: AerLingusDemoPresenterProtocol & AerLingusDemoOutputInteractorProtocol = AerLingusDemoPresenter()
        demoRef.presenter = presenter
        demoRef.presenter?.router = AerLingusDemoRouter()
        demoRef.presenter?.view = demoRef
        demoRef.presenter?.interactor = AerLingusDemoInteractor()
        demoRef.presenter?.interactor?.presenter = presenter
    }

}
