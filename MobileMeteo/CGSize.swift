//
//  CGSize.swift
//  MobileMeteo
//
//  Created by Kamil Szostakowski on 30/12/16.
//  Copyright © 2016 Kamil Szostakowski. All rights reserved.
//

import Foundation
import MeteoModel

extension CGSize
{
    init?(meteorogram model: MMTClimateModelType)
    {
        switch model {
            case .UM: self = CGSize(width: 540, height: 660)
            case .COAMPS: self = CGSize(width: 660, height: 570)
            default: return nil
        }
    }

    init?(meteorogramLegend model: MMTClimateModelType)
    {
        switch model {
            case .UM: self = CGSize(width: 280, height: 660)
            case .COAMPS: self = CGSize(width: 280, height: 570)
            default: return nil
        }
    }

    init(map model: MMTClimateModelType)
    {
        switch model {
            case .UM: self = CGSize(width: 669, height: 740)
            case .COAMPS: self = CGSize(width: 590, height: 604)
            case .WAM: self = CGSize(width: 645, height: 702)
        }
    }

    init(mapLegend model: MMTClimateModelType)
    {
        switch model {
            case .UM: self = CGSize(width: 128, height: 740)
            case .COAMPS: self = CGSize(width: 128, height: 604)
            case .WAM: self = CGSize(width: 75, height: 702)
        }
    }
}
