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
            VStack {
                // Header
                VStack(alignment: .leading) {
                    HStack {
                        Text("Hiking")
                            .fontWeight(.black)
                            .font(.system(size: 52))
                            .foregroundStyle(
                                LinearGradient(
                                    colors: [.customGrayLight, .customGrayMedium],
                                    startPoint: .top,
                                    endPoint: .bottom)
                            )
                        
                        Spacer()
                        
                        Button {
                            // Action: present a sheet
                            print("button pressed")
                        } label: {
                            CustomButtonView()
                        }
                    }
                    Text("Fun and enjoyable outdoor activity for friends and families.")
                        .multilineTextAlignment(.leading)
                        .italic()
                        .foregroundColor(.customGrayMedium)
                } // Header
                .padding(.horizontal, 30)
                
                // Main Content
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
                
                // Footer
            }
            
        } // Card
        .frame(width: 320, height: 570)
        
    }
}

#Preview {
    CardView()
}
