//
//  SwiftUIView_22_3D_Model_Scenekit.swift
//  swift_ui_pj
//
//  Created by 江培瑋 on 2022/10/24.

//3D Model Resources Web:https://sketchfab.com/feed
//3D Model data type : usdz
//SceneView Frame 要注意設計大小，有可能會影響３D Model顯示

import SwiftUI
import SceneKit

var three_d_model_data:[three_d_data_model] = [
    three_d_data_model( model_name: "Pocket_Shrek_Puss_in_boots.usdz", name: "鞋貓劍客", description: "Puss in 他在《史萊克2》中首次亮相，成為史萊克的搭檔和助手（與驢子一起）。在《史萊克3》中，Puss幫助史萊克找到了遙遠王國王位繼承人。《永遠的史萊克》以另一個宇宙為背景，Puss是Fiona公主的寵物，退休後體重增加了。 在《穿靴子的貓》中，其中描述了他的起源。 Puss還出現在以他為中心的《穿靴子的貓咪歷險記》中。"),
    three_d_data_model( model_name: "Shiba.usdz", name: "柴犬", description: "柴犬，日本犬種之一。屬於中小型犬種。「柴犬」一詞在日文中意即「灌木叢狗」，發源於日本中央高地。「柴」是「打柴人」的「柴」，指小型的雜木。由於柴犬能巧妙地穿過雜木幫助打獵，而且紅褐色的毛色與枯萎的柴相似，故名。亦有人認為古語的「柴」，是把信州的柴村作為起源地。")
]

struct SwiftUIView_22_3D_Model_Scenekit: View {
    
    @State var index = 0
    
    var body: some View {
        VStack{
            SceneView(scene: SCNScene(named: three_d_model_data[index].model_name), options: [.autoenablesDefaultLighting,.allowsCameraControl])
//                .frame(width: UIScreen.main.bounds.width-30, height: UIScreen.main.bounds.height/2.5)
              
                .border(LinearGradient(colors: [.cyan,.yellow,.orange], startPoint: .top, endPoint: .bottom), width: 10)
                .cornerRadius(15)

            HStack{
                Button {
                    if (index==1){
                        index = 0
                    }
                    else{
                        index += 1
                    }
                } label: {
                    Image(systemName: "arrowtriangle.left.square.fill")
                        .font(.largeTitle)
                        .foregroundStyle(.linearGradient(colors: [.green,.gray,.yellow.opacity(0.75)], startPoint: .top, endPoint: .bottom))
                        .shadow(color: .white, radius: 1, x: 1, y: 1)
                }
               
                Spacer(minLength: 0)
                
                Text(three_d_model_data[index].name)
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(Color( red: 162/255, green: 210/255, blue: 255/255))
                    .shadow(color: .black, radius: 0.75, x: 0.5, y: 0.5)
                   
                Spacer(minLength: 0)
                
                Button {
                    if (index==1){
                        index = 0
                    }
                    else{
                        index += 1
                    }
                } label: {
                    Image(systemName: "arrowtriangle.right.square.fill")
                        .font(.largeTitle)
                        .foregroundStyle(.linearGradient(colors: [.green,.gray,.yellow.opacity(0.75)], startPoint: .top, endPoint: .bottom))
                }
              
            }.padding([.horizontal,.bottom])
            
            ScrollView{
                Text(three_d_model_data[index].description)
                    .font(.system(size: 21))
                    .foregroundColor(.secondary)
                    .shadow(color: .black, radius: 0.25, x: 1, y: 1)
                    .lineSpacing(6)
                    .padding()
                    .background(.yellow.opacity(0.85))
                    .cornerRadius(15)
            }
          
        }
        .edgesIgnoringSafeArea(.all)
        .frame(width: .infinity, height: .infinity)
        .padding()
        .background(
            Image("black&white")
                .resizable()
                .edgesIgnoringSafeArea(.all)
                           .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        
        )

    }
}

struct SwiftUIView_22_3D_Model_Scenekit_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView_22_3D_Model_Scenekit()
    }
}

struct three_d_data_model:Identifiable{
    var id = UUID()
    var model_name:String
    var name:String
    var description:String
}


