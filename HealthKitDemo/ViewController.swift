//
//  ViewController.swift
//  HealthKitDemo
//
//  Created by Bernardo Arevalo on 6/29/20.
//  Copyright © 2020 Bernardo Arevalo. All rights reserved.
//

import UIKit
import HealthKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let healthStore = HKHealthStore()
        
        let startDate = Calendar.current.date(bySettingHour: 0, minute: 0, second: 0, of: Date())!
        let endDate = Date()
        
        HealthKitService.getAuthorizationForHealthKit(healthStore, resultHandler: {
            HealthKitQuantityTypes.types.map { (type) -> Void in
                HealthKitRepository.getHealthKitSampleType(startDate, endDate, type, healthStore, resultHandler: { samples in
                    mapQuantitySamplesToDict(type: type, samples: samples)
                })
            }
        })
    }


}

