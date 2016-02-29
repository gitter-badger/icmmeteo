//
//  MMTCityCategory.swift
//  MobileMeteo
//
//  Created by Kamil Szostakowski on 27.08.2015.
//  Copyright (c) 2015 Kamil Szostakowski. All rights reserved.
//

import Foundation
import CoreLocation
import CoreData

@objc protocol MMTCityProt
{
    var name: String { get set }
    var region: String { get set }
    var location: CLLocation { get set }
    var isFavourite: Bool { get set }
    var isCapital: Bool { get set }
}

protocol MMTPlacemark
{
    var name: String? { get }
    var locality: String? { get }
    var ocean: String? { get }
    var location: CLLocation? { get }
    var administrativeArea: String? { get }
}

extension CLPlacemark: MMTPlacemark {}

extension MMTCity: MMTCityProt
{
    var location: CLLocation
    {
        get { return CLLocation(latitude: lat.doubleValue, longitude: lng.doubleValue) }
        set
        {
            lat = newValue.coordinate.latitude
            lng = newValue.coordinate.longitude
        }
    }
    
    var isFavourite: Bool
    {
        get { return favourite.boolValue }
        set { favourite = newValue }
    }
    
    var isCapital: Bool
    {
        get { return capital.boolValue }
        set { capital = newValue }
    }
    
    // MARK: Initializers
    
    convenience init(name: String, region: String, location: CLLocation)
    {
        self.init(entity: MMTCity.entityDescription, insertIntoManagedObjectContext: nil)
        
        self.name = name
        self.region = region
        self.location = location
        self.isCapital = false
        self.isFavourite = false
    }    
    
    convenience init?(placemark: MMTPlacemark)
    {
        guard let name = placemark.locality ?? placemark.name else { return nil }
        guard let region = placemark.administrativeArea else { return nil }
        guard let location = placemark.location else { return nil }
        guard placemark.ocean == nil else { return nil }        
        
        self.init(name: name, region: region, location: location)
    }
    
    // MARK: Helper methods
    
    private class var entityDescription: NSEntityDescription
    {
        return NSEntityDescription.entityForName("MMTCity", inManagedObjectContext: MMTDatabase.instance.context)!
    }
}
