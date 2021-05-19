//
//  LineBarChart.swift
//  
//
//  Created by devonly on 2021/05/18.
//

import Foundation
import SwiftUI

public class LineBarChartData: ObservableObject {
    
    @Published private(set) var data: [LineBarData] = []

    public init(data: [Double]) {
        var bars: [LineBarData] = []

        for index in 0 ..< data.count {
            let bar = LineBarData()
            bar.data = DataItem(name: "Data name \(index + 1)", value: data[index])
            bars.append(bar)
        }
        self.data = bars
    }

    init(data: [LineBarData]) {
        self.data = data
    }
}

public class LineBarData: ChartData {
    public let id: UUID = UUID()
    public var data: DataItem?
    required public init() {}
}

