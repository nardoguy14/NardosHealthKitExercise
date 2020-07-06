//
//  ViewController.swift
//  HealthKitDemo
//
//  Created by Bernardo Arevalo on 6/29/20.
//  Copyright © 2020 Bernardo Arevalo. All rights reserved.
//

import UIKit
import HealthKit
import Highcharts

class ViewController: UIViewController {
    
    var chartView: HIChartView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let size = CGSize(width: self.view.bounds.size.width, height: CGFloat(250))
        let rect = CGRect(origin: self.view.bounds.origin, size: size)
        self.chartView = HIChartView(frame: rect)
        
        let healthStore = HKHealthStore()
        
        let startDate = Calendar.current.date(bySettingHour: 0, minute: 0, second: 0, of: Date(fromDateString: "2020-07-05"))!
        let endDate = Date()
        
        HealthKitService.getAuthorizationForHealthKit(healthStore, resultHandler: {
            HealthKitQuantityTypes.types.map { (type) -> Void in
                HealthKitRepository.getHealthKitSampleType(startDate, endDate, type, healthStore, resultHandler: { samples in
                    let mappedValues = mapQuantitySamplesToDict(type: type, samples: samples)
                    
                    if(type.units == "mg/dL"){
                        let bloodGlucoseValues = mappedValues.map { (entry) -> [Double] in
                            print(entry["startDateEpoch"])
                            print(entry["value"])
                            return [Double(entry["startDateEpoch"] as! Int64),
                                    Double(entry["value"] as! Double)]
                        }
                        
                        DispatchQueue.main.async {
                            print(samples.count)
                            createSeriesChart(chartView: self.chartView, data: bloodGlucoseValues)
                            self.view.addSubview(self.chartView)
                            self.chartView.updateOptions()
                        }
                        
                    }
                    
                })
            }
        })
    }


}

