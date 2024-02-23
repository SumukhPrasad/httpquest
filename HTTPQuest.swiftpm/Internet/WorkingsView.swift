//
//  WorkingsView.swift
//  
//
//  Created by Sumukh Prasad on 10/02/24.
//

import SwiftUI

struct WorkingsView: View {
    @State private var currentPage = 0
    private var titles = [
        "Messages to Packets",
        "Radio Magic",
        "From your router to the internet",
        "Around the world in 80 milliseconds",
        "A message has arrived!"
    ]
    
    private var images = [
        "rectangle.split.3x3.fill",
        "dot.radiowaves.left.and.right",
        "cable.coaxial",
        "network",
        "envelope.badge.fill"
    ]
    
    var body: some View {
        HStack {
            ZStack(alignment: .leading) {
                Color.teal
                
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        Image(systemName: images[currentPage])
                            .resizable()
                            .scaledToFit()
                            .frame(width: UIScreen.main.bounds.width * 0.2)
                            .foregroundColor(Color.white)
                            .opacity(0.5)
                        Spacer()
                    }
                    Spacer()
                }
                
                VStack(alignment: .leading) {
                    Text("HOW THE INTERNET WORKS • PAGE \(currentPage+1)")
                        .font(.headline)
                        .foregroundColor(Color.white)
                        .opacity(0.7)
                    Spacer()
                    Divider()
                        .frame(width: UIScreen.main.bounds.width * 0.2)
                        .overlay(.white)
                    Text(titles[currentPage])
                        .font(.title)
                        .fontWeight(.light)
                        .foregroundColor(Color.white)
                }.padding(20)
            }
            .frame(width: UIScreen.main.bounds.width * 0.4)
            
            TabView(selection: $currentPage) {
                
                
                // ---
                
                VStack {
                    Spacer()
                    
                    Text("Going on a journey 🧳")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(.top, 20.0)
                    
                    Text("The message you sent is divided into small chunks called packets. Each packet is an envelope, with a **header** that tells the internet its send and receive address.")
                        .multilineTextAlignment(.center)
                        .padding(.top, 20)
                    
                    Spacer()
                    TextAndIconView(text: "Slide to move forward", systemImage: "chevron.right", imagePosition: .right)
                }
                .padding(20)
                .frame(maxWidth: .infinity)
                .tabItem {
                    Label("Page 1", systemImage: "circle")
                }
                .tag(0)
                
                // ---
                
                
                // ---
                
                VStack {
                    Spacer()
                    
                    Text("To the router!")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(.top, 20.0)
                    
                    Text("These packets are then converted to binary sequences and get onto radio waves to get to your router.")
                        .multilineTextAlignment(.center)
                        .padding(.top, 20)
                    
                    Text("That's **WiFi**!")
                        .multilineTextAlignment(.center)
                        .padding(.top, 20)
                    
                    Spacer()
                    TextAndIconView(text: "Slide to move forward", systemImage: "chevron.right", imagePosition: .right)
                }
                .padding(20)
                .frame(maxWidth: .infinity)
                .tabItem {
                    Label("Page 2", systemImage: "circle")
                }
                .tag(1)
                
                // ---
                
                
                // ---
                
                VStack {
                    Spacer()
                    
                    Text("Takeoff")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(.top, 20.0)
                    
                    Text("They’re then converted to pulses of electricity or light (depending on your router) and sent across the wires coming out the back of that device.")
                        .multilineTextAlignment(.center)
                        .padding(.top, 20)
                    
                    Spacer()
                    TextAndIconView(text: "Slide to move forward", systemImage: "chevron.right", imagePosition: .right)
                }
                .padding(20)
                .frame(maxWidth: .infinity)
                .tabItem {
                    Label("Page 3", systemImage: "circle")
                }
                .tag(2)
                
                // ---
                
                
                // ---
                
                VStack {
                    Spacer()
                    
                    Text("Across the world 🌎")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(.top, 20.0)
                    
                    Text("The wires off the back of your router travel to an Internet Hub, which figures out the fastest route for them to travel to where they need to be.")
                        .multilineTextAlignment(.center)
                        .padding(.top, 20)
                    
                    Text("Sometimes, the packets need to hitch a ride to the other side of the world. It’s quite simple, really, light goes in on one side of the ocean, and comes out on the other side of the ocean. These wires are what are called the internet backbones. These 400-odd cables form a web around the world and the \"Internet\" at large.")
                        .multilineTextAlignment(.center)
                        .padding(.top, 20)
                    
                    Spacer()
                    TextAndIconView(text: "Slide to move forward", systemImage: "chevron.right", imagePosition: .right)
                }
                .padding(20)
                .frame(maxWidth: .infinity)
                .tabItem {
                    Label("Page 4", systemImage: "circle")
                }
                .tag(3)
                
                // ---
                
                
                // ---
                
                VStack {
                    Spacer()
                    
                    Text("Landing")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(.top, 20.0)
                    
                    Text("When the packets reach their destination, they're put back together into your message on your friend's phone.")
                        .multilineTextAlignment(.center)
                        .padding(.top, 20)
                    
                    Spacer()
                    TextAndIconView(text: "Slide to move forward", systemImage: "chevron.right", imagePosition: .right)
                }
                .padding(20)
                .frame(maxWidth: .infinity)
                .tabItem {
                    Label("Page 5", systemImage: "circle")
                }
                .tag(4)
                
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            .ignoresSafeArea(edges: .top)
            
        }.ignoresSafeArea()
    }
}

#Preview {
    WorkingsView()
}
