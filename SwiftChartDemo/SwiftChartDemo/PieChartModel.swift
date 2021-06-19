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
    @Published var piechart = [PieChartData(value: 10, label: { Text("AAA") })]
//    @Published var linebarchart = LineBarChartData(data: [Double]())
}
