//
//  SwiftUIView_5.swift
//  swift_ui_pj
//
//  Created by 江培瑋 on 2022/2/16.
//

import SwiftUI

struct SwiftUIView_5: View {
   
    @State var  gg = false
    
    var body: some View {
        ScrollView{
            VStack{
                
                Button(action: {
                    
                   print("66666")
                   gg = true
                }){
                    Text(gg ? "one click" : "no one click" )
                        .foregroundColor( gg ?  Color.orange : Color.blue)
                        .padding()
                        .border(Color.orange, width: 5)
                }
        
                Text("外框border寫法")
                    .font(.title)
                    .padding()
                    .foregroundColor(Color.white)
                    .background(Color.orange)
                    .padding(10)
                    .border(Color.orange, width: 5)
                
                Text("外框overlay寫法")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding()
                    .foregroundColor(Color.white)
                    .background(Color.orange)
                    .cornerRadius(40)
                    .padding(10)
                    .overlay(
                    RoundedRectangle(cornerRadius: 40).stroke(Color.orange,lineWidth: 5)

                )
            
                Button(action: {
                    
                }){
                        Image(systemName: "trash")
                        .padding()
                        .foregroundColor(Color.white)
                        .background(Color.red)
                        .font(.system(size: 25)).clipShape(Circle())
                }
                Button(action: {
                    
                }){
                    HStack{
                        Image(systemName: "trash")
                        Text("Delete your file(寫法１)")
                    }
                    .frame(minWidth: 0, idealWidth: 5, maxWidth: .infinity, minHeight: 20, idealHeight: 40, maxHeight: 60)
                    .foregroundColor(Color.white)
                    .background(Color.red)
                    .font(.system(size: 20))
                    .cornerRadius(40)
                    .padding()
                }
                
                Button {
                    print("123")
                } label: {
                    Image(systemName: "trash")
                    Text("Delete your file(寫法２)")
                }.padding()
                .foregroundColor(Color.black)
                .background(LinearGradient(colors: [Color.orange,Color.green], startPoint: .leading, endPoint: .bottom))
                .shadow(color: Color.red, radius: 10, x: 5, y: 5)

                Button(action:{
                    
                }){
                        Text("button style1")
                }.buttonStyle(MyButtonStyle())
                
                Button(action:{
                    
                }){
                    Image(systemName: "cross.circle.fill")
                        .font(.system(size: 90))
                        .foregroundColor(.blue)
                        .padding()
                }
                .buttonStyle( ButtonStyle1() )
                .padding(.bottom,20)
                
                
            }
        }
       
    }
}

struct MyButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .padding()
            .foregroundColor(Color.white)
            .background(LinearGradient(colors: [Color.purple,Color.orange,Color.yellow], startPoint: .leading, endPoint: .trailing))
            .cornerRadius(20).padding()
            .scaleEffect(configuration.isPressed ? 0.8 : 1.2)
    }
}

struct ButtonStyle1: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .rotationEffect(configuration.isPressed ? .degrees(45) : .degrees(0))
           
    }
}

struct SwiftUIView_5_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView_5()
    }
}
