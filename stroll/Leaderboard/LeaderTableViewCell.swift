//
//  LeaderTableViewCell.swift
//  stroll
//
//  Created by Zaneer Mitha on 11/16/23.
//

import UIKit

class LeaderTableViewCell: UITableViewCell {

    var wrapperCellView: UIView!
    var labelName: UILabel!
    var labelStrolls: UILabel!
    var labelStreak: UILabel!
        
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            setupWrapperCellView()
            setupLabelTitle()
            setupLabelAmount()
            setupLabelType()
            initConstraints()
        }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
            super.awakeFromNib()
            // Initialization code
        }
    
        func setupWrapperCellView(){
            wrapperCellView = UITableViewCell()
            wrapperCellView.translatesAutoresizingMaskIntoConstraints = false
            wrapperCellView.layer.cornerRadius = 5
            self.addSubview(wrapperCellView)
        }
        
        func setupLabelTitle(){
            labelName = UILabel()
            labelName.translatesAutoresizingMaskIntoConstraints = false
            wrapperCellView.addSubview(labelName)
        }
        func setupLabelAmount(){
            labelStrolls = UILabel()
            labelStrolls.translatesAutoresizingMaskIntoConstraints = false
            labelStrolls.font = .systemFont(ofSize: 18)
            wrapperCellView.addSubview(labelStrolls)
        }
        func setupLabelType(){
            labelStreak = UILabel()
            labelStreak.translatesAutoresizingMaskIntoConstraints = false
            labelStreak.font = .systemFont(ofSize: 18)
            wrapperCellView.addSubview(labelStreak)
        }
        
        func initConstraints(){
            NSLayoutConstraint.activate([
                wrapperCellView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
                wrapperCellView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
                wrapperCellView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
                wrapperCellView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
                
                labelName.topAnchor.constraint(equalTo: wrapperCellView.topAnchor, constant: 4),
                labelName.leadingAnchor.constraint(equalTo: wrapperCellView.leadingAnchor, constant: 5),
                labelName.heightAnchor.constraint(equalToConstant: 20),
                
                labelStrolls.topAnchor.constraint(equalTo: wrapperCellView.topAnchor, constant: 4),
                labelStrolls.leadingAnchor.constraint(equalTo: wrapperCellView.leadingAnchor, constant: 225),
                labelStrolls.heightAnchor.constraint(equalToConstant: 20),
                
                labelStreak.topAnchor.constraint(equalTo: wrapperCellView.topAnchor, constant: 4),
                labelStreak.leadingAnchor.constraint(equalTo: wrapperCellView.leadingAnchor, constant: 300),
                labelStreak.heightAnchor.constraint(equalToConstant: 20),
                
                wrapperCellView.heightAnchor.constraint(equalToConstant: 30)
            ])
        }

}
