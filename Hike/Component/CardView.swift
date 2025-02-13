//
//  CardView.swift
//  Hike
//
//  Created by Jibryll Brinkley on 2/12/25.
//

import SwiftUI

struct CardView: View {
    
    //Properties
    @State private var imageNumber: Int = 1
    @State private var randomNumber: Int = 1
    @State private var isShowingSheet: Bool = false
    
    //Functions
    func randomImage() {
        print("--- Button was pressed--- ")
        print("Old image number: \(imageNumber)")
        
        repeat {
            randomNumber = Int.random(in: 1...5)
            print("Random Number = \(randomNumber)")
        } while randomNumber == imageNumber
        
        imageNumber = randomNumber
        
        print("New image number: \(imageNumber)")
    }
    
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
                            isShowingSheet.toggle()
                        } label: {
                            CustomButtonView()
                        }
                        .sheet(isPresented: $isShowingSheet) {
                            SettingsView()
                                .presentationDragIndicator(.visible)
                                .presentationDetents([.medium, .large])
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
                
                    CustomCircleView()
                    
                    Image("image-\(imageNumber)")
                        .resizable()
                        .scaledToFit()
                        .animation(.easeInOut(duration: 0.3), value: imageNumber)
                }
                
                // Footer
                Button {
                    randomImage()
                } label: {
                    Text("Explore More")
                        .font(.title2)
                        .fontWeight(.heavy)
                        .foregroundStyle(LinearGradient(colors: [
                            .customGreenLight,
                            .customGreenMedium],
                                                        startPoint: .top,
                                                        endPoint: .bottom))
                        .shadow(color: .black.opacity(0.25), radius: 0.25, x: 1, y: 2)
                }
                .buttonStyle(GradientButton())
            }
            
        } // Card
        .frame(width: 320, height: 570)
        
    }
}

#Preview {
    CardView()
}
