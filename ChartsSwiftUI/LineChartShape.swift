//
//  LineChartShape.swift
//  ChartsSwiftUI
//
//  Created by Rahul Sharma on 08/03/22.
//

import SwiftUI

struct DataPoints: VectorArithmetic {
    
    static func - (lhs: DataPoints, rhs: DataPoints) -> DataPoints {
        DataPoints(points: (0 ..< min(lhs.points.count, rhs.points.count)).map { lhs.points[$0] - rhs.points[$0] })
    }
    
    
    static func + (lhs: DataPoints, rhs: DataPoints) -> DataPoints {
        DataPoints(points: (0 ..< min(lhs.points.count, rhs.points.count)).map { lhs.points[$0] + rhs.points[$0] })
    }
    
    mutating func scale(by rhs: Double) {
        points = points.map { $0 * rhs }
    }
    
    var magnitudeSquared: Double {
        points.map { $0 * $0 }.reduce(0, +)
    }
    
    static var zero: DataPoints {
        DataPoints(points: Array(repeating: 0.5, count: 1))
    }
    
    static func zero(count: Int) -> DataPoints {
        DataPoints(points: Array(repeating: 0.5, count: count))
    }
    
    var points: [CGFloat]
}

struct LineChartShape: Shape {
    
    var data: DataPoints
    
    var animatableData: DataPoints {
        get { data }
        set { data = newValue }
    }
    
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: 0, y: data.points.first! * rect.size.height))
            for index in 1..<data.points.count {
                path.addLine(to: CGPoint(x: CGFloat(index) * rect.size.width / CGFloat(data.points.count - 1), y: data.points[index] * rect.size.height))
            }
        }
    }
    
}

struct LineChartShape_Previews: PreviewProvider {
    static var previews: some View {
        LineChartShape(data: sampleData)
    }
}
