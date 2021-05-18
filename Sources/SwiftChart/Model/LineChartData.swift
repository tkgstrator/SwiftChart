//
//  SwiftUIView.swift
//  
//
//  Created by devonly on 2021/05/18.
//

import Foundation
import SwiftUI

public class LineChartData: ObservableObject {
    @Published private(set) var data: [LineData] = []
    
    public init(data: [Double]) {
        var currentAngle: Double = -90
        var slides: [LineData] = []
        let total = data.reduce(0.0, +)
        
        for index in 0 ..< data.count {
        }
    }
    
    init(data: [LineData]) {
    }
}

public class LineData: ChartData {
    public let id: UUID = UUID()
    public var data: DataItem?
    required public init() {}
}
