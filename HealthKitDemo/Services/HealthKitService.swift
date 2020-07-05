//
//  HealthKitService.swift
//  HealthKitDemo
//
//  Created by Bernardo Arevalo on 6/30/20.
//  Copyright © 2020 Bernardo Arevalo. All rights reserved.
//

import Foundation
import HealthKit

class HealthKitService {
    
    static func getAuthorizationForHealthKit(_ healthStore: HKHealthStore,
                                      resultHandler: @escaping () -> Void) {
        
        if HKHealthStore.isHealthDataAvailable() {
            print("HealthKit available on device")
        }
        
        let allTypes = Set([HKObjectType.quantityType(forIdentifier: .bloodGlucose)!,
                            HKObjectType.quantityType(forIdentifier: .insulinDelivery)!,
                            HKObjectType.workoutType(),
                            HKObjectType.quantityType(forIdentifier: .activeEnergyBurned)!,
                            HKObjectType.quantityType(forIdentifier: .distanceWalkingRunning)!,
                            HKObjectType.quantityType(forIdentifier: .distanceCycling)!,
                            HKObjectType.quantityType(forIdentifier: .distanceWalkingRunning)!,
                            HKObjectType.quantityType(forIdentifier: .heartRate)!,
                            HKObjectType.quantityType(forIdentifier: .restingHeartRate)!,
                            HKObjectType.quantityType(forIdentifier: .stepCount)!,
                        ])
        
        healthStore.requestAuthorization(toShare: allTypes, read: allTypes) { (success, error) in
            if !success {
                print("danger will robinson")
            }
            print(success)
            
            resultHandler()
        }
    }
}


