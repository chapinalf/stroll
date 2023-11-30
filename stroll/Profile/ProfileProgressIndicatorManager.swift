//
//  ProfileProgressIndicatorManager.swift
//  stroll
//
//  Created by Chapin Alf on 11/29/23.
//

extension ProfileViewController:ProgressSpinnerDelegate{
    
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
