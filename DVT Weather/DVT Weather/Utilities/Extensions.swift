//
//  Extensions.swift
//  WFM Mobile
//
//  Created by Isaac Iniongun on 09/05/2019.
//  Copyright © 2019 Crown Interactive. All rights reserved.
//

import Foundation
import UIKit
import CoreLocation
import Alertift



//MARK: - Dash String
let dash = "-"





//Encode an object as Dictionary
extension Encodable {
    var dictionaryValue:[String: Any?]? {
        guard let data = try? JSONEncoder().encode(self),
            let dictionary = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] else {
                return nil
        }
        return dictionary
    }
}

//MARK: - UIButton Rounded Corners
//Add rounded corners to a UIButton using a radius value. The default corner radius value is 20
extension UIButton {
    
    func roundedCorners(using radius: Int = 20) {
        self.layer.cornerRadius = CGFloat(radius)
    }
    
    func changeButtonTitle(to title: String) {
        self.setTitle(title, for: .normal)
    }
}

//MARK: - UIView Rounded Corners
extension UIView {
    
    func roundCorners(using radius: Int = 20) {
        self.layer.cornerRadius = CGFloat(radius)
    }
    
    func roundSquareCorners(using radius: Int = 1) {
           self.layer.cornerRadius = CGFloat(radius)
       }
    
    func addErrorBorder() {
        layer.masksToBounds = true
        layer.borderWidth = 1
        layer.borderColor = UIColor.red.cgColor
    }
    
    func removeErrorBorder() {
        layer.borderWidth = 0
    }
    
    func removeSelectButtonErrorBorder() {
        layer.masksToBounds = true
        layer.borderWidth = 1
     //   layer.borderColor = appColorAccent?.cgColor
    }
    
    func addTapGesture(action: @escaping ()->Void ){
        let tap = UIViewTapGestureRecognizer(target: self , action: #selector(self.handleTap(_:)))
        tap.action = action
        tap.numberOfTapsRequired = 1
        
        self.addGestureRecognizer(tap)
        self.isUserInteractionEnabled = true
        
    }
    @objc func handleTap(_ sender: UIViewTapGestureRecognizer) {
        sender.action!()
    }
    
}

//MARK: - Custom UIViewTapGestureRecognizer
class UIViewTapGestureRecognizer: UITapGestureRecognizer {
    var action : (()->Void)? = nil
}

func addRoundedCorners(uiElements: [UIView], using radius: Int = 20){
    uiElements.forEach { (uiView) in
        uiView.roundCorners(using: radius)
    }
}

//Map a JSON String to an actual object
extension Decodable {
    static func map(jsonString: String) throws -> Self? {
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return try decoder.decode(Self.self, from: Data(jsonString.utf8))
        
//        do {
//            let decoder = JSONDecoder()
//            decoder.keyDecodingStrategy = .convertFromSnakeCase
//            return try decoder.decode(Self.self, from: Data(jsonString.utf8))
//        } catch let error {
//            print(error)
//            return nil
//        }
    }
}

//Save object to UserData.plist

// MARK: - JSONDecoder extensions
extension JSONDecoder {
    
    /// Decode an object, decoded from a JSON object.
    ///
    /// - Parameter data: JSON object Data
    /// - Returns: Decodable object
    func decode<T: Decodable>(from data: Data?) -> T? {
        guard let data = data else {
            return nil
        }
        return try? self.decode(T.self, from: data)
    }
    
    /// Decode an object in background thread, decoded from a JSON object.
    ///
    /// - Parameters:
    ///   - data: JSON object Data
    ///   - onDecode: Decodable object
    func decodeInBackground<T: Decodable>(from data: Data?, onDecode: @escaping (T?) -> Void) {
        DispatchQueue.global().async {
            let decoded: T? = self.decode(from: data)
            
            DispatchQueue.main.async {
                onDecode(decoded)
            }
        }
    }
}

// MARK: - JSONEncoder extensions
extension JSONEncoder {
    
    /// Encodable an object
    ///
    /// - Parameter value: Encodable Object
    /// - Returns: Data encode or nil
    func encode<T: Encodable>(from value: T?) -> Data? {
        guard let value = value else {
            return nil
        }
        return try? self.encode(value)
    }
    
    /// Encodable an object in background thread
    ///
    /// - Parameters:
    ///   - encodableObject: Encodable Object
    ///   - onEncode: Data encode or nil
    func encodeInBackground<T: Encodable>(from encodableObject: T?, onEncode: @escaping (Data?) -> Void) {
        DispatchQueue.global().async {
            let encode = self.encode(from: encodableObject)
            
            DispatchQueue.main.async {
                onEncode(encode)
            }
        }
    }
}

// MARK: - NSUserDefaults extensions
extension UserDefaults {
    
