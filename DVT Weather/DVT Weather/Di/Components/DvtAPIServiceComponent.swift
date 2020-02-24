//
//  YouthPartyAPIServiceComponent.swift
//  Youth Party
//
//  Created by adex on 30/01/2020.
//  Copyright © 2020 adex. All rights reserved.
//

import Foundation
import Cleanse

struct DvtAPIServiceComponent: RootComponent {
    typealias Root = DvtAPIService
    

    
    static func configure(binder: Binder<DvtAppScope>) {
        //Include WFMMobileAPIServiceModule in the WFMMobileAPIServiceComponent. It helps resolve the component's dependencies.
        binder.include(module: DvtAPIServiceModule.self)
    }
    
    static func configureRoot(binder bind: ReceiptBinder<DvtAPIService>) -> BindingReceipt<DvtAPIService> {
        return bind.to(factory: { (dvtAPIServiceImpl: DvtAPIServiceImpl) -> DvtAPIService in
            dvtAPIServiceImpl
        })
    }
    
    
}
