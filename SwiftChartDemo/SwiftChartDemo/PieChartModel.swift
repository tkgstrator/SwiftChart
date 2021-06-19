//
//  PieChartModel.swift
//  SwiftChartDemo
//
//  Created by devonly on 2021/05/16.
//

import Foundation
import Combine
import SwiftChart
import SwiftUI

final class ChartModel: ObservableObject {
    @Published var piechart = [
        PieChartData(value: 0, label: { Text("AAA") }),
        PieChartData(value: 10, label: { Text("AAA") }),
        PieChartData(value: 20, label: { Text("AAA") }),
        PieChartData(value: 30, label: { Text("AAA") }),
        PieChartData(value: 40, label: { Text("AAA") }),
    ]
//    @Published var linebarchart = LineBarChartData(data: [Double]())
}