    /// Set Encodable object in UserDefaults
    ///
    /// - Parameters:
    ///   - type: Encodable object type
    ///   - key: UserDefaults key
    /// - Throws: An error if any value throws an error during encoding.
    func set<T: Encodable>(object type: T, for key: String, onEncode: @escaping (Bool) -> Void) throws {
        
        JSONEncoder().encodeInBackground(from: type) { [weak self] (data) in
            guard let data = data, let `self` = self else {
                onEncode(false)
                return
            }
            self.set(data, forKey: key)
            onEncode(true)
        }
    }
    
    /// Get Decodable object in UserDefaults
    ///
    /// - Parameters:
    ///   - objectType: Decodable object type
    ///   - forKey: UserDefaults key
    ///   - onDecode: Codable object
    func get<T: Decodable>(object type: T.Type, for key: String, onDecode: @escaping (T?) -> Void) {
        let data = value(forKey: key) as? Data
        JSONDecoder().decodeInBackground(from: data, onDecode: onDecode)
    }
}

///Save objectType to UserDefaults
/// - Parameters:
///     - objectType: The type to be saved to UserDefaults
func saveToUserDefaults<T: Codable>(this objectType: T?, using key: String) {
    do {
        try UserDefaults.standard.set(object: objectType, for: key, onEncode: { (isSuccess) in
            if isSuccess {
                print("\(key) successfully saved to UserDefaults.")
            } else {
                print("\(key) not saved to UserDefaults.")
            }
        })
    } catch {
        print("Error saving \(key) object:\n\(error)")
    }
}

//MARK: - DATE Extensions

extension Date {
    
    /// Create a date from specified parameters
    ///
    /// - Parameters:
    ///   - year: The desired year
    ///   - month: The desired month
    ///   - day: The desired day
    /// - Returns: A `Date` object
    static func from(year: Int = 2000, month: Int = 01, day: Int = 01) -> Date? {
        
        let calendar = Calendar(identifier: .gregorian)
        var dateComponents = DateComponents()
        dateComponents.year = year
        dateComponents.month = month
        dateComponents.day = day
        
        return calendar.date(from: dateComponents) ?? nil
    }
    

}

extension LosslessStringConvertible {
    var string: String { .init(self) }
}

//Get Current DateTime using a certain format string
func getCurrentDateTime(format: String = "yyyy-MM-dd HH:mm:ss") -> String {
    
    let dateFormatter : DateFormatter = DateFormatter()
    dateFormatter.dateFormat = format
    let date = Date()
    
    return dateFormatter.string(from: date)
}





//MARK: - String Extensions
extension String {
    
    func fromBase64() -> String? {
        guard let data = Data(base64Encoded: self) else {
            return nil
        }
        
        return String(data: data, encoding: .utf8)
    }
    
    func toBase64() -> String {
        return Data(Array(self.utf8)).base64EncodedString()
    }
    
    func base64StringToImage() -> UIImage {
        let imageData = Data.init(base64Encoded: self, options: .init(rawValue: 0))
        let image = UIImage(data: imageData!)
        return image!
    }
    
    func returnDashIfEmpty() -> String {
        return self.isEmpty ? "-" : self.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
    }
    
    func removePlusEndFromDateString() -> String {
        return self.contains("+") ? String(self.dropLast(self.count - self.getCharacterIndex("+") + 1)) : self
    }
    
    func getCharacterIndex(_ char: String) -> Int {
        return self.distance(from: self.startIndex, to: self.range(of: char)!.lowerBound)
    }
    
    func getDatePortion() -> String {
        
        return !self.isEmpty && self.contains(" ") ? String(describing: self.split(separator: " ")[0]) : self.removePlusEndFromDateString().returnDashIfEmpty()
        
    }
    
    /// Formats a string to the given number of decimal places
    /// - Parameters:
    ///     - decimalPlaces: an Int representing the number of decimal places to format the string to. Defaults to 2.
    /// - Returns:
    ///     The formatted string.
    func formatToDecimalPlaces(decimalPlaces: Int = 2) -> String {
        return String(format: "%.\(decimalPlaces)f", (self as NSString).floatValue)
    }
    
    ///Returns true if phone number is valid; false otherwise
    var isPhoneNumber: Bool {
        do {
            let detector = try NSDataDetector(types: NSTextCheckingResult.CheckingType.phoneNumber.rawValue)
            let matches = detector.matches(in: self, options: [], range: NSMakeRange(0, self.count))
            if let res = matches.first {
                return res.resultType == .phoneNumber && res.range.location == 0 && res.range.length == self.count
            } else {
                return false
            }
        } catch {
            return false
        }
    }
    
    ///Returns true if string is a valid email address; false otherwise
    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: self)
    }
    
    ///Removes whitespaces and newlines from string
    var trim: String {
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}

