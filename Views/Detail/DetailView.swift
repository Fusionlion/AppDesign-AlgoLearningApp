//
//  etailView.swift
//  FusionCode
//
//  Created by Zablon Charles on 4/18/22.
//

import SwiftUI

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
       // DetailView()
      //  DetailView(data: discoverdata[0])
        Group {
            ContentView()
                .preferredColorScheme(.light)
        }
    }
}


struct DetailView: View {
    var data: DiscoverModel
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @Environment(\.presentationMode) var presentationMode
    @State var viewState: CGSize = .zero
    var namespace: Namespace.ID
    @State var detailappear = false
    @State var text = "heeelooo"
    @Binding var show : Bool
    @State var scroll = 0
    @AppStorage("hideTabBar") var hideTabBar = false
    
    
    var body: some View {
        if show {
            VStack {
                    ZStack {
                        Color("white").edgesIgnoringSafeArea(.all)
                        ScrollView(showsIndicators: false) {
                            VStack {
                                GeometryReader { proxy in
                                    let scrollY = proxy.frame(in: .named("scroll")).minY
                                    
                                    VStack {
                                        Spacer()
                                    }
                                    .frame(maxWidth: UIScreen.main.bounds.width * 1)
                                    .frame(height: scrollY > 0 ? 400 + scrollY : 400)
                                    
                                    
                                    .background(
                                        
                                         
                                        VStack {
                                            if detailappear {
                                                Image(data.background)
                                                            .resizable()
                                                            .aspectRatio(contentMode: .fill)
                                                            
                                                            .cornerRadius(30)
                                                            .matchedGeometryEffect(id: "\(data.subtitle)card", in: namespace)
                                                            .offset(y: scrollY > 0 ? -scrollY : 0)
                                                            .scaleEffect(scrollY > 0 ? scrollY / 1000 + 1 : 1)
                                                            .blur(radius: scrollY > 30 ? scrollY / 10 : 0)
                                                            .accessibility(hidden: true)
                                                            .onChange(of: scrollY, perform: { V in
                                                                if scrollY > 200 {
                                                                    withAnimation(.spring()) {
                                                                        
                                                                        hideTabBar = false
                                                                    }
                                                                    hidedetailviewFunc()
                                                                }
                                                            })
                                                        
                                                            //.offset(y: show ? 0 : -100)
                                                            //.scaleEffect(detailappear ? 1 : 0.70)
                                                            .background(ScrollDetection(scrolling: $scroll))
                                                            .onTapGesture {
                                                                withAnimation(.spring()) {
                                                                   
                                                                    hideTabBar = false
                                                                }
                                                                hidedetailviewFunc()
                                                                
                                                        }
                                            }
                                        }
                                            
                                           
                                       
                                    )
                                    
                                    .mask(
                                        RoundedRectangle(cornerRadius: 10)
                                            .matchedGeometryEffect(id: "background", in: namespace)
                                            .offset(y: scrollY > 0 ? -scrollY : 0)
                                    )
                                    
                                    
                                }
                                .frame(height: 360)
                                
                                .overlay(
                                    VStack {
                                        Image(horizontalSizeClass == .compact ? "Waves 1 Dark" : "Waves 2")
                                            .renderingMode(.template)
                                            .foregroundColor(Color("white"))
                                            .frame(maxHeight: .infinity, alignment: .bottom)
                                            .accessibility(hidden: true)
                                            .offset(y:270)
                                        Color("white")
                                            .offset(y:360)
                                    }.offset(y: detailappear ? 0 : 450)
                                )
                                .overlay(
                                    VStack(alignment: .leading, spacing: 8) {
                                        
                                        
                                        
                                        Text(data.subtitle)
                                            .font(.title2).bold()
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                            .foregroundColor(.primary)
                                        
                                        Text(data.title)
                                            .font(.footnote)
                                            .foregroundColor(.primary.opacity(0.7))
                                        
                                        
                                        
                                        Divider()
                                            .foregroundColor(.secondary)
                                        
                                        HStack {
                                            
                                            Text("Taught by Zablon Charles")
                                                .font(.footnote.weight(.medium))
                                                .foregroundStyle(.secondary)
                                        }
                                        .accessibilityElement(children: .combine)
                                    }.matchedGeometryEffect(id: "text", in: namespace)
                                        .padding(20)
                                        .newoffwhite(offwhiteisTapped: true, cornerradius: 19)
                                    
                                    // .frame(maxHeight: .infinity, alignment: .bottom)
                                        .padding(20)
                                        .offset(y: 170)
                                        .offset(y: detailappear ? 0 : 550)
                                        .opacity(detailappear ? 1 : 0)
                                        .background(
                                            Color("white")
                                                .offset(y:360)
                                            
                                        )
                                    
                                )
                            }
                            .background(   GeometryReader { proxy in
                                let offset = proxy.frame(in: .named("scroll")).minY
                                Color.clear.preference(key: ScrollPreferenceKey.self, value: offset)
                            }
                                .onPreferenceChange(ScrollPreferenceKey.self) { offset in
                                    text = "\(offset)"
                                    if offset > 199 {
                                        
                                        hidedetailviewFunc()
                                        
                                    }
                                    
                                    
                                })
                            
                            VStack(alignment: .leading, spacing: 30) {
                                Text("SwiftUI is hands-down the best way for designers to take a first step into code. ")
                                    .font(.title3).fontWeight(.medium)
                                Text("This course")
                                    .font(.title).bold()
                                Text("This course is unlike any other. We care about design and want to make sure that you get better at it in the process. It was written for designers and developers who are passionate about collaborating and building real apps for iOS and macOS. While it's not one codebase for all apps, you learn once and can apply the techniques and controls to all platforms with incredible quality, consistency and performance. It's beginner-friendly, but it's also packed with design tricks and efficient workflows for building great user interfaces and interactions.")
                                Text("This year, SwiftUI got major upgrades from the WWDC 2020. The big news is that thanks to Apple Silicon, Macs will be able to run iOS and iPad apps soon. SwiftUI is the only framework that allows you to build apps for all of Apple's five platforms: iOS, iPadOS, macOS, tvOS and watchOS with the same codebase. New features like the Sidebar, Lazy Grid, Matched Geometry Effect and Xcode 12's visual editing tools will make it easier than ever to build for multiple platforms.")
                                Text("Multiplatform app")
                                    .font(.title).bold()
                                Text("For the first time, you can build entire apps using SwiftUI only. In Xcode 12, you can now create multi-platform apps with minimal code changes. SwiftUI will automatically translate the navigation, fonts, forms and controls to its respective platform. For example, a sidebar will look differently on the Mac versus the iPad, while using exactly the same code. Dynamic type will adjust for the appropriate platform language, readability and information density. ")
                            }
                            .padding(20)
                            .offset(y: detailappear ? 0 : 500)
                            //.transition(.asymmetric(insertion: .move(edge: .bottom), removal: .move(edge: .bottom)))
                           // .animation(.easeIn(duration: 12), value: show)
                            .background(Color("white").opacity(detailappear ? 1 : 0))
                            .padding(.vertical, 70)
                        }
                        .coordinateSpace(name: "scroll")
                        
                        
                        .ignoresSafeArea()
                        VStack {
                            
                            HStack{
                                HStack{
                                Image(systemName: "chevron.backward")
                                    Text(data.title)
                                        .font(.custom("MrDafoe-Regular", size: 29))
                                }.newoffwhite(offwhiteisTapped: show, cornerradius: 0)
                                .onTapGesture {
                                    hidedetailviewFunc()
                                }
                                // Text("FusionCode")
                                    
                                
                                
                                Spacer()
                                
                                Image(systemName: "bookmark")
                                    .circlemodifier(tapped: false)
                            }.padding(.horizontal)
                                .frame(height: 50)
                                .padding(.top, 30)
                                .background(Color("white"))
                                .offset(y: scroll < -68 ? -50 : -160)
                                .animation(.spring(), value: scroll)
                            Spacer()
                        }.opacity(scroll < -68 ? 1 : 0)
                        
                    }
                    .zIndex(1)
                    
                    .onAppear{
                        withAnimation(.spring()) {
                            detailappear = true
                        }
                    }
                    
                    
                
                
                
            }.transition(.opacity)
            .onAppear{
                withAnimation(.spring()) {
                    hideTabBar = true
                }
            }
            .onDisappear{
               // withAnimation(.spring()) {
                    hideTabBar = false
               // }
            }
        }
        
    }
    func hidedetailviewFunc() {
        withAnimation(.spring()) {
        detailappear = false
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
        withAnimation(.spring()) {
            show = false
        }
        }
    }
    
    
    
    
}
