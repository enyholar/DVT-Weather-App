//
//  BasePresenter.swift
//  WFM Mobile
//
//  Created by Isaac Iniongun on 10/05/2019.
//  Copyright © 2019 Crown Interactive. All rights reserved.
//

import Foundation

protocol BasePresenter {
    
    func viewDidLoad()
    
    func viewWillAppear()
    
    func viewDidAppear()
    
    func viewWillDisappear()
    
    func viewDidDisappear()
}
