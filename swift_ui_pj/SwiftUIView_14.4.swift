//
//  SwiftUIView_14.4.swift
//  swift_ui_pj
//
//  Created by 江培瑋 on 2022/3/23.
//

import SwiftUI

struct SwiftUIView_14_4: View {
    
    @GestureState var check_click = false
    @GestureState var check_drag = CGSize.zero
    @State var pos = CGSize.zero
    
    @State var image_check:Bool = false
    @GestureState var long_press_click = false
    @State var image_string:String = "moon.zzz"
    @GestureState var check_drag_1 = CGSize.zero
    @State var pos_1 = CGSize.zero
    var body: some View {
        VStack{
            Image(systemName: "star.circle.fill")
                  .font(.system(size: 160))
                  .offset(x:pos.width + check_drag.width, y:pos.height + check_drag.height)
                  .opacity(check_click ? 0.5 : 1)
                  .animation(SwiftUI.Animation.easeInOut(duration: 1),value: check_click)
                  .foregroundColor(check_click ?  .pink  : SwiftUI.Color.orange)
                  .gesture(
                    LongPressGesture(minimumDuration: 1).updating($check_click, body: { (currenState, state, transaction)in
                        state = currenState
                    }).sequenced(before: DragGesture())
                        .updating($check_drag, body: { (currenState, state, transaction) in
                            print("\(currenState)\n")
                            
                            switch currenState{
                            case .first(true):
                                print("long press gesture")
                            case .second(true, let drag_value):
                                state = drag_value?.translation ?? .zero
                            
                            default:
                                break
                            }
                        }).onEnded({ value in
                            
                            guard case .second(true, let drag_value) = value else{
                                return
                            }
                            pos.width += drag_value!.translation.width
                            pos.height += drag_value!.translation.height
                    })
                  )
            
            
            Image(systemName: image_string)
                  .font(.system(size: 160))
                  .offset(x:pos_1.width + check_drag_1.width, y:pos_1.height + check_drag_1.height)
                  .scaleEffect(long_press_click ? 0.3 : 1)
                  .animation(SwiftUI.Animation.easeInOut(duration: 1),value: long_press_click)
                  .foregroundColor(  image_check ?  .green  : SwiftUI.Color.blue)
                  .gesture(
                    TapGesture()
                        .onEnded({ _ in
                            withAnimation {
                                if image_string=="moon.zzz"{
                                    image_string = "moon.stars"
                                }else{
                                    image_string = "moon.zzz"
                                }
                            }
                        }).exclusively(before: LongPressGesture(minimumDuration: 1)
                            .updating($long_press_click, body: { (currenState, state, transaction)in
                                state = currenState
                            })
                                .sequenced(before: DragGesture())
                                    .updating($check_drag_1, body: { (currenState, state, transaction) in
                                        print("\(currenState)\n")
                                        switch currenState{
                                        case .first(true):
                                            print("long press gesture")
                                        case .second(true, let drag_value):
                                            state = drag_value?.translation ?? .zero
                                        default:
                                            break
                                        }
                                    }).onEnded({ value in
                                        guard case .second(true, let drag_value) = value else{
                                            return
                                        }
                                        pos_1.width += drag_value!.translation.width
                                        pos_1.height += drag_value!.translation.height
                                })
                        )
                  ).simultaneousGesture(
                    TapGesture().onEnded({ _ in
                        image_check.toggle()
                    })
                  
                  
                  )
        }
       
    }
}

struct SwiftUIView_14_4_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView_14_4()
    }
}
