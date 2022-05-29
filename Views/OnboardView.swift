//
//  OnboardView.swift
//  FusionCode
//
//  Created by Zablon Charles on 4/17/22.
//

import SwiftUI

struct OnboardView: View {
        var title = "Welcome to Fusion"
        var message = "Here at Fusion LLC, we have dedicated half of our life in the solde pupose of helping women all around the globe get the health that they deserve."
        var gradientTitle : [Color] =  [Color("black") , .pink, Color("black")]
        var gradientMessage : [Color] =  [Color("black"), .pink, Color("black")]
        var image = "fusionhalfgirl"
        @State var appears = false
        @State var backButtonAppeared = false
        @State var messageeTapped = false
    @State var startTapped = false
    
    @State var paged = 1
      
        let transition: AnyTransition = .asymmetric(
            insertion: .move(edge: .leading),
            removal: .move(edge: .leading))
        var body: some View {
            ZStack {
              //  BackgroundColor()
                Color("offwhiteblack").edgesIgnoringSafeArea(.all)
                
                LottieView(filename: "stars" ,loop: true)
                    .frame(width: 220)
                    .offset(x: 0, y: -320)
                    .rotationEffect(.degrees(appears ? 90 : -90))
                
               
                Image("Blob 1 Dark")
                    .resizable(resizingMode: .stretch)
                    .aspectRatio(contentMode: .fit)
                    .blur(radius: 19)
                    .offset(x: paged == 0 ? UIScreen.main.bounds.height * 0.5 : 50, y: -20)
                    
                    .animation(.spring(), value: paged)
                
                
                
               
                
                
                
                ZStack {
                    TabView(selection: $paged) {
                        logo
                            .tag(0)
                        pagesone
                            .tag(1)
                    }.tabViewStyle(.page(indexDisplayMode: .never))
             
                    
                   
                    
                
              
                
            }
            
        }
   
    
    
        }
    var logo: some View {
      
          VStack{
            
            Image("logooffwhite")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 340, height: 340, alignment: .center)
                .newoffwhite(offwhiteisTapped: appears, cornerradius: 0)
                .offset(y: UIScreen.main.bounds.height * -0.1)
              
              GradientText(text: "FUSIONCODE", gradient: [Color("black"),.blue,.red])
                      .font(.custom("Forza", size: 25))
                      .newoffwhite(offwhiteisTapped: appears, cornerradius: 0)
                      .overlay(
                        Text("TM")
                            .font(.caption2)
                            .offset(x: 90 , y: -20)
                            .foregroundColor(.gray)
                      )
                      .opacity(appears ? 1 : 0)
                      .offset(y:-130)
                      
             
            
        }
        
        
        .scaleEffect(appears ? 1 : 0.96)
        
        .onTapGesture {
            withAnimation(.spring()){
                appears.toggle()
            }
        }
        .onAppear {
            withAnimation(.easeInOut(duration: 4)){
                appears = true
            }
            
        }
        .onDisappear {
            appears = false
        }
        
        
    }
    var pagesone: some View {
        VStack {
            
            LottieView(filename: "clouddata" ,loop: true)
                .frame(width: 420)
                //.offset(x: 0, y: -320)
            
            VStack{
                GradientText(text: "Data Structures & Algorithms", gradient: [.purple,.blue,.white])
                    .font(.title3)
                
                Text("Learn the fundemental rules of programming")
                  //  .offset(x: 0, y: -20)
            }
           
            button
        }.padding(.horizontal, 18)
            .edgesIgnoringSafeArea(.all)
            .padding(.bottom, 29)
            .onTapGesture(perform: {
                messageeTapped.toggle()
            })
    }
    var button : some View {
        VStack{
            Text("Start")
                .padding(.horizontal,30)
                .padding(.vertical, 9)
                .newoffwhite(offwhiteisTapped: true, cornerradius: 8)
                .onTapGesture {
                    start()
                }
        }
    }
    func start() {
        startTapped = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
            startTapped = false
            
        }
    }
    }


struct OnboardView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardView()
            .preferredColorScheme(.dark)
    }
}
