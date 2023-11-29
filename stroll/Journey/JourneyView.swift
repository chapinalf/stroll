//
//  JourneyView.swift
//  stroll
//
//  Created by Chapin Alf on 10/30/23.
//

import UIKit

import UIKit
import MapKit

class JourneyView: UIView {
    var mapView:MKMapView!
    var buttonLoading:UIButton!
    var buttonCurrentLocation:UIButton!
    var buttonNavigate:UIButton!
    var buttonCheckIn:UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupMapView()
        setupButtonLoading()
        setupButtonCurrentLocation()
        setupButtonNavigate()
        setupButtonCheckIn()
        initConstraints()
    }
    
    func setupMapView(){
        mapView = MKMapView()
        mapView.translatesAutoresizingMaskIntoConstraints = false
        mapView.layer.cornerRadius = 10
        self.addSubview(mapView)
    }
    
    func setupButtonLoading(){
        buttonLoading = UIButton(type: .system)
        buttonLoading.setTitle("Fetching Location...  ", for: .normal)
        buttonLoading.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        buttonLoading.setImage(UIImage(systemName: "circle.dotted"), for: .normal)
        buttonLoading.layer.backgroundColor = UIColor.black.cgColor
        buttonLoading.tintColor = .white
        buttonLoading.layer.cornerRadius = 10
        
        buttonLoading.layer.shadowOffset = .zero
        buttonLoading.layer.shadowRadius = 4
        buttonLoading.layer.shadowOpacity = 0.7
        
        buttonLoading.translatesAutoresizingMaskIntoConstraints = false
        
        buttonLoading.isEnabled = false
        self.addSubview(buttonLoading)
    }
    
    func setupButtonCurrentLocation(){
        buttonCurrentLocation = UIButton(type: .system)
        buttonCurrentLocation.setImage(UIImage(systemName: "location.circle"), for: .normal)
        buttonCurrentLocation.layer.backgroundColor = UIColor.lightGray.cgColor
        buttonCurrentLocation.tintColor = .blue
        buttonCurrentLocation.layer.cornerRadius = 10
        
        buttonCurrentLocation.layer.shadowOffset = .zero
        buttonCurrentLocation.layer.shadowRadius = 4
        buttonCurrentLocation.layer.shadowOpacity = 0.7
        
        buttonCurrentLocation.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(buttonCurrentLocation)
    }
    
    func setupButtonNavigate() {
        buttonNavigate = UIButton(type: .system)
        buttonNavigate.setTitle("Navigate", for: .normal)
        buttonNavigate.backgroundColor = UIColor(red: 109/255, green: 205/255, blue: 255/255, alpha: 1)
        buttonNavigate.setTitleColor(.black, for: .normal)
        buttonNavigate.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        buttonNavigate.layer.cornerRadius = 10
        buttonNavigate.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(buttonNavigate)
    }
    
    func setupButtonCheckIn() {
        buttonCheckIn = UIButton(type: .system)
        buttonCheckIn.setTitle("Check In", for: .normal)
        buttonCheckIn.backgroundColor = UIColor(red: 109/255, green: 205/255, blue: 255/255, alpha: 1)
        buttonCheckIn.setTitleColor(.black, for: .normal)
        buttonCheckIn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        buttonCheckIn.layer.cornerRadius = 10
        buttonCheckIn.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(buttonCheckIn)
    }
    
    func initConstraints(){
        NSLayoutConstraint.activate([
            mapView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            mapView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor,  constant: -10),
            mapView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            mapView.bottomAnchor.constraint(equalTo: buttonNavigate.topAnchor, constant: -10),
            
            buttonLoading.centerXAnchor.constraint(equalTo: mapView.centerXAnchor),
            buttonLoading.centerYAnchor.constraint(equalTo: mapView.centerYAnchor),
            buttonLoading.widthAnchor.constraint(equalToConstant: 240),
            buttonLoading.heightAnchor.constraint(equalToConstant: 40),
            
            buttonCurrentLocation.trailingAnchor.constraint(equalTo: mapView.trailingAnchor, constant: -16),
            buttonCurrentLocation.bottomAnchor.constraint(equalTo: self.mapView.bottomAnchor, constant: -8),
            buttonCurrentLocation.heightAnchor.constraint(equalToConstant: 36),
            buttonCurrentLocation.widthAnchor.constraint(equalToConstant: 36),
            
            buttonNavigate.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            buttonNavigate.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            buttonNavigate.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor, constant: -5),
            
            buttonCheckIn.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            buttonCheckIn.leadingAnchor.constraint(equalTo: buttonNavigate.trailingAnchor, constant: 5),
            buttonCheckIn.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -10),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

