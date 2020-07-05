//
//  QuantityTypes.swift
//  HealthKitDemo
//
//  Created by Bernardo Arevalo on 7/3/20.
//  Copyright © 2020 Bernardo Arevalo. All rights reserved.
//

import Foundation
import HealthKit

struct HealthKitQuantityRequest {
    var identifier: HKQuantityTypeIdentifier
    var units: String
    
    init(identifier: HKQuantityTypeIdentifier, units: String) {
        self.identifier = identifier
        self.units = units
    }
}

class HealthKitQuantityTypes {
    
    static let types =
    [
        HealthKitQuantityRequest(identifier: HKQuantityTypeIdentifier.bloodGlucose, units: "mg/dL"),
        HealthKitQuantityRequest(identifier: HKQuantityTypeIdentifier.insulinDelivery, units: "IU"),
        HealthKitQuantityRequest(identifier: HKQuantityTypeIdentifier.activeEnergyBurned, units: "kcal"),
        HealthKitQuantityRequest(identifier: HKQuantityTypeIdentifier.distanceWalkingRunning, units: "m"),
        HealthKitQuantityRequest(identifier: HKQuantityTypeIdentifier.distanceCycling, units: "m"),
        HealthKitQuantityRequest(identifier: HKQuantityTypeIdentifier.heartRate, units: "count/min"),
        HealthKitQuantityRequest(identifier: HKQuantityTypeIdentifier.restingHeartRate, units: "count/s"),
        HealthKitQuantityRequest(identifier: HKQuantityTypeIdentifier.stepCount, units: "count")
    ]
}
