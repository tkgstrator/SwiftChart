//
//  ChartData.swift
//  
//
//  Created by devonly on 2021/05/18.
//

import Foundation

public protocol ChartData: Identifiable, ObservableObject {
    var id: UUID { get }
    var data: DataItem? { get set }
    init()
}
