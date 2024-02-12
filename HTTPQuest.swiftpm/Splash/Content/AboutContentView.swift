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
        
        Text("Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.")
    }
}

#Preview {
    AboutView()
}
