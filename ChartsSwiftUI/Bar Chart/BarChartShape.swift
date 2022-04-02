//
//  BarChartShape.swift
//  ChartsSwiftUI
//
//  Created by Rahul Sharma on 08/03/22.
//

import SwiftUI

struct BarChartShape: Shape {
    
    var normalizedValue: CGFloat
    
    var animatableData: CGFloat {
        get { normalizedValue }
        set { normalizedValue = newValue }
    }
    
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.addRect(
                CGRect(
                    x: 0,
                    y: rect.height - (rect.height * normalizedValue),
                    width: rect.width,
                    height: rect.height * normalizedValue
                )
            )
        }
    }
    
}

struct BarChartShape_Previews: PreviewProvider {
        
    static var previews: some View {
        BarChartShape(normalizedValue: 0.5)
            .fill(Color.red)
            .background(Color.gray)
    }
}
