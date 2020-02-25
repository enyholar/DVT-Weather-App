//
//  DvtAPIServiceModule.swift
//  DVT Weather
//
//  Created by adex on 23/02/2020.
//  Copyright © 2020 Gideon Oyediran. All rights reserved.
//

import Foundation
import Cleanse
import RxRetroSwift

struct DvtAPIServiceModule: Module {
    
    static func configure(binder: Binder<DvtAppScope>) {
        
        //Include the NetworkModule
        binder.include(module: NetworkModule.self)
        
        //Provide headers for making network requests
        binder
            .bind([String : String].self)
            .sharedInScope()
            .to { () -> [String : String] in
                if let authHeader = UserDefaults.standard.string(forKey: AppConstants.USER_AUTH_HEADER_KEY) {
                   return ["Content-Type": "application/json", "Accept": "application/json"]
                } else {
                    return ["Content-Type": "application/json", "Accept": "application/json"]
                }
            }
        
        
        //Provide the DvtAPIServiceImpl
        binder
            .bind(DvtAPIServiceImpl.self)
            .sharedInScope()
            .to { (requestCaller: RequestCaller, requestHeaders: [String : String]) -> DvtAPIServiceImpl in
                return DvtAPIServiceImpl(caller: requestCaller, headers: requestHeaders)
            }
    }
    
    
}
