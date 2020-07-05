//
//  HealthKitRepository.swift
//  HealthKitDemo
//
//  Created by Bernardo Arevalo on 6/30/20.
//  Copyright © 2020 Bernardo Arevalo. All rights reserved.
//

import Foundation
import HealthKit


class HealthKitRepository {
    
    static func getHealthKitSampleType(_ startDate: Date, _ endDate: Date, _ sampleType: HealthKitQuantityRequest, _ healthStore: HKHealthStore, resultHandler: @escaping ([HKQuantitySample]) -> Void) {
        guard let sampleType = HKSampleType.quantityType(forIdentifier: sampleType.identifier) else {
            fatalError("*** This method should never fail ***")
        }
        let healthStore = HKHealthStore()
        let predicate = HKQuery.predicateForSamples(withStart: startDate, end: endDate, options: HKQueryOptions.strictStartDate)
        let query = HKSampleQuery(sampleType: sampleType, predicate: predicate, limit: Int(HKObjectQueryNoLimit), sortDescriptors: nil) {
            query, results, error in

            guard let samples = results as? [HKQuantitySample] else {
                
                // Handle any errors here.
                print("uh oh errors")
                return
            }
            
            resultHandler(samples)    
        }
        healthStore.execute(query)
    }
}
