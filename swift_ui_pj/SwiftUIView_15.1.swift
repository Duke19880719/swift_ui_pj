//
//  SwiftUIView_15.1.swift
//  swift_ui_pj
//
//  Created by 江培瑋 on 2022/3/28.
//

import SwiftUI

struct SwiftUIView_15_1: View {
   
        @Binding var restaurant:restaurant?
        
        @State var check_alert:Bool = false
        
        @Environment(\.presentationMode) var mode
    
        @GestureState private var drag_state_value = drag_state.inactive
    
        @State private var offect_value:CGFloat = 0
        
        @State private var view_state_value =  view_state.helf
    
        @Binding var  isshow :Bool
    
        @State var  scroll_view_offect_value :CGFloat = 0
    
        var body: some View{
            
            GeometryReader{ geometry in
                
               
            VStack{
                
                Rectangle()
                    .frame(width: 50, height: 6)
                    .foregroundColor(Color(.systemGray5))
                    .cornerRadius(10)
                
                ScrollView{
                    
                    GeometryReader { scrollViewProxy in
                        Color.clear.preference(key: scroll_offect_key.self, value: scrollViewProxy.frame(in: .named("scrollview")).minY)
                    }
                    .frame(height: 0)
                    
                    
                    Image(restaurant!.img_name)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .edgesIgnoringSafeArea(.all)
                    
                    
                    Text(restaurant!.restaurant_name).font(.title).bold().foregroundColor(.primary)
                    Text("By R.O.C ").font(.caption).bold().foregroundColor(.secondary)
                    
                    HStack{
                        ForEach(0 ..< 5){ index in
                            Image(systemName: "star")
                                .foregroundColor(Color.yellow)
                                .overlay{
                                    if(0..<4).contains(index){
                                        Image(systemName: "star.fill")
                                            .foregroundColor(Color.yellow)
                                    }
                                    
                                }
                        }
                    }
                        Text("From about 10 days ago office parties started to get cancelled [because of Omicron]. Going forward after yesterday's announcement that is only going to accelerate, he told the BBC's Today programme.\nWhat government has got to appreciate is for businesses, particularly in our sector, Christmas is always a key time.")
                            .font(.system(size: 15)).bold().foregroundColor(.secondary).padding()
                }
                .disabled(view_state_value == .helf)
                .padding(.bottom,80)
                .background(Color.white)
                .cornerRadius(30,antialiased: true)
                .coordinateSpace(name: "scrollview")
      
            }
                .offset(y: geometry.size.height/2 + drag_state_value.translation.height + offect_value)
                .offset(y: scroll_view_offect_value)
                .animation(.interpolatingSpring(stiffness: 200.0, damping: 25.0, initialVelocity: 10.0))
                .edgesIgnoringSafeArea(.all)
                .gesture(DragGesture().updating($drag_state_value, body: { Value, State, Transaction in
                    State = .dragging(translation: Value.translation)
                }).onEnded({ value in
                    if self.view_state_value == .helf{
                        if value.translation.height < -geometry.size.height*0.25{
                            offect_value = -geometry.size.height/2 + 60
                            view_state_value = .full
                        }
                        if value.translation.height > geometry.size.height * 0.3 {
                            isshow = false
                        }
                    }
                }))
                .onPreferenceChange (scroll_offect_key.self){ VALUE in
                    if view_state_value == .full{
                        scroll_view_offect_value = VALUE>0 ? VALUE : 0
                        
                        if  scroll_view_offect_value > 120{
                            offect_value = 0
                            view_state_value = .helf
                            scroll_view_offect_value = 0
                        }
                    }
                }
                
            }
            

            
        }
    
}
enum drag_state{
    
    case inactive
    case pressing
    case dragging(translation: CGSize)
    
    var translation: CGSize{
        switch self{
        
        case .inactive, .pressing:
            return .zero
        case .dragging(let translation) :
            return translation
        
        }
    }
    
    var is_dragging:Bool{
        switch self{
        
        case .dragging, .pressing:
            return true
        case .inactive :
            return false
        
        }
    }
}

enum view_state{
    case full
    case helf
    
}
struct scroll_offect_key:PreferenceKey{
    
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value += nextValue()
    }
    
    typealias Value = CGFloat
    static var defaultValue = CGFloat.zero
    
}
struct SwiftUIView_15_1_Previews: PreviewProvider {
    var restaurant:restaurant?
    static var previews: some View {
        SwiftUIView_15_1(restaurant: .constant(restaurant_array[0]), isshow: .constant(true)).background(Color.black.opacity(0.3)).edgesIgnoringSafeArea(.all)
    }
}
