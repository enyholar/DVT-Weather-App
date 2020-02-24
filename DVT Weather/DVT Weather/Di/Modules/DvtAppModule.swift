//
//  YouthPartyAppModule.swift
//  Youth Party
//
//  Created by adex on 30/01/2020.
//  Copyright © 2020 adex. All rights reserved.
//

import Foundation
import Cleanse

struct DvtAppModule: Module {
    
    static func configure(binder: Binder<DvtAppScope>) {
        
        //Provide Dvt waether APIService
        binder
            .bind(DvtAPIService.self)
            .sharedInScope()
            .to { () -> DvtAPIService in
                let dvtAPIService: DvtAPIService = try! ComponentFactory.of(DvtAPIServiceComponent.self).build(())
                return dvtAPIService
            }
    }
    
    
}