//MARK: - App Colors
//let appGreen = UIColor(hexString: "26c180")
//let appColorPrimaryDark = UIColor(hexString: "10057d")
//let appColorPrimary = UIColor(hexString: "3F51B5")
//let appColorAccent = UIColor(hexString: "00ADEE")
//let appMilkColor = UIColor(hexString: "e1e0e0")
//let appPlaceholderColor = UIColor(red: 0.78, green: 0.78, blue: 0.80, alpha: 1.0) // Standard iOS placeholder color (#C7C7CD).
//let appLightOrange = UIColor(hexString: "ffbb33")



//MARK: - UIView Validation
func hasPassedValidation(views: [UIView], text: [String]) -> Bool {
    
    var hasPassed = false
    
    for index in 0..<views.count {
        if text[index].isEmpty {
            views[index].becomeFirstResponder()
            views[index].addErrorBorder()
            return false
        } else {
            views[index].removeErrorBorder()
            hasPassed = true
        }
    }
    
    return hasPassed
}

func hasPassedValidation(selectButtons: [UIButton], values: [Bool]) -> Bool {
    
    var hasPassed = false
    
    for index in 0..<selectButtons.count {
        if values[index] {
            selectButtons[index].addErrorBorder()
            selectButtons[index].becomeFirstResponder()
            
            return false
        } else {
            selectButtons[index].removeSelectButtonErrorBorder()
            hasPassed = true
        }
    }
    
    return hasPassed
}

//MARK: - UIImage Extensions
extension UIImage {
    
    func toBase64String () -> String {
        return self.jpegData(compressionQuality: 1)?.base64EncodedString() ?? ""
    }
    
    func getSizeInMB() -> CLong {
        let imgData = NSData(data: self.jpegData(compressionQuality: 1)!)
        let imageSize: Int = imgData.count
        //print("size of image in KB: %f ", Double(imageSize) / 1024.0)
        return CLong(Double(imageSize) / 1024.0 / 1024)
    }
    
}

//UIViewController Extensions
extension UIViewController
{
    func hideKeyboard()
    {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(UIViewController.dismissKeyboard))
        
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard()
    {
        view.endEditing(true)
    }
}


//MARK: - Location Manager Functions
func checkLocationPermission(forViewController: UIViewController) {
    
    if CLLocationManager.locationServicesEnabled() {
        
        switch(CLLocationManager.authorizationStatus()) {
        case .notDetermined, .restricted, .denied:
            //open setting app when location services are disabled
            showSettingsAlertDialog(message: NSLocalizedString("Please.enable.location.services.to.continue.with.meter.reading.submission", comment: ""), forViewController)
        case .authorizedAlways, .authorizedWhenInUse:
            print("Access")
        @unknown default:
            print("Unknown default authorizationStatus issues...")
        }
        
    } else {
        print("Location services are not enabled")
        showSettingsAlertDialog(message: NSLocalizedString("Please.enable.location.services.to.continue.with.meter.reading.submission", comment: ""), forViewController)
    }
}

fileprivate func showSettingsAlertDialog(message: String, _ vc: UIViewController) {
    
    Alertift.alert(title: "Location Usage", message: message)
        .action(.cancel("Dismiss"))
        .action(.default("Settings")) { _, _, _ in
            openSettingsApp()
        }.show(on: vc, completion: nil)
    
}

func openSettingsApp() {
    guard let settingsUrl = URL(string: UIApplication.openSettingsURLString) else {
        return
    }
    if UIApplication.shared.canOpenURL(settingsUrl) {
        UIApplication.shared.open(settingsUrl, options: [:], completionHandler: nil)
    }
    
}


extension UIColor {
    convenience init(hexString: String, alpha: CGFloat = 1.0) {
        let hexString: String = hexString.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        let scanner = Scanner(string: hexString)
        if (hexString.hasPrefix("#")) {
            scanner.scanLocation = 1
        }
        var color: UInt32 = 0
        scanner.scanHexInt32(&color)
        let mask = 0x000000FF
        let r = Int(color >> 16) & mask
        let g = Int(color >> 8) & mask
        let b = Int(color) & mask
        let red   = CGFloat(r) / 255.0
        let green = CGFloat(g) / 255.0
        let blue  = CGFloat(b) / 255.0
        self.init(red:red, green:green, blue:blue, alpha:alpha)
    }
    func toHexString() -> String {
        var r:CGFloat = 0
        var g:CGFloat = 0
        var b:CGFloat = 0
        var a:CGFloat = 0
        getRed(&r, green: &g, blue: &b, alpha: &a)
        let rgb:Int = (Int)(r*255)<<16 | (Int)(g*255)<<8 | (Int)(b*255)<<0
        return String(format:"#%06x", rgb)
    }
}
