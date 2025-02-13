//
//  GradientButtonStyle.swift
//  Hike
//
//  Created by Jibryll Brinkley on 2/12/25.
//

import Foundation
import SwiftUI


struct GradientButton: ButtonStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .padding(.vertical)
            .padding(.horizontal, 30)
            .background(
                //Conditional Statement with Ternary Conditional Operator
                // Condition ? A : B
                configuration.isPressed ?
                // A - When User presses the button. (True State)
                LinearGradient(colors: [.customGrayMedium, .customGrayLight],
                               startPoint: .top,
                               endPoint: .bottom)
                :
                // B - When the button is not pressed. (False State)
                LinearGradient(colors: [.customGrayLight, .customGrayMedium],
                               startPoint: .top,
                               endPoint: .bottom)
                
                
                
                
            )
            .cornerRadius(40)
    }   
}
