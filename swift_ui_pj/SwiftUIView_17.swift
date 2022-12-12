//
//  SwiftUIView_17.swift
//  swift_ui_pj
//
//  Created by 江培瑋 on 2022/4/26.
//

import SwiftUI

var cards:[card_data_17_struct] = [
    card_data_17_struct(card_name:"Joe",card_img:"ae",card_number:063214555,card_expiry_date:"2020/07/13"),
    card_data_17_struct(card_name:"John",card_img:"chase",card_number:064211585,card_expiry_date:"2018/03/03"),
    card_data_17_struct(card_name:"Mary",card_img:"discover",card_number:165214595,card_expiry_date:"2023/01/25"),
    card_data_17_struct(card_name:"Leo",card_img:"master",card_number:053417585,card_expiry_date:"2015/04/10"),
    card_data_17_struct(card_name:"Colder",card_img:"visa",card_number:064214375,card_expiry_date:"2022/02/12")
    ]

struct SwiftUIView_17: View {
    @State var card_present:Bool = false
    @State var card_sub_view_present:Bool = false
    @State var card_is_pressed = false
    @State var card_selected:card_data_17_struct?
    
    @GestureState private var drag_state = swiftui_17_drag_state.inactive
    
    var body: some View {
        GeometryReader{ geometry in
            
            VStack{
                top_view_swiftui_17()
                     .padding(.bottom)
                 
                 Spacer()
                 
                 ZStack{
                     if card_present == true{

                             ForEach(cards){ card in

                             SwiftUIView_17_cardview(card: card)
                              .padding(.horizontal,35)
                              .zIndex( check_index(card: card)! )
                              .offset(x:card_sub_view_present ? check_index_x(card: card)! : -300  , y: 50*check_index_y(card: card)!)
                              .animation(card_animation(card: card),value: card_sub_view_present)
                              .transition(AnyTransition.slide.combined(with: .move(edge: .leading)).combined(with: SwiftUI.AnyTransition.opacity))
                              .gesture(
                                TapGesture()
                                    .onEnded({ _ in
                                        withAnimation(.linear) {
                                            
                                            card_is_pressed.toggle()
                                            card_selected = card_is_pressed ? card : nil
                                        }
                                        
                                    })
//                                    .exclusively(before: LongPressGesture(minimumDuration: 0.05))
//                                    .sequenced(before: DragGesture())
//                                    .updating(self.$drag_state, body:{
//                                    (value,state,transaction) in
//                                        
//                                        switch value{
//                                            
//                                        case .first(_):
//                                            state = .pressing(index: Int( check_index(card: card)!) )
//                                        case .second(_, let drag):
//                                            state = .dragging(index: Int( check_index(card: card)!), translation: drag? .translation ?? .zero)
//                                        
//                                        default:
//                                            break
//                                        }
//                                    })
//                                    .onEnded({ value in
//                                       
//                                       
//                                        
//                                        
//                                    })
                                
                              )
                         }

                     }

                 }.position(x: geometry.size.width/2, y: geometry.size.height/6 )
                    .onAppear{
                        card_present = true

                        DispatchQueue.main.asyncAfter(deadline: .now()+0.5){
                            card_sub_view_present.toggle()
                        }

                    }
                
                if card_is_pressed{
              
                    transaction_history_view()
                    .transition(.move(edge: .bottom).combined(with:.opacity))
                    .animation(.easeInOut, value: card_is_pressed)
                    
                }
                
                Spacer()
            }
        }
      
    }
}
extension SwiftUIView_17{
    
    private func check_index(card:card_data_17_struct)->Double?{
        
        guard let index = cards.firstIndex(where: {$0.id == card.id} )
        else{
            return 0
        }
        if card_is_pressed{
            if card.id == card_selected!.id{
                return Double(cards.count-index)
            }
   
            
        }
         return Double( index )
     
    }
    private func check_index_y(card:card_data_17_struct)->CGFloat?{
        
        guard let index = cards.firstIndex(where: {$0.id == card.id} )
        else{
            return 0
        }
        if card_is_pressed{
            if card.id == card_selected!.id{
                return -CGFloat(Int(cards.count-index)/7)
            }
   
            
        }
         return CGFloat( index )
     
    }
    private func check_index_x(card:card_data_17_struct)->CGFloat?{
        
        guard let index = cards.firstIndex(where: {$0.id == card.id} )
        else{
            return 0
        }
        if card_is_pressed{
            if card.id == card_selected!.id{
                
            }else{
                return -300
            }
   
            
        }
        return 0
     
    }
    private func card_animation(card:card_data_17_struct)-> Animation{
        var delay_time:Double = 0.25
        
        if let index = check_index(card: card){
            delay_time =  (Double(cards.count) - index)*0.1
        }
        
        return Animation.spring(response: 0.2, dampingFraction: 0.8, blendDuration: 0.03).delay(delay_time)
    }
}


