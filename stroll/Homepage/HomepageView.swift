//
//  HomepageView.swift
//  stroll
//
//  Created by Chapin Alf on 10/30/23.
//

import UIKit

class HomepageView: UIView {
    var strollColor = UIColor(red: 109/255, green: 205/255, blue: 255/255, alpha: 1)
    
    var contentWrapper: UIScrollView!

    var locationLabel: UILabel!
    var locationPhoto: UIImageView!
    
    var leaderBoardLabel: UILabel!
    var startButton: UIButton!

    var separatorLine: UIView!
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
        contentWrapper.backgroundColor = strollColor
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
        contentWrapper.addSubview(locationLabel)
    }
    func setUpLocationPhoto() {
        locationPhoto = UIImageView()
        locationPhoto.image = UIImage(named: "Nero") // Replace "your_image_name" with the actual name of your image asset.
        locationPhoto.contentMode = .scaleAspectFit // Adjust the content mode to your needs.
        locationPhoto.translatesAutoresizingMaskIntoConstraints = false
        locationPhoto.layer.cornerRadius = 20 // Adjust the corner radius to your preference
        locationPhoto.clipsToBounds = true // Clip to bounds
        contentWrapper.addSubview(locationPhoto)
    }
    func setUpLeaderBoardLabel() {
        leaderBoardLabel = UILabel()
        leaderBoardLabel.text = "Your friends that have completed this stroll:"
        leaderBoardLabel.textAlignment = .center
        leaderBoardLabel.textColor = UIColor.black
        leaderBoardLabel.font = UIFont.boldSystemFont(ofSize: 15.0)
        leaderBoardLabel.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(leaderBoardLabel)
    }
    func setUpStartButton() {
        startButton = UIButton(type: .system)
        startButton.setTitle("start your stroll", for: .normal)
        startButton.setTitleColor(strollColor, for: .normal)
        startButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        startButton.layer.cornerRadius = 15
        startButton.backgroundColor = .white // Set the background color
        startButton.layer.borderWidth = 1.0 // Add a border
        startButton.layer.borderColor = UIColor.white.cgColor // Set the border color
        startButton.contentEdgeInsets = UIEdgeInsets(top: 15, left: 20, bottom: 15, right: 20)
        startButton.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(startButton)
        
        // Add drop shadow
        startButton.layer.shadowColor = UIColor.black.cgColor
        startButton.layer.shadowOpacity = 0.5
        startButton.layer.shadowOffset = CGSize(width: 0, height: 4)
        startButton.layer.shadowRadius = 8
    }
    func setUpAdditionalInformationTitle() {
        additionalInformationTitle = UILabel()
        additionalInformationTitle.text = "Additional Information about Today's Location"
        additionalInformationTitle.textAlignment = .center
        additionalInformationTitle.textColor = UIColor.black
        additionalInformationTitle.font = UIFont.boldSystemFont(ofSize: 16.0)
        additionalInformationTitle.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(additionalInformationTitle)
    }
    func setUpAdditionalInformationText() {
        additionalInformationText = UILabel()
        additionalInformationText.text = """
        Our goal since the very beginning has been
        to create a place that radiates comfort,
        relaxation and warmth. A place to meet
        friends, work or just watch the world go by.
        A local neighborhood spot.

        We are lucky to have some fantastic people
        in our company that bring this to life,
        giving each store its own character through
        a combination of personal service and
        unique design.

        And, of course, great coffee.
        """
        additionalInformationText.numberOfLines = 0 // Allow multiple lines
        additionalInformationText.textAlignment = .center
        additionalInformationText.textColor = UIColor.black
        additionalInformationText.font = UIFont.systemFont(ofSize: 14.0)
        additionalInformationText.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(additionalInformationText)
    }

    
    
    
    //MARK: initializing constraints...
    func initConstraints(){
        NSLayoutConstraint.activate([
            //MARK: contentWrapper constraints...
            contentWrapper.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            contentWrapper.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            contentWrapper.widthAnchor.constraint(equalTo:self.safeAreaLayoutGuide.widthAnchor),
            contentWrapper.heightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.heightAnchor),
            
            
            locationLabel.topAnchor.constraint(equalTo: contentWrapper.topAnchor, constant: 20),
            locationLabel.centerXAnchor.constraint(equalTo: contentWrapper.centerXAnchor),
            
            locationPhoto.topAnchor.constraint(equalTo: locationLabel.topAnchor, constant: 75),
            locationPhoto.centerXAnchor.constraint(equalTo: contentWrapper.centerXAnchor),
            locationPhoto.widthAnchor.constraint(equalToConstant: 325),
            locationPhoto.heightAnchor.constraint(equalToConstant: 325),
            
            startButton.topAnchor.constraint(equalTo: locationPhoto.bottomAnchor, constant: -35),
            startButton.centerXAnchor.constraint(equalTo: contentWrapper.centerXAnchor),
            
            leaderBoardLabel.topAnchor.constraint(equalTo: locationPhoto.bottomAnchor, constant: 100),
            leaderBoardLabel.centerXAnchor.constraint(equalTo: contentWrapper.centerXAnchor),
            
            
            additionalInformationTitle.topAnchor.constraint(equalTo: leaderBoardLabel.bottomAnchor, constant: 300),
            additionalInformationTitle.centerXAnchor.constraint(equalTo: contentWrapper.centerXAnchor),
            
            additionalInformationText.topAnchor.constraint(equalTo: additionalInformationTitle.bottomAnchor, constant: 10),
            additionalInformationText.centerXAnchor.constraint(equalTo: contentWrapper.centerXAnchor),
            additionalInformationText.bottomAnchor.constraint(equalTo: contentWrapper.bottomAnchor, constant: -30)
        ])
    }
    

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

