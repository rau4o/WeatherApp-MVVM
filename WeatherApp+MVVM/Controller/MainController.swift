//
//  MainController.swift
//  WeatherApp+MVVM
//
//  Created by rau4o on 5/4/20.
//  Copyright © 2020 rau4o. All rights reserved.
//

import UIKit

class MainController: UIViewController {
    
    // MARK: - Properties
    
    let mainView = MainView()
    let mainViewModel = MainViewModel()
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layoutUI()
        setupNavigationBarButtons()
        fetchData()
    }
    
    // MARK: - Helper function
    
    private func setupNavigationBarButtons() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addCityPressed(_:)))
    }
    
    private func fetchData() {
        self.mainViewModel.didFinishLoadData = { [weak self] in
            guard let self = self else {return}
            self.mainView.currentLocationText = self.mainViewModel.currentLocationTextViewModel ?? ""
            self.mainView.currentTimeText = self.mainViewModel.currentTimeTextViewModel ?? ""
            self.mainView.currentTemperatureText = self.mainViewModel.currentTemperatureTextViewModel ?? ""
            self.mainView.tempDescriptionText = self.mainViewModel.tempDescriptionTextViewModel ?? ""
            self.mainView.maxTempText = self.mainViewModel.maxTempTextViewModel ?? ""
            self.mainView.minTempText = self.mainViewModel.minTempTextViewModel ?? ""
        }
    }
    
    private func layoutUI() {
        view.addSubview(mainView)
        mainView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
    }
    
    // MARK: - Selectors
    
    @objc private func addCityPressed(_ sender: UIBarButtonItem) {
        let alertController = UIAlertController(title: "Please Enter your city", message: "Please correctly enter your city", preferredStyle: .alert)
        alertController.addTextField { (text) in
            text.placeholder = "City Mame"
        }
        let saveAction = UIAlertAction(title: "OK", style: .default) { [weak self] (action) in
            guard let self = self else {return}
            let textField = alertController.textFields![0] as UITextField
            guard let cityName = textField.text else {return}
            self.mainViewModel.loadData(city: cityName)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alertController.addAction(saveAction)
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true, completion: nil)
    }
}
