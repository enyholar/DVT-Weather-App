//
//  BaseView.swift
//  WFM Mobile
//
//  Created by Isaac Iniongun on 10/05/2019.
//  Copyright © 2019 Crown Interactive. All rights reserved.
//

import Foundation

protocol BaseView {
    
    func showAlert(message: String)
    
    func showAlert(message: String, yesAction: @escaping () -> Void)
    
    func showAlert(message: String, title: String, actionText: String, action: @escaping () -> Void)
    
    func showLoading()
    
    func showLoading(with message: String)
    
    func hideLoading()
    
    func showSuccessAlert()
    
    func showSuccessAlert(with message: String)
    
    func showSuccessAlert(with message: String, dismissAction: @escaping () -> Void)
    
    func showFailureAlert()
    
    func showFailureAlert(with message: String)
    
    func showFailureAlert(with message: String, dismissAction: @escaping () -> Void)
    
    func showAlert(with message: String, alertType: AlertType, yesAction: @escaping () -> Void, noAction: @escaping () -> Void)
    
    func showToast(message: String)
    
    func hideToast()
    
    func showConfirmationAlert2(message: String, title: String, yesAction: @escaping () -> Void)
    
    func showConfirmationAlert(message: String, title: String, yesAction: @escaping () -> Void, noAction: @escaping () -> Void)
    
    func showConfirmationAlert(message: String, title: String, yesText: String, noText: String, yesAction: @escaping () -> Void, noAction: @escaping () -> Void)
    
    func runOnMainThread(_ action: @escaping () -> Void)
    
    func processServerResponseWithSessionTimeoutCheck(responseCode: Int, _ noSessionTimeoutAction: @escaping () -> Void)
    
    func dismissToRootViewController()
    
    func dismissVC()
    
}
