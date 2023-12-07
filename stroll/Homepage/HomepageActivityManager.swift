//
//  HomepageActivityManager.swift
//  stroll
//
//  Created by Gigi Gillen on 12/6/23.
//

import Foundation

extension HomepageViewController:ProgressSpinnerDelegate{
    
    //MARK: show activity indcator...
    func showActivityIndicator(){
        addChild(childProgressView)
        view.addSubview(childProgressView.view)
        childProgressView.didMove(toParent: self)
    }
    
    //MARK: hide activity indcator...
    func hideActivityIndicator(){
        childProgressView.willMove(toParent: nil)
        childProgressView.view.removeFromSuperview()
        childProgressView.removeFromParent()
    }
}

