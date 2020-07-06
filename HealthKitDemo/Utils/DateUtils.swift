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

extension Date {
    var millisecondsSince1970:Int64 {
        return Int64((self.timeIntervalSince1970 * 1000.0).rounded())
    }

    init(milliseconds:Int64) {
        self = Date(timeIntervalSince1970: TimeInterval(milliseconds) / 1000)
    }
    
    init(fromDateString: String) {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        self = formatter.date(from: "2020-07-05")!
    }
}
