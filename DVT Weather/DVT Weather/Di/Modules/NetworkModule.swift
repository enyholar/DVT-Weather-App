//
//  NetworkModule.swift
//  Youth Party
//
//  Created by adex on 30/01/2020.
//  Copyright © 2020 adex. All rights reserved.
//

import Foundation
import Cleanse
import RxRetroSwift

struct NetworkModule : Module {
    
    static func configure(binder: Binder<DvtAppScope>) {
        
        //provide URLSessionConfiguration
        binder
            .bind(URLSessionConfiguration.self)
            .sharedInScope()
            .to { URLSessionConfiguration.default }
        
        //Provide RequestCaller. It depends on `URLSessionConfiguration` configured above (`$0`).
        binder
            .bind(RequestCaller.self)
            .sharedInScope()
            .to{ (urlConfigSession: URLSessionConfiguration) -> RequestCaller in
                if #available(iOS 11.0, *) {
                    urlConfigSession.waitsForConnectivity = true
                }
                return RequestCaller(config: urlConfigSession)
            }
        
    }
    
}
