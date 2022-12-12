//
//  SwiftUIView_8.swift
//  swift_ui_pj
//
//  Created by 江培瑋 on 2022/2/22.
//

import SwiftUI

struct SwiftUIView_8: View {
    
    @State var circle_color_change:Bool = false
    @State var heart_color_change:Bool = false
    @State var heart_size_change:Bool = false
    
    @State var circle_color_change1:Bool = false
    @State var heart_color_change1:Bool = false
    @State var heart_size_change1:Bool = false
    
    @State var circle_loading:Bool = false
    
    @State var progess_value:Double = 0
    
    @State var delay_circle_loading:Bool = false
    
    @State var recoding:Bool = false
    @State var record_begin:Bool = false
    
    var body: some View {
        
        ScrollView{
            
            Text("隱式動畫")
            ZStack{
                Circle().frame(width: 150, height: 150).foregroundColor(circle_color_change ? Color.gray : Color.red)
                
                Image(systemName: "heart.fill").font(.system(size: 55)).foregroundColor(heart_color_change ? Color.red : Color.white).scaleEffect(heart_size_change ? 1.6 : 1)
            }.animation(.spring(response: 0.3, dampingFraction: 0.3, blendDuration: 0.3), value: circle_color_change)
            .onTapGesture {
                circle_color_change.toggle()
                heart_size_change.toggle()
                heart_color_change.toggle()
            }.padding()
            
  ///////////////////////////////////////////////////////
            
            Text("顯式動畫")
            
            ZStack{
                Circle().frame(width: 150, height: 150).foregroundColor(circle_color_change1 ? Color.gray : Color.red)
                
                Image(systemName: "heart.fill").font(.system(size: 55)).foregroundColor(heart_color_change1 ? Color.red : Color.white).scaleEffect(heart_size_change1 ? 1.6 : 1)
            }
            .onTapGesture {
                withAnimation (.spring(response: 0.3, dampingFraction: 0.3, blendDuration: 0.3)){
                    circle_color_change1.toggle()
//                    heart_size_change.toggle()
                    heart_color_change1.toggle()
                }
             
            }
            
///////////////////////////////////////////////////////
            ZStack{
                Text("loading animation")
                Circle().stroke(Color(.systemGray4),lineWidth: 15).frame(width: 150, height: 150)
                Circle()
                    .trim(from: 0.7, to: 1)
                    .stroke(Color.green,lineWidth: 10)
                    .frame(width: 150, height: 150)
                    .rotationEffect(Angle(degrees: circle_loading ? 360 : 0))
                    .padding()
                    .animation(Animation.default.repeatForever(autoreverses: false), value: circle_loading)
                    .onAppear {
                        self.circle_loading = true
                    }
            }.frame(maxWidth: .infinity).padding()
  
///////////////////////////////////////////////////////
            
            ZStack{
                Text("Loading animation")
                    .font(.system(size: 25, weight: .bold, design: .rounded))
                    .offset(x: 0, y: -40)
                RoundedRectangle(cornerRadius: 3)
                    .stroke(Color(.systemGray4),lineWidth: 10)
                    .frame(width: 250, height: 10)
                
                RoundedRectangle(cornerRadius: 3)
                    .stroke(Color(.systemGreen),lineWidth: 10)
                    .frame(width: 30, height: 10)
                    .offset(x: circle_loading ? 110 : -110, y: 0)
                    .animation(Animation.linear(duration: 1).repeatForever(autoreverses: false), value: circle_loading)
                    .onAppear {
                        self.circle_loading = true
                    }
            }.frame(maxWidth: .infinity).padding(60)
            
///////////////////////////////////////////////////////
            
            ZStack{
                Text("\(Int(self.progess_value*100)) %").font(.system(size: 35)).offset(x: 0, y: -25)
                Text("loading progess").offset(x: 0, y: 15)
                
                Circle()
                    .stroke(Color(.systemGray4),lineWidth: 10)
                    .frame(width: 150, height: 150)
                
                Circle()
                    .trim(from: 0, to: progess_value)
                    .stroke(Color(.systemGreen),lineWidth: 10)
                    .frame(width: 150, height: 150)
                    .rotationEffect(Angle(degrees: -90))
                    
                
            }.padding().onAppear {
                
                Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { timer in
                    self.progess_value += 0.05
                    
                    if progess_value > 1 {
                        timer.invalidate()
                    }
                    
                }
            }
            
///////////////////////////////////////////////////////
            VStack{
                Text("  Delay Circle Animation")
                
                HStack{
                    
                    ForEach(0...4,id: \.self){ index in
                        Circle()
                            .frame(width: 10, height: 10)
                            .foregroundColor(.green)
                            .scaleEffect(self.delay_circle_loading ? 0 : 1)
                            .animation(Animation.linear(duration: 0.5)
                                        .repeatForever(autoreverses: true)
                                        .delay(0.35*Double(index))
                                       , value: self.delay_circle_loading)
                        
                    }
                    .onAppear {
                        self.delay_circle_loading = true
                    }
                    
                }.padding()
            }.padding(50)

///////////////////////////////////////////////////////
            
            ZStack{
                
                Text("長方形 轉 圓型 動畫").font(.system(size: 30)).offset(x: 0, y: -60)
                
                
                RoundedRectangle(cornerRadius: record_begin ? 30 : 5)
                    .frame(width: record_begin ? 60 : 160 , height: 60)
                    .foregroundColor(Color.green)
                    .padding()
                    .overlay(
                        
                        Image(systemName: "mic.fill")
                            .font(.system(size: 30))
                            .foregroundColor(Color.white)
                            .scaleEffect( recoding ? 0.7 : 1)

                    )
               
                RoundedRectangle(cornerRadius: record_begin ? 30 : 5)
                    .trim(from: 0, to: record_begin ? 0.0001 : 1)
                    .stroke(Color.green,lineWidth: 5)
                    .frame(width: record_begin ? 70 : 170 , height: 70)
                    
                    
                    
            }.padding(50)
                .onTapGesture {
                    withAnimation(Animation.spring()){
                        self.record_begin.toggle()
                    }
                    
                    withAnimation(Animation.spring().repeatForever().delay(0.5)){
                        self.recoding.toggle()
                    }
                }
            
            
            
            
            
            
        }
     
    }
}

struct SwiftUIView_8_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView_8()
    }
}
