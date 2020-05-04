//
//  MainView.swift
//  WeatherApp+MVVM
//
//  Created by rau4o on 5/4/20.
//  Copyright © 2020 rau4o. All rights reserved.
//

import UIKit

class MainView: UIView {
    
    // MARK: - Properties
    
    var currentLocationText: String = "" {
        didSet{
            currentLocationLabel.text = currentLocationText
        }
    }
    
    var currentTimeText: String = "" {
        didSet {
            currentTimeLabel.text = currentTimeText
        }
    }
    
    var currentTemperatureText: String = "" {
        didSet {
            currentTemperatureLabel.text = currentTemperatureText
        }
    }
    
    var tempDescriptionText: String = "" {
        didSet {
            tempDescriptionLabel.text = tempDescriptionText
        }
    }
    
    var maxTempText: String = "" {
        didSet {
            maxTempLabel.text = maxTempText
        }
    }
    
    var minTempText: String = "" {
        didSet {
            minTempLabel.text = minTempText
        }
    }
    
    var tempSymbol: UIImageView = UIImageView() {
        didSet {
            tempSymbolImage.image = tempSymbol.image
        }
    }
    
    private let currentLocationLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 38,weight: .heavy)
        return label
    }()
    
    private let currentTimeLabel: UILabel = {
        let label = UILabel()
        label.text = "28 March 2020"
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 10, weight: .heavy)
        return label
    }()
    
    private let currentTemperatureLabel: UILabel = {
        let label = UILabel()
        label.text = "°C"
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 60, weight: .heavy)
        return label
    }()
    
    private let tempDescriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "..."
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 14, weight: .light)
        return label
    }()
    
    private let tempSymbolImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.tintColor = .gray
        return image
    }()
    
    private let maxTempLabel: UILabel = {
        let label = UILabel()
        label.text = "  °C"
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        return label
    }()
    
    private let minTempLabel: UILabel = {
        let label = UILabel()
        label.text = "  °C"
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        return label
    }()
    
    // MARK: - Init

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        layoutUI()
    }
    
    // MARK: - Helper function
    
    private func layoutUI() {
        addSubview(currentLocationLabel)
        addSubview(currentTimeLabel)
        addSubview(currentTemperatureLabel)
        addSubview(tempDescriptionLabel)
        addSubview(tempSymbolImage)
        addSubview(maxTempLabel)
        addSubview(minTempLabel)
        
        currentLocationLabel.anchor(top: safeAreaLayoutGuide.topAnchor, left: leftAnchor, right: rightAnchor, paddingTop: 20, paddingLeft: 20, paddingBottom: 0, paddingRight: 20, height: 80)
        
        currentTimeLabel.anchor(top: currentLocationLabel.bottomAnchor, left: leftAnchor, right: rightAnchor, paddingTop: 4, paddingLeft: 20, paddingBottom: 0, paddingRight: 20, height: 10)
        
        currentTemperatureLabel.centerY(inView: self, leftAnchor: leftAnchor, paddingLeft: 20, constant: 20)
        currentTemperatureLabel.setDimension(height: 70, width: 250)
        
        tempSymbolImage.anchor(top: currentTemperatureLabel.bottomAnchor, left: leftAnchor, paddingTop: 0, paddingLeft: 20, paddingBottom: 0, paddingRight: 0, width: 50, height: 50)
        
        tempDescriptionLabel.anchor(top: currentTemperatureLabel.bottomAnchor, left: tempSymbolImage.rightAnchor, paddingTop: 12, paddingLeft: 8, paddingBottom: 0, paddingRight: 0, width: 250, height: 20)
        
        minTempLabel.anchor(top: tempSymbolImage.bottomAnchor, left: leftAnchor, paddingTop: 80, paddingLeft: 20, paddingBottom: 0, paddingRight: 0, width: 100, height: 20)
        
        maxTempLabel.anchor(top: minTempLabel.bottomAnchor, left: leftAnchor, paddingTop: 0, paddingLeft: 20, paddingBottom: 0, paddingRight: 0, width: 100, height: 20)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
