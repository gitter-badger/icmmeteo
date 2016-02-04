//
//  MMTExtensionNSURLTests.swift
//  MobileMeteo
//
//  Created by Kamil Szostakowski on 19.08.2015.
//  Copyright (c) 2015 Kamil Szostakowski. All rights reserved.
//

import XCTest
import Foundation
import CoreLocation
@testable import MobileMeteo

class MMTCategoryNSURLTests: XCTestCase
{
    // MARK: Test methods
    
    func testBaseUrl()
    {
        XCTAssertEqual("http://www.meteo.pl", NSURL.mmt_baseUrl().absoluteString)
    }
    
    // MARK: Model um related tests
    
    func testModelUmDownloadBaseUrl()
    {
        XCTAssertEqual("http://www.meteo.pl/um/metco/mgram_pict.php", NSURL.mmt_modelUmDownloadBaseUrl().absoluteString);
    }
    
    func testModelUmSearchUrl()
    {
        let expectedUrl = "http://www.meteo.pl/um/php/mgram_search.php?NALL=53.585869&EALL=19.570815&lang=pl"
        let location = CLLocation(latitude: 53.585869, longitude: 19.570815)
        
        XCTAssertEqual(expectedUrl, NSURL.mmt_modelUmSearchUrl(location).absoluteString);
    }
    
    func testModelUmLegendUrl()
    {
        let expectedUrl = "http://www.meteo.pl/um/metco/leg_um_pl_cbase_256.png"
        XCTAssertEqual(expectedUrl, NSURL.mmt_modelUmLegendUrl().absoluteString);
    }
    
    func testModelUmForecastStartUrl()
    {
        let expectedUrl = "http://www.meteo.pl/info_um.php"
        XCTAssertEqual(expectedUrl, NSURL.mmt_modelUmForecastStartUrl().absoluteString);
    }
    
    // MARK: Model coamps related tests
    
    func testModelCoampsDownloadBaseUrl()
    {        
        XCTAssertEqual("http://www.meteo.pl/metco/mgram_pict.php", NSURL.mmt_modelCoampsDownloadBaseUrl().absoluteString);
    }
    
    func testModelCoampsSearchUrl()
    {
        let expectedUrl = "http://www.meteo.pl/php/mgram_search.php?NALL=53.585869&EALL=19.570815&lang=pl"
        let location = CLLocation(latitude: 53.585869, longitude: 19.570815)
        
        XCTAssertEqual(expectedUrl, NSURL.mmt_modelCoampsSearchUrl(location).absoluteString);
    }
    
    func testModelCoampsLegendUrl()
    {
        let expectedUrl = "http://www.meteo.pl/metco/leg4_pl.png"
        XCTAssertEqual(expectedUrl, NSURL.mmt_modelCoampsLegendUrl().absoluteString);
    }
    
    func testModelCoampsForecastStartUrl()
    {
        let expectedUrl = "http://www.meteo.pl/info_coamps.php"
        XCTAssertEqual(expectedUrl, NSURL.mmt_modelCoampsForecastStartUrl().absoluteString);
    }
    
    // MARK: Model wam related tests
    
    func testModelWamTideHeightThumbnailUrl()
    {
        let expectedUrl = "http://www.meteo.pl/wamcoamps/pict/2015081900/small-crop-wavehgt_0W_2015081900_006-00.gif"
        let date = TT.utcFormatter.dateFromString("2015-08-19T00:00")!
        
        XCTAssertEqual(expectedUrl, NSURL.mmt_modelWamTideHeightThumbnailUrl(date, plus: 6).absoluteString)
    }
    
    func testModelWamAvgTidePeriodThumbnailUrl()
    {
        let expectedUrl = "http://www.meteo.pl/wamcoamps/pict/2015081900/small-crop-m_period_0W_2015081900_003-00.gif"
        let date = TT.utcFormatter.dateFromString("2015-08-19T00:00")!
        
        XCTAssertEqual(expectedUrl, NSURL.mmt_modelWamAvgTidePeriodThumbnailUrl(date, plus: 3).absoluteString)
    }
    
    func testModelWamSpectrumPeakPeriodThumbnailUrl()
    {
        let expectedUrl = "http://www.meteo.pl/wamcoamps/pict/2015081900/small-crop-p_period_0W_2015081900_003-00.gif"
        let date = TT.utcFormatter.dateFromString("2015-08-19T00:00")!
        
        XCTAssertEqual(expectedUrl, NSURL.mmt_modelWamSpectrumPeakPeriodThumbnailUrl(date, plus: 3).absoluteString)
    }
    
    func testModelWamTideHeightDownloadUrl()
    {
        let expectedUrl = "http://www.meteo.pl/wamcoamps/pict/2015081900/wavehgt_0W_2015081900_003-00.png"
        let date = TT.utcFormatter.dateFromString("2015-08-19T00:00")!
        
        XCTAssertEqual(expectedUrl, NSURL.mmt_modelWamTideHeightDownloadUrl(date, plus: 3).absoluteString)
    }
    
    func testModelWamAvgTidePeriodDownloadUrl()
    {
        let expectedUrl = "http://www.meteo.pl/wamcoamps/pict/2015081900/m_period_0W_2015081900_006-00.png"
        let date = TT.utcFormatter.dateFromString("2015-08-19T00:00")!
        
        XCTAssertEqual(expectedUrl, NSURL.mmt_modelWamAvgTidePeriodDownloadUrl(date, plus: 6).absoluteString)
    }
    
    func testModelWamSpectrumPeakPeriodDownloadUrl()
    {
        let expectedUrl = "http://www.meteo.pl/wamcoamps/pict/2015081900/p_period_0W_2015081900_003-00.png"
        let date = TT.utcFormatter.dateFromString("2015-08-19T00:00")!
        
        XCTAssertEqual(expectedUrl, NSURL.mmt_modelWamSpectrumPeakPeriodDownloadUrl(date, plus: 3).absoluteString)
    }
    
    func testModelWamForecastStartUrl()
    {
        let expectedUrl = "http://www.meteo.pl/info_wamcoamps.php"
        XCTAssertEqual(expectedUrl, NSURL.mmt_modelWamForecastStartUrl().absoluteString);
    }
}