//
//  PieChartModel.swift
//  SwiftChartDemo
//
//  Created by devonly on 2021/05/16.
//

import Foundation
import Combine
import SwiftChart

final class ChartModel: ObservableObject {
    @Published var piechart = PieChartData(data: [Double]())
    @Published var linebarchart = LineBarChartData(data: [Double]())
}
