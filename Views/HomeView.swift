//
//  HomeView.swift
//  FusionCodeData&Algorithms
//
//  Created by Zablon Charles on 2021-11-10.
//

import SwiftUI

struct HomeView: View {
    @State var welcomeTapped = false
    @State var topicsdata = topicdata[0]
    @State var selecteddata = discoverdata[0]
    @State var topdata = topsubjectsdata[0]
    @State var scroll = 0
    @State var show = false
    @State var showtopic = false
    @Namespace var namespace
    
    var body: some View {
        ZStack {
            BackgroundColor()
            if !show {
                ScrollView {
                    VStack {
                        
                        
                        navigation
                            .padding(.top,-10)
                        // .background(ScrollDetection(scrolling: $scroll))
                        VStack(spacing: -10.0){
                            welcome
                            discover
                            continuelearning
                                .padding(.bottom,60)
                            
                        }.padding(.top,-40)
                        
                        Spacer()
                    }//.transition(.asymmetric(insertion: .move(edge: .bottom), removal: .move(edge: .bottom)))
                    .transition(.scale)
                }
            }
            
          
            
            
            DetailView(data: selecteddata, namespace: namespace, show: $show)
            DetailView(data: topicsdata, namespace: namespace, show: $showtopic)
            
                     
        }
    }
    var navigation : some View {
        NavigationSection()
        
    }
    var welcome : some View {
        
        WelcomeSection(selecteddata: $topicsdata, show: $showtopic, namespace: namespace)
            .opacity(show ? 0 : 1)
        
    }
    var discover : some View {
        
        
        VStack {
            SectionTitleIcon(title: "DISCOVER", icon: "terminal")
            ScrollView(.horizontal, showsIndicators: false){
                
                HStack {
                    ForEach(discoverdata) { item in
                        DiscoverSection(data: item, corner: 17)
                            .frame(width: 399, height: 200)
                            .padding(2)
                            .newoffwhite(offwhiteisTapped: show, cornerradius: 17)
                            .matchedGeometryEffect(id: "\(item.subtitle)card", in: namespace)
                            .opacity(show ? 0 : 1)
                            .onTapGesture {
                                selecteddata = item
                                withAnimation(.spring()) {
                                    show.toggle()
                                }
                            }
                    }
                    
                }.padding()
                    .padding(.bottom,10)
                    
                
                
            }
        }.offset(y: -10)
        
        
    }
    var continuelearning : some View {
        VStack {
           SectionTitleIcon(title: "TOP SUBJECTS", icon: "terminal")
               // .padding(.top,10)
            ScrollView(.horizontal, showsIndicators: false){
                HStack(spacing: 12.0) {
                    ForEach(topsubjectsdata) { item in
                        ContinueSection(data: item, tapped: show)
                            .opacity(show ? 0 : 1)
                            
                            .padding(.bottom)
                            .simultaneousGesture(
                                TapGesture().onEnded{ _ in
                                    selecteddata = item
                                    withAnimation(.spring()) {
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                            show = true
                                        }
                                    }
                                })
                    }
                    
                }.padding()
                
            }
        }.offset(y: -19)
    }
    
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        //  HomeView()
        ContentView()
            .preferredColorScheme(.dark)
    }
}
