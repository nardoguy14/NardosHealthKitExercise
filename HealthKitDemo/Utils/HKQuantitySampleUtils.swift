//
//  HKQuantitySampleUtils.swift
//  HealthKitDemo
//
//  Created by Bernardo Arevalo on 7/4/20.
//  Copyright © 2020 Bernardo Arevalo. All rights reserved.
//

import Foundation
import HealthKit

func mapQuantitySamplesToDict(
    type: HealthKitQuantityRequest,
    samples: [HKQuantitySample]) -> [[String: Any]] {
        let result = samples.map { (sample) -> [String: Any] in
            let result: [String: Any] = [
                "metadata": sample.metadata ?? [],
                "startDate": toIsoDateString(date: sample.startDate),
                "endDate": toIsoDateString(date: sample.endDate),
                "quantity": sample.quantity.doubleValue(for: HKUnit.init(from: type.units)),
                "count": sample.count,
                "quantityType": type.identifier.rawValue,
                "appleId": sample.uuid.uuidString,
                "description": sample.description,
                "source": sample.sourceRevision.source.name,
                "device": sample.device?.name ?? "None",
                "units": type.units
            ]
            
            return result
        }
    print(result.last)
    return result
}
