//
//  SwiftUIView_14.1.swift
//  swift_ui_pj
//
//  Created by 江培瑋 on 2022/3/23.
//

import SwiftUI

struct SwiftUIView_14_1: View {
    
    @State var check_click:Bool = false
    var body: some View {
        Image(systemName: "star.circle.fill")
              .font(.system(size: 160))
              .scaleEffect(check_click ? 0.8 : 1.5)
              .animation(SwiftUI.Animation.easeInOut(duration: 1.5),value: check_click)
              .foregroundColor( SwiftUI.Color.orange)
              .gesture(
                  
                  TapGesture().onEnded({ _ in
                      check_click.toggle()
                  })
              )
    }
}

struct SwiftUIView_14_1_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView_14_1()
    }
}