struct SwiftUIView_17_Previews: PreviewProvider {
    static var previews: some View {
        
            SwiftUIView_17()
            
    }
}
struct card_data_17_struct:Identifiable{
    var id = UUID()
    var card_name:String = ""
    var card_img:String = ""
    var card_number:Int = 0
    var card_expiry_date:String = "2020/07/13"
}
struct SwiftUIView_17_cardview:View{
    
    var card:card_data_17_struct
    
    var body:some View{
        
        Image(card.card_img)
            .resizable()
            .scaledToFit()
            .overlay (alignment: .bottomLeading) {
                
                VStack(alignment: .leading){
                    Text(String(card.card_number))
                        .bold()
                        .minimumScaleFactor(0.01)
                    
                    HStack{
                        
                        Text(card.card_name)
                            .bold()
                        Text("Valid Thru")
                            .font(.footnote)
                        Text(card.card_expiry_date)
                            .font(.footnote)
                    }
                    .minimumScaleFactor(0.01)
                }
                .foregroundColor(.white)
                .padding(.leading,25)
                .padding(.bottom,20)
            }.shadow(color: .gray, radius: 1, x: 1, y: 1)
                
            
    }
}


struct top_view_swiftui_17:View{
    
    var body: some View{
        
        HStack{
            Text("Wallet")
                .font(.system(.largeTitle,design: .rounded))
                .fontWeight(.heavy)
            Spacer()
            Image(systemName: "plus.circle.fill")
                .font(.system(.title))
        }
        .padding(.horizontal)
        .padding(.top,20)
    }
    
}

struct transaction_history_view:View{
    
    var body: some View{
        VStack{
            Text("Transaction History")
                .font(.system(.largeTitle,design: .rounded))
                .fontWeight(.heavy)

            ScrollView(.horizontal){
                HStack{
                    VStack(alignment: .center){
                       
                        Group{
                            Image(systemName: "moon.stars.fill")
                                .font(.system(.largeTitle,design: .rounded))
                            Text("moon toy")
                                .font(.system(.title3,design: .serif))
                                .fontWeight(.heavy)
                            Text("price")
                                .font(.system(.title,design: .serif))
                                .fontWeight(.heavy)
                            Text("$\(Int.random(in: 1...6)*10)")
                                .font(.system(.title3,design: .rounded))
                                .fontWeight(.heavy)
                        }.foregroundColor(.yellow)
                  
                    }
                    .padding(25)
                    .background(SwiftUI.Color.purple)
                    .cornerRadius(10)
                    
                    
                    VStack(alignment: .center){
                       
                        Group{
                            Image(systemName: "house.fill")
                                .font(.system(.largeTitle,design: .rounded))
                            Text("cleaning")
                                .font(.system(.title3,design: .serif))
                                .fontWeight(.heavy)
                            Text("price")
                                .font(.system(.title,design: .serif))
                                .fontWeight(.heavy)
                            Text("$\(Int.random(in: 1...5)*12)")
                                .font(.system(.title3,design: .rounded))
                                .fontWeight(.heavy)
                        }.foregroundColor(.yellow)
                  
                    }
                    .padding(25)
                    .background(SwiftUI.Color.purple)
                    .cornerRadius(10)
                }
               
            }.padding()
        }
    }

}
 
enum swiftui_17_drag_state{
    case inactive
    case pressing(index:Int? = nil)
    case dragging(index:Int? = nil,translation:CGSize)
    
    var index:Int?{
        
        switch self {
            
        case .pressing(let index), .dragging(let index,_):
            return index
        
        case .inactive:
            return nil
        
        }
    }
    
    var translation:CGSize{
        
        switch self {
            
        case .inactive,.pressing:
            return .zero
        case .dragging(_,let translation):
            return translation
        }
    }
    
    var is_pressing:Bool{
        
        switch self {
            
        case .pressing,.dragging:
            return true
        case .inactive:
            return false
        }
    }
    
    var is_dragging:Bool{
        
        switch self {
            
        case .inactive,.pressing:
            return false
        case .dragging:
            return true
        }
    }
}
