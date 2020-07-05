//
//  DateUtils.swift
//  HealthKitDemo
//
//  Created by Bernardo Arevalo on 7/3/20.
//  Copyright © 2020 Bernardo Arevalo. All rights reserved.
//

import Foundation

func toIsoDateString(date: Date) -> String {
    var formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
    return formatter.string(from: date)
}
