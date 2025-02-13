//
//  SettingsView.swift
//  Hike
//
//  Created by Jibryll Brinkley on 2/12/25.
//

import SwiftUI

struct SettingsView: View {
    //Properties
    private let alternateAppicons: [String] = [
        "AppIcon-MagnifyingGlass",
        "AppIcon-Map",
        "AppIcon-Mushroom",
        "AppIcon-Camera",
        "AppIcon-Backpack",
        "AppIcon-Campfire"
    ]
    
    var body: some View {
        List {
            
            //Header
            Section {
                HStack {
                    Spacer()
                    
                    Image(systemName: "laurel.leading")
                        .font(.system(size: 80, weight: .black))
                    
                    VStack(spacing: -10) {
                        Text("Hike")
                            .font(.system(size: 66, weight: .black))
                        Text("Editor's Choice")
                            .fontWeight(.medium)
                    }
                    
                    Image(systemName: "laurel.trailing")
                        .font(.system(size: 80, weight: .black))
                    
                    Spacer()
                }
                .foregroundStyle(LinearGradient(colors: [.customGreenLight, .customGreenMedium, .customGreenDark], startPoint: .top, endPoint: .bottom))
                .padding(.top, 8)
                
                VStack(spacing: 8) {
                    Text("Where can you find \nperfect tracks?")
                        .font(.title2)
                        .fontWeight(.heavy)
                    
                    Text("The hike which looks gorgeous in photos but is even better once you are actually there. The hike that you hope to do again someday. \nFind the best day hikes in the app.")
                        .font(.footnote)
                        .italic()
                    
                    Text("Dust off the boots! It's time for a walk.")
                        .fontWeight(.heavy)
                        .foregroundColor(.customGreenMedium)
                }
                .multilineTextAlignment(.center)
                .padding(.bottom, 16)
                .frame(maxWidth: .infinity)
                
            } // end of header section
            .listRowSeparator(.hidden)
            
            
            // Icons
            
            Section(header: Text("Alternate Icons")) {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 12) {
                        ForEach(alternateAppicons.indices, id: \.self) { item in
                            Button {
                                print("\(alternateAppicons[item]) was pressed")
                                UIApplication.shared.setAlternateIconName(alternateAppicons[item]) { error in
                                    if error != nil {
                                        print("Failed request to update the apps icon: \(String(describing: error?.localizedDescription))")
                                    } else {
                                        print("Success, app icon changed to: \(alternateAppicons[item])")
                                    }
                                }
                            } label: {
                                Image("\(alternateAppicons[item])-Preview")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 80, height: 80)
                                    .cornerRadius(16)
                                
                            }
                            .buttonStyle(.borderless)
                        }
                    }
                    
                }//End of Scroll View
                .padding(.top, 12)
                
                Text("Choose your favorite app icon from the selection above.")
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.secondary)
                    .font(.footnote)
                    .padding(.bottom, 12)
            } // End of Icons Section
            .listRowSeparator(.hidden)
            
            
            
            // About Section
            Section(
                header:
                    Text("About THE APP"),
                footer:
                    HStack {
                        Spacer()
                        Text("Copyright © All right reserved.")
                        Spacer()
                    }
                    .padding(.vertical, 8)
            ) {
                // 1. Basic Labeled Content
//                LabeledContent("Application", value: "Hike")
                
                
                
                // 2. Advanced Labeled Content

                CustomListRowView(rowLabel: "Application", rowIcon: "apps.iphone", rowContent: "Hike", rowTintColor: .blue)
                
                CustomListRowView(rowLabel: "Compatibility", rowIcon: "info.circle", rowContent: "iOS, iPadOS", rowTintColor: .red)
                
                CustomListRowView(rowLabel: "Technology", rowIcon: "swift", rowContent: "Swift", rowTintColor: .orange)
                
                CustomListRowView(rowLabel: "Version", rowIcon: "gear", rowContent: "1.0", rowTintColor: .purple)
                
                CustomListRowView(rowLabel: "Developed By", rowIcon: "ellipsis.curlybraces", rowContent: "Jibryll Brinkley", rowTintColor: .mint)
                

                CustomListRowView(rowLabel: "Website", rowIcon: "globe", rowTintColor: .indigo, rowLinkLabel: "Visit My GitHub", rowLinkDestination: "https://github.com/BryllieBrinkley")
                
            } // About Section END
            
            
            
        }
        
    }
}

#Preview {
    SettingsView()
}
