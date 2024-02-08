//
//  SwiftUIView.swift
//  
//
//  Created by Sumukh Prasad on 07/02/24.
//

import SwiftUI

struct LearnView: View {
    @Binding var tabSelection: Int
    
    var body: some View {
        Text("Hello, World! iv")
    }
}

#Preview {
    LearnView(tabSelection: .constant(1))
}
