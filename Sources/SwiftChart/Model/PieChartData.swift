//
//  PieChartData.swift
//
//
//  Created by devonly on 2021/05/16.
//

import Foundation
import SwiftUI

public class PieChartData: ObservableObject {
    @Published private(set) var data: [SlideData] = []
    
    public init(data: [Double]) {
        var currentAngle: Double = -90
        var slides: [SlideData] = []
        let total = data.reduce(0.0, +)
        
        for index in 0 ..< data.count {
            let slide = SlideData()
            let dataItem = DataItem(name: "Data name \(index + 1)", value: data[index])
            slide.data = dataItem
            
            let percentage = data[index] / total * 100
            slide.percentage = String(format: "%.1f%%", percentage)
            
            slide.startAngle = .degrees(currentAngle)
            let angle = data[index] * 360 / total
            slide.alpha = CGFloat(currentAngle + angle / 2)
            currentAngle += angle
            slide.endAngle = .degrees(currentAngle)
            
            slides.append(slide)
        }
        self.data = slides
    }
    
    init(data: [SlideData]) {
        self.data = data
    }
}


public class SlideData: ChartData {
    public let id: UUID = UUID()
    public var data: DataItem?
    public var startAngle: Angle = .degrees(0)
    public var endAngle: Angle = .degrees(0)

    var percentage: String = ""
    var alpha: CGFloat = 0.0
    
    private var deltaX: CGFloat {
        CGFloat(cos(abs(alpha).truncatingRemainder(dividingBy: 90.0) * .pi / 180.0)) * 0.7
    }
    
    private var deltaY: CGFloat {
        CGFloat(sin(abs(alpha).truncatingRemainder(dividingBy: 90.0) * .pi / 180.0)) * 0.7
    }
    
    var titleDeltaX: CGFloat {
        if abs(alpha) <= 90 {
            return deltaX
        }
        if abs(alpha - 135) <= 45 {
            return -deltaY
        }
        return -deltaX
    }
    
    var titleDeltaY: CGFloat {
        if abs(alpha - 45) <= 45 {
            return deltaY
        }
        if abs(alpha - 135) <= 45 {
            return deltaX
        }
        return -deltaY
    }

    required public init() {}
}

public class DataItem {
    var name: String?
    var value: Double = 0.0
    var color: Color = .blue
    var highlighted: Bool = false
    
    public init(name: String, value: Double, color: Color? = nil) {
        self.name = name
        self.value = value
        if let color = color {
            self.color = color
        } else {
            self.color = .random()
        }
    }
}
