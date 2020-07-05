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
    
    static func getHealthKitSampleType(_ sampleType: HealthKitQuantityRequest, _ healthStore: HKHealthStore, resultHandler: @escaping ([HKQuantitySample]) -> Void) {
        guard let sampleType = HKSampleType.quantityType(forIdentifier: sampleType.identifier) else {
            fatalError("*** This method should never fail ***")
        }
        let healthStore = HKHealthStore()
//        HKQuery.predicateForSamples(withStart: <#T##Date?#>, end: <#T##Date?#>, options: <#T##HKQueryOptions#>)
        let query = HKSampleQuery(sampleType: sampleType, predicate: nil, limit: Int(HKObjectQueryNoLimit), sortDescriptors: nil) {
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
