//
//  AirportsListViewController.swift
//  AerLingusDemo
//
//  Created by mark.sharvin on 26/03/2019.
//  Copyright © 2019 Mark Sharvin. All rights reserved.
//

import UIKit

class AirportsListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate, AirportListViewProtocol {
    
    var baseAirport: Airport?  = nil
    var presenter: AirportListPresenterProtocol?
    var airportsToDisplay = [Airport]()
    var allAirports = [Airport]()
    var isFiltering = false
    var addAirportDelegate : SelectAirportModuleDelegate?

    @IBOutlet weak var airportListTable: UITableView!
    @IBOutlet weak var airportSearch: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        airportListTable.dataSource = self
        airportListTable.delegate = self
        airportSearch.delegate = self
        AirportListRouter.createAirportListModule(airportList: self)
        presenter?.displayAirportList(with: baseAirport)
    }
    
    func airportListGenerated(airports: [Airport]) {
        //display them as data
        allAirports = airports
        airportsToDisplay = airports
        airportListTable.reloadData()
    }
    
    @IBAction func closeAirportList(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Table view data source
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return airportsToDisplay.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //TODO: implement cell reuse
        let cell = UITableViewCell()
        let currentAirport = airportsToDisplay[indexPath.row]
        cell.textLabel?.text = "\(currentAirport.name) (\(currentAirport.code))"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedAirport = airportsToDisplay[indexPath.row]
        if (baseAirport == nil) {
            presenter?.didSelectFrom(airport: selectedAirport, from: self)
        } else {
            presenter?.didSelectTo(airport: selectedAirport, from: self)
        }
    }
    
    //MARK: - Search delegate methods
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if (searchText.replacingOccurrences(of: " ", with: "").count > 0) {
            searchBar.setShowsCancelButton(false, animated: false)
            airportsToDisplay = allAirports.filter({ return $0.code.contains(searchText) || $0.name.contains(searchText) })
        } else {
            searchBar.setShowsCancelButton(true, animated: false)
            airportsToDisplay = allAirports
        }
        airportListTable.reloadData()
    }
    
}

