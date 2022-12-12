//
//  SwiftUIView_16.swift
//  swift_ui_pj
//
//  Created by 江培瑋 on 2022/4/9.
//

import SwiftUI

var cardviews:[SwiftUIView_16_cardview] = {
    
//    var views = [SwiftUIView_16_cardview]()
    var views :[SwiftUIView_16_cardview] = []
    for item in (0...1){
        
        views.append(SwiftUIView_16_cardview(image: trips[item].image, title: trips[item].destination))
    }
    
    return views
}()

struct SwiftUIView_16: View {
    
    @GestureState var drag_state = cardview_drag_state.inactive
    
    var drag_limit:CGFloat = 100
    
    @State var check_card_index = 1
    
    @State private var remove_transition = AnyTransition.cross_animation
    
    var body: some View {
        VStack{
            Spacer(minLength: 10)
            top_view()
            Spacer(minLength: 15)
            
            ZStack{
                ForEach(cardviews){
                    cardview in

                    cardview
                        .zIndex(check_card_view_top(cardview: cardview) ? 1 : 0)
                        .offset(x:check_card_view_top(cardview: cardview) ? drag_state.translation.width : 0, y: check_card_view_top(cardview: cardview) ? drag_state.translation.height : 0)
                        .scaleEffect(drag_state.is_dragging ? 0.75 : 1)
                        .rotationEffect(Angle(degrees: check_card_view_top(cardview: cardview) ? Double(drag_state.translation.width/7) : 0))
                        .animation(.interpolatingSpring(stiffness: 180, damping: 50))
                        .transition(remove_transition)
                        .gesture(
                            LongPressGesture(minimumDuration: 0.01) .sequenced(before: DragGesture())
                                .updating(self.$drag_state, body: { value, state, translation in
                                    
                                    switch value{
                                    case .first:
                                        state = .pressing
                                        
                                    case .second(true,let drag):
                                        state = .dragging(translation: drag? .translation ?? .zero)
                                    default:
                                        break
                                    }
                                })
                                .onChanged({ value in
                                    guard case .second(true,let drag?) = value else{
                                        return
                                    }
                                    
                                    if (drag.translation.width < -drag_limit){
                                        remove_transition = .cross_animation
                                        
                                    }
                                    if (drag.translation.width > drag_limit){
                                        remove_transition = .heart_animation
                                    }
                                })
                                .onEnded({ value in
                                    guard case .second(true,let drag?) = value else{
                                        return
                                    }
                                    
                                    if (drag.translation.width < -drag_limit) || (drag.translation.width > drag_limit){
                                        remove_card()
                                    }
                                })
                                

                        )
                        .overlay {
                            ZStack{
                                Image(systemName: "x.circle")
                                    .foregroundColor(SwiftUI.Color.white)
                                    .font(.system(size: 80))
                                    .opacity(
                                        ((drag_state.translation.width < -drag_limit) && check_card_view_top(cardview: cardview)) ? 1 : 0
                                    )
                                
                                Image(systemName: "heart.circle")
                                    .foregroundColor(SwiftUI.Color.white)
                                    .font(.system(size: 80))
                                    .opacity(
                                        ((drag_state.translation.width > drag_limit) && check_card_view_top(cardview: cardview)) ? 1 : 0
                                    )
                            }
                        }
                       
                }
            }
            
            bottom_view()
                .opacity(drag_state.is_dragging ? 0 : 1)
                .animation(.linear)
            
        }.edgesIgnoringSafeArea(.all)
    }
}

extension SwiftUIView_16{
    
  private func check_card_view_top(cardview:SwiftUIView_16_cardview) -> Bool{

      //       比較兩個uuid 大小，相同 則為０
        guard let index = cardviews.firstIndex(where: {
           $0.id == cardview.id
       })else{
               return false
       }
//       print("\(index)")
        return index == 0
       
   }
    
    private func remove_card(){
        
        cardviews.removeFirst()
        
        check_card_index += 1
        
        let trip_item = trips[check_card_index % trips.count]
        
        cardviews.append(SwiftUIView_16_cardview( image: trip_item.image, title: trip_item.destination))
    }
    
}

extension AnyTransition{
    static var cross_animation:AnyTransition{
        AnyTransition.asymmetric(insertion: .identity, removal: AnyTransition.move(edge: .trailing)).combined(with: .move(edge: .bottom))
    }
    
    static var heart_animation:AnyTransition{
        AnyTransition.asymmetric(insertion: .identity, removal: AnyTransition.move(edge: .leading)).combined(with: .move(edge: .bottom))
    }
}

struct SwiftUIView_16_Previews: PreviewProvider {
    
    static var previews: some View {

            SwiftUIView_16()
      
    }
}
