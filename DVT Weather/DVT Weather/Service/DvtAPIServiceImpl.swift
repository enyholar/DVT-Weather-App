//
//  YouthPartyAPIServiceImpl.swift
//  Youth Party
//
//  Created by adex on 30/01/2020.
//  Copyright © 2020 adex. All rights reserved.
//

import Foundation
import RxRetroSwift
import RxSwift
import RxCocoa
import Alamofire
import SwiftyJSON
struct DvtAPIServiceImpl : DvtAPIService {
    
    func currentWeather(lon: String, lat: String, successHandler: @escaping (CurrentWeatherResponse) -> Void, errorHandler: @escaping (Error) -> Void) {
           let urls: String = "http://api.openweathermap.org/data/2.5/weather?" + "lat=\(lon)" + "&lon=\(lat)" + "&appid=\(AppConstants.APP_ID)"
        makeAPIRequest(apiResponseType:CurrentWeatherResponse.self, url: urls, method: .get, params: nil, encoding: JSONEncoding.default, successHandler: successHandler, errorHandler: errorHandler)
    }
    
    func forecastWeather(lon: String, lat: String, successHandler: @escaping (ForecastResponse) -> Void, errorHandler: @escaping (Error) -> Void) {
              let urls: String = "http://api.openweathermap.org/data/2.5/forecast?" + "lat=\(lon)" + "&lon=\(lat)" + "&appid=\(AppConstants.APP_ID)"
           makeAPIRequest(apiResponseType:ForecastResponse.self, url: urls, method: .get, params: nil, encoding: JSONEncoding.default, successHandler: successHandler, errorHandler: errorHandler)
       }
       
    
    var caller : RequestCaller
    var requestHeaders : [String : String]
    let headers: HTTPHeaders = [
        .contentType("application/json"),
        .accept("application/json")
    ]
    init(caller: RequestCaller, headers : [String : String]) {
        self.caller = caller
        RequestModel.defaults.baseUrl = AppConstants.apiBaseUrl
        self.requestHeaders = headers
    }
    

    
    //MARK: - makeAPIRequest
    //Generic function that makes API requests using a Generic Type of the data to be returned from the API call.
    fileprivate func makeAPIRequest<T: Codable>(apiResponseType: T.Type, url: String, method: HTTPMethod = .get, params: [String : Any]? = nil, encoding: ParameterEncoding = URLEncoding.default, successHandler: @escaping (T) -> Void, errorHandler: @escaping (Error) -> Void){
        
        AF.request(url, method: method, parameters: params, encoding: encoding, headers: headers).responseJSON { response in
            switch response.result {
            case .success(let value):
                 print("Response Value: \(response.result)")
                if let json = value as? [String: Any] {
                    do {
                    let responseTest = try JSONDecoder().decode(apiResponseType.self, from: response.data!)
                    successHandler(responseTest)
                } catch let error {
                    print(error)
                    errorHandler(error)
                    }
                    
                 //   print(json["Result"] as? Int)
                }
            case .failure(let error):
                 print(error)
                errorHandler(error)
            }
        }
        
    }
    
}
