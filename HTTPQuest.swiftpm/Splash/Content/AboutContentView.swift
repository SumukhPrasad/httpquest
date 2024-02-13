//
//  AboutContentView.swift
//  
//
//  Created by Sumukh Prasad on 09/02/24.
//

import SwiftUI

struct AboutContentView: View {
    var body: some View {
        Text("To most of us, the internet is a virtual thing — we use it to talk with friends, to know more about the world, to share stories, to find inspiration: it has brought the world together in a way nothing before it could have. At an instant's notice, we have access to all the world's information. But have we taken the time to learn how this indispensable tool works?")
            .opacity(0.5)
        
        Text("Why should we know how the internet works?")
            .font(.largeTitle)
            .fontWeight(.bold)
            .padding(.top, 20.0)
        Text("When people and computers connect, the value of computing increases.")
        
    }
}

#Preview {
    AboutView()
}
