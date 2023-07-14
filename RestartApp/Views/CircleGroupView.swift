//
//  CircleGroupView.swift
//  RestartApp
//
//  Created by Matteo Buompastore on 14/07/23.
//

import SwiftUI

struct CircleGroupView: View {
    
    //MARK: - PROPERTY
    @State var shapeColor : Color = .white
    @State var shapeOpacity : Double = 0.2
    @State private var isAnimating = false
    
    var body: some View {
        ZStack {
            Circle().stroke(shapeColor.opacity(shapeOpacity), lineWidth: 40)
                .frame(width: 360, height: 260, alignment: .center)
            Circle().stroke(shapeColor.opacity(shapeOpacity), lineWidth: 80)
                .frame(width: 360, height: 260, alignment: .center)
        }//: ZSTACK
        .blur(radius: isAnimating ? 0 : 10)
        .opacity(isAnimating ? 1 : 0)
        .scaleEffect(isAnimating ? 1 : 0.5)
        .animation(.easeOut(duration: 1), value: isAnimating)
        .onAppear {
            withAnimation {
                isAnimating = true
            }
        }
    }
}

struct CircleGroupView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.blue.ignoresSafeArea()
            CircleGroupView(shapeColor: .white, shapeOpacity: 0.2)
        }
    }
}
