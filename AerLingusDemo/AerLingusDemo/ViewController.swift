//
//  ViewController.swift
//  AerLingusDemo
//
//  Created by mark.sharvin on 08/03/2019.
//  Copyright © 2019 Mark Sharvin. All rights reserved.
//

import UIKit

class ViewController: UIViewController,AerLingusDemoViewProtocol {
    @IBOutlet weak var fromToAirportsContainer: UIView!
    @IBOutlet weak var fromAirportContainer: UIView!
    @IBOutlet weak var fromAirport: UILabel!
    @IBOutlet weak var toAirportContainer: UIView!
    @IBOutlet weak var toAirport: UILabel!
    var presenter: AerLingusDemoPresenterProtocol?
    var baseAirport: Airport?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let fromTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(loadFromAirportSelectionView))
        let toTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(loadToAirportSelectionView))
        fromAirportContainer.addGestureRecognizer(fromTapGestureRecognizer)
        toAirportContainer.addGestureRecognizer(toTapGestureRecognizer)
        AerLingusDemoRouter.createAerLingusDemoModule(demoRef: self)
        presenter?.viewDidLoad()
    }
    
    @objc func loadFromAirportSelectionView() {
        presenter?.showAirportsList(with: nil, from: self, addAirportDelegate: presenter)
    }
    
    @objc func loadToAirportSelectionView() {
        presenter?.showAirportsList(with: baseAirport, from: self, addAirportDelegate: presenter)
    }
    
    func updateFromAirport(airport: Airport?) {
        guard let baseAirport = airport else {
            fromAirport.text = "Please select a From Airport"
            return
        }
        self.baseAirport = baseAirport
        fromAirport.text = "\(baseAirport.name)(\(baseAirport.code))"
        //Reset the toAirport info
        toAirport.text = "Please select a To Airport"
    }
    
    func updateToAirport(airport: Airport?) {
        guard let arrivalAirport = airport else {
            toAirport.text = "Please select a To Airport"
            return
        }
        toAirport.text = "\(arrivalAirport.name)(\(arrivalAirport.code))"
    }
    
}

