//
//  HomepageView.swift
//  stroll
//
//  Created by Chapin Alf on 10/30/23.
//

import UIKit

class HomepageView: UIScrollView {
    
    var contentWrapper: UIScrollView!

    var locationLabel: UILabel!
    var locationPhoto: UIImageView!
    
    var leaderBoardLabel: UILabel!
    var startButton: UIButton!
    
    var additionalInformationTitle: UILabel!
    var additionalInformationText: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //MARK: set the background color...
        self.backgroundColor = .white
        
        //MARK: initializing the UI elements and constraints...
        setUpContentWrapper()
        
        setUpLocationLabel()
        setUpLocationPhoto()
        
        setUpLeaderBoardLabel()
        setUpStartButton()
        
        setUpAdditionalInformationTitle()
        setUpAdditionalInformationText()

        
        initConstraints()
    }
    //MARK: set up UI elements
    func setUpContentWrapper() {
        contentWrapper = UIScrollView()
        contentWrapper.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(contentWrapper)
    }
    func setUpLocationLabel() {
        locationLabel = UILabel()
        locationLabel.text = "TODAY'S LOCATION"
        locationLabel.textAlignment = .center
        locationLabel.textColor = UIColor.black
        locationLabel.font = UIFont.boldSystemFont(ofSize: 35.0)
        locationLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(locationLabel)
    }
    func setUpLocationPhoto() {
        locationPhoto = UIImageView()
        locationPhoto.image = UIImage(named: "Caffe Nero") // Replace "your_image_name" with the actual name of your image asset.
        locationPhoto.contentMode = .scaleAspectFit // Adjust the content mode to your needs.
        locationPhoto.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(locationPhoto)
    }
    func setUpLeaderBoardLabel() {
        leaderBoardLabel = UILabel()
        leaderBoardLabel.text = "Your friends that have completed this stroll:"
        leaderBoardLabel.textAlignment = .center
        leaderBoardLabel.textColor = UIColor.black
        leaderBoardLabel.font = UIFont.boldSystemFont(ofSize: 15.0)
        leaderBoardLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(leaderBoardLabel)
    }
    func setUpStartButton() {
        startButton = UIButton(type: .system)
        startButton.setTitle("start your stroll", for: .normal)
        startButton.setTitleColor(.white, for: .normal)
        startButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        startButton.layer.cornerRadius = 15
        startButton.backgroundColor = .black // Set the background color
        startButton.layer.borderWidth = 1.0 // Add a border
        startButton.layer.borderColor = UIColor.black.cgColor // Set the border color
        startButton.contentEdgeInsets = UIEdgeInsets(top: 15, left: 20, bottom: 15, right: 20)
        startButton.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(startButton)
    }
    func setUpAdditionalInformationTitle() {
        additionalInformationTitle = UILabel()
        additionalInformationTitle.text = "Additional Information about Today's Location"
        additionalInformationTitle.textAlignment = .center
        additionalInformationTitle.textColor = UIColor.black
        additionalInformationTitle.font = UIFont.boldSystemFont(ofSize: 16.0)
        additionalInformationTitle.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(additionalInformationTitle)
    }
    func setUpAdditionalInformationText() {
        additionalInformationText = UILabel()
//        additionalInformationText.text = """
//        Our goal since the very beginning has been
//        to create a place that radiates comfort,
//        relaxation and warmth. A place to meet
//        friends, work or just watch the world go by.
//        A local neighborhood spot.
//
//        We are lucky to have some fantastic people
//        in our company that bring this to life,
//        giving each store its own character through
//        a combination of personal service and
//        unique design.
//
//        And, of course, great coffee.
//        """
        additionalInformationText.text = """
        Our goal since the very beginning has been
        to create a place that radiates comfort,
        relaxation and warmth. A place to meet
        friends, work or just watch the world go by.
        A local neighborhood spot.
        """
        additionalInformationText.numberOfLines = 0 // Allow multiple lines
        additionalInformationText.textAlignment = .center
        additionalInformationText.textColor = UIColor.black
        additionalInformationText.font = UIFont.systemFont(ofSize: 14.0)
        additionalInformationText.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(additionalInformationText)
    }

    
    
    
    //MARK: initializing constraints...
    func initConstraints(){
        NSLayoutConstraint.activate([
            //MARK: contentWrapper constraints...
            contentWrapper.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            contentWrapper.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            contentWrapper.widthAnchor.constraint(equalTo: self.safeAreaLayoutGuide.widthAnchor),
            contentWrapper.bottomAnchor.constraint(equalTo: additionalInformationText.bottomAnchor),
            contentWrapper.heightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.heightAnchor),
            
            
            locationLabel.topAnchor.constraint(equalTo: contentWrapper.topAnchor, constant: 20),
            locationLabel.centerXAnchor.constraint(equalTo: contentWrapper.centerXAnchor),
            
            locationPhoto.topAnchor.constraint(equalTo: locationLabel.topAnchor),
            locationPhoto.centerXAnchor.constraint(equalTo: contentWrapper.centerXAnchor),
            locationPhoto.widthAnchor.constraint(equalToConstant: 325),
            locationPhoto.heightAnchor.constraint(equalToConstant: 325),
            
            leaderBoardLabel.topAnchor.constraint(equalTo: locationPhoto.bottomAnchor, constant: 1.0),
            leaderBoardLabel.centerXAnchor.constraint(equalTo: contentWrapper.centerXAnchor),
            
            startButton.topAnchor.constraint(equalTo: leaderBoardLabel.bottomAnchor, constant: 150),
            startButton.centerXAnchor.constraint(equalTo: contentWrapper.centerXAnchor),
            
            additionalInformationTitle.topAnchor.constraint(equalTo: startButton.bottomAnchor, constant: 50),
            additionalInformationTitle.centerXAnchor.constraint(equalTo: contentWrapper.centerXAnchor),
            
            additionalInformationText.topAnchor.constraint(equalTo: additionalInformationTitle.bottomAnchor),
            additionalInformationText.centerXAnchor.constraint(equalTo: contentWrapper.centerXAnchor),
            additionalInformationText.bottomAnchor.constraint(equalTo: contentWrapper.bottomAnchor)
        ])
    }
    

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

