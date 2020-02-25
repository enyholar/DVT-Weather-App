//
//  BasePresenter.swift
//  DVT WEATHER
//
//  Created by adex on 23/02/2020.
//  Copyright © 2020 Gideon Oyediran. All rights reserved.
//

import Foundation

protocol BasePresenter {
    
    func viewDidLoad()
    
    func viewWillAppear()
    
    func viewDidAppear()
    
    func viewWillDisappear()
    
    func viewDidDisappear()
}
