//
//  CardView.swift
//  Hike
//
//  Created by Jibryll Brinkley on 2/12/25.
//

import SwiftUI

struct CardView: View {
    var body: some View {
        ZStack {
            CustomBackgroundView()
            ZStack {
                Circle()
                    .fill(
                        LinearGradient(
                            colors: [Color.customIndigoMedium, Color.customSalmonLight],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing)
                    )
                    .frame(width: 256, height: 256)
                Image("image-1")
                    .resizable()
                    .scaledToFit()
            }
            
        } // Card
        .frame(width: 320, height: 570)

    }
}

#Preview {
    CardView()
}
