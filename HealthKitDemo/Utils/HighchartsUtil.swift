//
//  HighchartsUtil.swift
//  HealthKitDemo
//
//  Created by Bernardo Arevalo on 7/5/20.
//  Copyright © 2020 Bernardo Arevalo. All rights reserved.
//

import Foundation
import Highcharts

func createSeriesChart(chartView: HIChartView, data: [[Double]]) {
    let options = HIOptions()
    let chart = HIChart()
    chart.type = "line"
    options.chart = chart
    
    let title = HITitle()
    title.text = "Blood Glucose"
    
    let subtitle = HISubtitle()
    subtitle.text = "2020-07-06"
    options.title = title
    options.subtitle = subtitle

    let yAxis = HIYAxis()
    yAxis.min = 0
    yAxis.max = 250
    yAxis.softMax = 100
    yAxis.tickInterval = 50
    yAxis.title = HITitle()
    yAxis.title.text = "Glucose"
    
    options.yAxis = [yAxis]

    let plotOptions = HIPlotOptions()

    
    let hiSeries1 = HISeries()
    hiSeries1.name = "the data"
    hiSeries1.data = data
    
    options.plotOptions = plotOptions

    options.series = [hiSeries1]
    
    chartView.options = options
}
