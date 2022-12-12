//
//  SwiftUIView_first.swift
//  swift_ui_pj
//
//  Created by 江培瑋 on 2022/1/27.
//

import SwiftUI

struct SwiftUIView_first: View {
    @State var hover_bool = false
    @State var overText  = false
    
    var body: some View {
     
        VStack{
            Text("歐江安與潘國隆今午於台北美福大飯店舉辦婚宴，總統府秘書長李大維、外交部長吳釗燮、國安會副秘書長徐斯儉等官員，以及澳洲、歐洲等地駐台使節到場祝賀，皆未上台致詞。\n歐江安取得美國哥倫比亞大學政治學最常在台大校園約會，最常吃的當然就是台大餐廳了，也因為先生的工作，現在歐江安除了外交部發言人頭銜，還有學生稱她為「師母」。\n兩人已於去年七月登記結婚，因疫情延後舉辦婚宴。")
                .lineLimit(21)
                .truncationMode(.head)
                .multilineTextAlignment(.center)
                .lineSpacing(CGFloat(10))
                .rotation3DEffect(.degrees(25),axis:  (x: 1, y: 0,z: 0 ))
                .shadow(color: .purple, radius: 1, x: 0, y: 15)
                .allowsTightening(true)
                .minimumScaleFactor(CGFloat(0.3))
            
            Group{
                
                Text("ggggg")
                    .fontWeight(.heavy)
                    .foregroundColor(.red)+Text("aaa").fontWeight(.heavy).foregroundColor(.green)
            }.padding()
         
             
        }
 
    }
}

struct SwiftUIView_first_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView_first()
.previewInterfaceOrientation(.portrait)
    }
}
