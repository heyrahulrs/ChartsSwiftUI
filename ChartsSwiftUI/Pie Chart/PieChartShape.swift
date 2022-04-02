//
//  PieChartShape.swift
//  ChartsSwiftUI
//
//  Created by Rahul Sharma on 09/03/22.
//

import SwiftUI

struct PieChartShape: Shape {
    
    var data: [CGFloat] = [25.0, 50.0, 20.0, 30.0]
    
    var normalizedData: [CGFloat] {
        let sum = data.reduce(0, +)
        var result: [CGFloat] = []
        for datum in data {
            result.append(datum / sum)
        }
        return result
    }
    
    var startAngle: Angle
    var endAngle: Angle
    
    var clockwise: Bool = false
    
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: rect.midX, y: rect.midY))
            path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: rect.width / 2, startAngle: startAngle, endAngle: endAngle, clockwise: clockwise)
        }
    }
   
}

struct PieChartShape_Previews: PreviewProvider {
    static var previews: some View {
        PieChartShape(startAngle: .degrees(0), endAngle: .degrees(220))
            .fill(.red)
//            .rotation(.degrees(90), anchor: .center)
    }
}
