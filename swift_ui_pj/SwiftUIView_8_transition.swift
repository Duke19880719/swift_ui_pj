//
//  SwiftUIView_8_transition.swift
//  swift_ui_pj
//
//  Created by 江培瑋 on 2022/2/25.
//
//非對稱動畫 和 對稱動畫 在預覽畫面有發現只有在消失時才有動畫，插入沒有，但是以模擬器查看時兩者都有，這應該是預覽器的問題


import SwiftUI

struct SwiftUIView_8_transition: View {
    @State var show_infor : Bool = false
    
    @State var animation_procssing: Bool = false
    @State var animation_loading: Bool = false
    @State var animation_completed: Bool = false
    
    var body: some View {
        
        ScrollView{
            VStack{
                Rectangle_view(infor_str: "Show transition", background_color: Color.green)
                    .onTapGesture {
                        withAnimation(Animation.spring()){
                            show_infor.toggle()
                        }
                     
                    }
                if show_infor{
                    Text("對稱轉場")
                    Rectangle_view(infor_str: "scale transition", background_color: Color.purple)
                        .animation(Animation.default.delay(0),value: show_infor)
                        .transition(.scale(scale: 0, anchor: .bottom))
                    
                }
                if show_infor{
                    Rectangle_view(infor_str: "opacity transition", background_color: Color.orange)
                        .animation(Animation.default.delay(2),value: show_infor)
                        .transition(.opacity)
                }
                if show_infor{
                    Rectangle_view(infor_str: "offset transition", background_color: Color.blue)
                        .animation(Animation.default.delay(1),value: show_infor)
                        .transition(.offset(x: -250, y: -100))
                }
                if show_infor{
                    Rectangle_view(infor_str: "move transition", background_color: Color.pink).animation(Animation.default.delay(1),value: show_infor).transition(.move(edge: .bottom ))
                }
                if show_infor{
                    Rectangle_view(infor_str: "slide transition", background_color: Color.cyan)
                        .animation(Animation.default.delay(1),value: show_infor)
                        .transition(.slide)
                }
                if show_infor{
                    Rectangle_view(infor_str: "multiple transitions", background_color: Color.gray)
                        .animation(Animation.default.delay(1),value: show_infor)
                        .transition(.slide.combined(with: .scale).combined(with: .opacity))
                    
                }
                if show_infor{
                    Text("非對稱轉場")
                    Rectangle_view(infor_str: "assymetric transitions", background_color: Color.yellow)
                        .animation(Animation.default.delay(2),value: show_infor)
                        .transition(.asymmetric(insertion: .scale(scale: 2.5, anchor: .bottom), removal: .offset(x: -250, y: -100)))
                    
                }
            }
            
///////////////////////////////////////////////////////
            
            ZStack{
                RoundedRectangle(cornerRadius: 50)
                    .frame(width: animation_procssing ? 250 : 200, height: 60)
                    .foregroundColor(animation_completed ? Color.red : Color.green)
            
                if animation_procssing && !animation_completed {
                    HStack{
                        Circle()
                            .trim(from: 0.20, to: 1)
                            .stroke(Color.white,lineWidth: 8)
                            .frame(width: 30, height: 30)
                            .rotationEffect(Angle(degrees: animation_loading ? 360 : 0))
                            .animation(animation_loading ? Animation.easeOut.repeatForever(autoreverses: false) : .default , value: animation_loading)
                          
                        Text("Processing")
                            .foregroundColor(Color.white)
                            .font(.system(size: 23, weight: .bold, design: .rounded))
                    }.transition(.opacity)
                    .onAppear{
                   
                        animation_loading = true
                        
                        DispatchQueue.main.asyncAfter(deadline: .now()+2){
                 
                            self.animation_completed = true
                            
                        }
                    }
                }
                if !animation_procssing{
                    Text("Submit")
                        .foregroundColor(Color.white)
                        .font(.system(size: 23, weight: .bold, design: .rounded))
                        .transition(.move(edge: .top))
                }
                if animation_completed{
                    Text("Done")
                        .foregroundColor(Color.white)
                        .font(.system(size: 23, weight: .bold, design: .rounded))
                        .transition(.move(edge: .top))
                        .onAppear{
                            
                            DispatchQueue.main.asyncAfter(deadline: .now()+1){

                                animation_procssing = false
                                animation_loading = false
                                animation_completed = false
                                
                            }
                        }
                }

 
            } .animation(.spring(),value: animation_procssing) .onTapGesture {
                animation_procssing.toggle()

            }

        }

    }
}




struct circle_view: View {
    
    @Binding var animation_show1: Bool
    
    var body: some View {
        
        Circle().trim(from: 0.20, to: 1)
            .stroke(Color.white,lineWidth: 8)
            .frame(width: 30, height: 30)
            .rotationEffect(Angle(degrees: animation_show1 ? 360 : 0))
            .animation(animation_show1 ? .default.repeatForever(autoreverses: false) : .default , value: animation_show1)
    
    }
}



struct Rectangle_view: View {
    var infor_str:String
    var background_color:Color
    
    var body: some View {
        
        RoundedRectangle(cornerRadius: 10)
            .frame(width: 250, height: 50)
            .foregroundColor(background_color)
            .overlay(
                
                Text(infor_str)
                    .foregroundColor(Color.white)
                    .font(.system(size: 23, weight: .bold, design: .rounded))
    
            )
    }
}

struct SwiftUIView_8_transition_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView_8_transition()
    }
}
