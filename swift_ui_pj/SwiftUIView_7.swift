//
//  SwiftUIView_7.swift
//  swift_ui_pj
//
//  Created by 江培瑋 on 2022/2/21.
//

import SwiftUI

struct SwiftUIView_7: View {
    
    var linergradient_value = LinearGradient(colors: [Color(red: 207/255, green: 150/255, blue: 207/255),Color(red: 107/255, green: 116/255, blue: 179/255)], startPoint: .trailing, endPoint: .leading)
    
    var body: some View {
        ScrollView{
            
            Path(){ Path in
                Path.move(to: CGPoint(x: 60, y: 60))
                Path.addLine(to: CGPoint(x: 160, y: 60))
                Path.addLine(to: CGPoint(x: 160, y: 160))
                Path.addLine(to: CGPoint(x: 60, y: 160))
            }.fill(Color(.sRGB, red: 100/255, green: 100/255, blue: 200/255, opacity: 0.6))
            
            Path(){ Path in
                Path.move(to: CGPoint(x: 150, y: 150))
                Path.addLine(to: CGPoint(x: 200, y: 150))
                Path.addLine(to: CGPoint(x: 200, y: 200))
                Path.addLine(to: CGPoint(x: 150, y: 200))
                Path.closeSubpath()
            }.stroke(Color.green,lineWidth: 10)
            
            Path(){ Path in
                Path.move(to: CGPoint(x: 60, y: 200))
                Path.addLine(to: CGPoint(x: 160, y: 200))
                Path.addLine(to: CGPoint(x: 160, y: 260))
                Path.addLine(to: CGPoint(x: 140, y: 260))
                Path.addQuadCurve(to: CGPoint(x: 80, y: 260), control: CGPoint(x: 110, y: 300))
                
                Path.addLine(to: CGPoint(x: 60, y: 260))
            }.fill(Color(.sRGB, red: 50/255, green: 100/255, blue: 200/255, opacity: 0.6))
            
            Path(){ Path in
                
                Path.move(to: CGPoint(x: 180, y: 200))
                Path.addCurve(to: CGPoint(x: 60, y: 40), control1: CGPoint(x: 30, y: 180), control2: CGPoint(x: 30, y: 120))
                
            }.stroke(Color(.sRGB, red: 200/255, green: 100/255, blue: 80/255, opacity: 0.6),lineWidth: 10)
            
            ZStack{
                Path(){ Path in

                    Path.move(to: CGPoint(x: 250, y: 200))
                    Path.addArc(center: CGPoint(x: 250, y: 200),
                                 radius: 45,
                                startAngle: Angle(degrees:0),
                                endAngle: Angle(degrees: 90),
                                 clockwise: true)


                }.fill(Color.purple)

                Path(){ Path in

                    Path.move(to: CGPoint(x: 250, y: 200))
                    Path.addArc(center: CGPoint(x: 250, y: 200),
                                 radius: 45,
                                startAngle: Angle(degrees:0),
                                endAngle: Angle(degrees: 300),
                                 clockwise: true)

                }.fill(Color.red)

                Path(){ Path in

                    Path.move(to: CGPoint(x: 250, y: 200))
                    Path.addArc(center: CGPoint(x: 250, y: 200),
                                 radius: 45,
                                startAngle: Angle(degrees:300),
                                endAngle: Angle(degrees: 210),
                                 clockwise: true)

                }.fill(Color.yellow)


                Path(){ Path in

                    Path.move(to: CGPoint(x: 250, y: 200))
                    Path.addArc(center: CGPoint(x: 250, y: 200),
                                 radius: 45,
                                startAngle: Angle(degrees:90),
                                endAngle: Angle(degrees: 0),
                                clockwise: true)

                }.fill(Color.green).offset(x: 15, y: 15)

                Path(){ Path in

                    Path.move(to: CGPoint(x: 250, y: 200))
                    Path.addArc(center: CGPoint(x: 250, y: 200),
                                 radius: 45,
                                startAngle: Angle(degrees:90),
                                endAngle: Angle(degrees: 0),
                                clockwise: true)
                    Path.closeSubpath()
                }.stroke(Color.orange,lineWidth: 5).offset(x: 15, y: 15).overlay(
                    Text("25%").foregroundColor(Color.black).offset(x: 125, y: 230)
                )
                
            }
            
            Button(action: {
                
            }){
                Text("add shape button").font(.system(size: 20, design: .rounded)).padding().foregroundColor(Color.white).background(MyShape().fill(Color.red))
            }.offset(x: 0, y: 280)
            
            Button(action: {
                
            }){
                Text("")
                    .padding()
                    .font(.system(size: 20, design: .rounded))
                    .padding()
                    .foregroundColor(Color.white)
                    .background(Color.blue)
                    .clipShape(Circle())
                    .overlay(
                    RoundedRectangle(cornerRadius: 5)
                        .frame(width: 40, height: 40)
                        .foregroundColor(Color.white)
                
                )
            }.offset(x: 0, y: 280)
            
            VStack{
                ZStack{
                    Circle().stroke(Color(.systemGray4),lineWidth: 10).frame(width: 200, height: 100)
                    
                    Circle().trim(from: 0, to: 0.85).stroke(linergradient_value,lineWidth: 10).frame(width: 200, height: 100)
                }.offset(x: 0, y: 150).overlay(
                    VStack{
                        Text("85 % ").font(.system(size: 30))
                        
                        Text("complete ").font(.system(size: 15))
                    }.offset(x: 0, y: 150)
                )
            }.frame(width: .infinity, height: 400)
            
            ZStack{
                Group{
                    Circle().trim(from: 0, to: 0.35).stroke(Color(.systemRed),lineWidth: 80)
                    
                    Circle().trim(from: 0.35, to: 0.45).stroke(Color(.systemYellow),lineWidth: 80)
                    
                    Circle().trim(from: 0.45, to: 0.6).stroke(Color(.systemBlue),lineWidth: 80)
                    
                    Circle().trim(from: 0.6, to: 1).stroke(Color(.systemGreen),lineWidth: 95).overlay(
                        Text("40 % ").font(.system(size: 30)).foregroundColor(Color.white).bold().offset(x: 30, y: -70)
                    )
                    
                    
                }.frame(width: .infinity, height: 150).offset(x: 0, y: -80)
            }.frame(width: .infinity, height: 450)
        }
    }
}
struct MyShape: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: 0, y: 0))
            path.addQuadCurve(to: CGPoint(x: rect.size.width, y: 0), control: CGPoint(x: rect.size.width/2, y:-(rect.width*0.1) ) )
            path.addRect(CGRect(x: 0, y: 0, width: rect.size.width, height: rect.size.height))
        }
    }
}
struct SwiftUIView_7_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView_7()
    }
}
