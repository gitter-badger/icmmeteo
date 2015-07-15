//
//  MMTMeteorogramQueryTests.swift
//  MobileMeteo
//
//  Created by Kamil Szostakowski on 30.06.2015.
//  Copyright (c) 2015 Kamil Szostakowski. All rights reserved.
//

import XCTest
import Foundation
import CoreLocation
import MobileMeteo

class MMTMeteorogramQueryTests : XCTestCase
{
    // MARK: Setup
    
    var location : CLLocation!;
    var formatter : NSDateFormatter!;
    
    override func setUp()
    {
        super.setUp()
        
        location = CLLocation(latitude: 53.03, longitude: 18.57)
        formatter = NSDateFormatter();
        formatter.dateFormat = "YYYY-MM-dd'T'HH:mm"
        formatter.timeZone = NSTimeZone(forSecondsFromGMT:7200)
    }
    
    override func tearDown()
    {
        location = nil;
        formatter = nil;
        
        super.tearDown()
    }
    
    // MARK: Test methods    
    
    func testCoordinate()
    {
        let date = formatter.dateFromString("2015-04-15T10:00")!
        let query = MMTMeteorogramQuery(location:location, date:date)
    
        XCTAssertEqual(53.03, query.location.coordinate.latitude)
        XCTAssertEqual(18.57, query.location.coordinate.longitude)
    }
    
    func testDateBeforeNoon()
    {
        let date = formatter.dateFromString("2015-04-15T10:00")!
        let query = MMTMeteorogramQuery(location:location, date:date)
    
        XCTAssertEqual("2015041500", query.date)
    }
    
    func testDateAfterNoonOfLocalTimeZone()
    {
        let date = formatter.dateFromString("2015-02-13T13:00")!
        let query = MMTMeteorogramQuery(location:location, date:date)
    
        XCTAssertEqual("2015021300", query.date)
    }
    
    func testDateAfterNoonOfGMTTimeZone()
    {
        let date = formatter.dateFromString("2015-02-13T14:00")!
        let query = MMTMeteorogramQuery(location:location, date:date)
        
        XCTAssertEqual("2015021312", query.date)
    }
}