//
//  TabBar.swift
//  FusionCodeData&Algorithms
//
//  Created by Zablon Charles on 2021-11-05.
//

import SwiftUI

struct TabBar: View {
    @AppStorage("selectedTab") var selectedTab: Tab = .home
    @State var color: Color = .teal
    @State var tabItemWidth: CGFloat = 0
    @State var tapped = false
    @AppStorage("hideTabBar") var hideTabBar = false
    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                buttons
            }
            .padding(.horizontal, 8)
           
            .frame(height: 65)
            
           
            .newoffwhite(offwhiteisTapped: false, cornerradius: 30)
            .padding(.horizontal, 87)
            .scaleEffect(tapped ? 0.99 : 1)
            .animation(.spring(), value: tapped)
       
        }.offset(y: hideTabBar ? 130 : 10)
            
    }
    
    var buttons: some View {
        ForEach(tabItems) { item in
            Button {
                withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                    selectedTab = item.tab
                    color = item.color
                    tabbarTapped()
                }
            } label: {
                VStack(spacing: 0) {
                    Image(systemName: item.icon)
                        .symbolVariant(.fill)
                        .font(.body.bold())
                        .frame(width: 44, height: 29)
                        
                  
                }
                .frame(maxWidth: .infinity)
            }
           // .foregroundStyle(selectedTab == item.tab ? .primary : .secondary)
            .foregroundColor(selectedTab == item.tab ? .red : .primary)
            //.blendMode(selectedTab == item.tab ? .overlay : .normal)
            .overlay(
                GeometryReader { proxy in
//                            Text("\(proxy.size.width)")
                    Color.clear.preference(key: TabPreferenceKey.self, value: proxy.size.width)
                }
            )
            .onPreferenceChange(TabPreferenceKey.self) { value in
                tabItemWidth = value
            }
        }
    }
    
 
    
    func tabbarTapped() {
        tapped = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
            tapped = false
            
        }
    }
 
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
