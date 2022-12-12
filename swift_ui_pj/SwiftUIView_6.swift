//
//  SwiftUIView_6.swift
//  swift_ui_pj
//
//  Created by 江培瑋 on 2022/2/20.
//

import SwiftUI

struct SwiftUIView_6: View {
    
  @State var isplay:Bool = false
  @State var count_value :Int = 0
  @State var count_value1 :Int = 0
  @State var count_value2 :Int = 0
    
    var hooly_test = test(name: "hooly",score: 80)
    
    var body: some View {
        
        ScrollView(showsIndicators: true){
            
            Button(action:{
                self.isplay.toggle()
                hooly_test.print_method()
            }){
                Image(systemName: isplay ?  "stop.circle.fill" : "play.circle.fill")
                    .foregroundColor(isplay ? Color.red:Color.green)
                    .font(.system(size: 60))
            }.padding()
            
            HStack{

                VStack{
                    Text("purple area total value")
                    Text("\(count_value+count_value1+count_value2)").padding(25)
                        .font(.system(size: 100))
                        .background(Color.purple)
                        .foregroundColor(Color.white)
                        .clipShape(Circle())
                }
                
            }
            
            HStack{
                Button(action:{
                    count_value += 1
                }){
                    Text("\(count_value)")
                        .padding(20)
                        .font(.system(size: 50))
                        .background(Color.red)
                        .foregroundColor(Color.white)
                        .clipShape(Circle())
                }
                count_button(binding_counter: $count_value1, color_value: Color.blue)
                
                count_button(binding_counter: $count_value2, color_value: Color.pink)
            }
            
            
        }.frame(width:600, height: .infinity)
    }
}

struct count_button: View{
    
    @Binding var binding_counter :Int
    var color_value:Color
    
    var body: some View {
        Button(action:{
            binding_counter += 1
        }){
            Text("\(binding_counter)")
                .padding(20)
                .font(.system(size: 50))
                .background(color_value)
                .foregroundColor(Color.white)
                .clipShape(Circle())
        }
    }
    
}
struct SwiftUIView_6_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView_6()
    }
}
