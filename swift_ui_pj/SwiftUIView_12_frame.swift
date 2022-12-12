//
//  SwiftUIView_12_frame.swift
//  swift_ui_pj
//
//  Created by 江培瑋 on 2022/3/7.
//

import SwiftUI

enum display_order:Int, CaseIterable{
    case Alphabetical = 0
    case ShowFavoriteFirst = 1
    case ShowCheckInFirst = 2
    
    var id: display_order { self }
    
    init(rawValue: Int) {
        switch rawValue{
        case 0: self = .Alphabetical
        case 1: self = .ShowFavoriteFirst
        case 2: self = .ShowCheckInFirst
        default:
            self = .Alphabetical
        }
    }
    
    var text:String {
        
        switch self {
            
        case .Alphabetical:         return "Alphabetical"
        case .ShowFavoriteFirst:    return "ShowFavoriteFirst"
        case .ShowCheckInFirst:     return "ShowCheckInFirst"
      
        }
    }
    
    func sort_method()->((restaurant_struct_1,restaurant_struct_1)->Bool){
        switch self {
        case .Alphabetical:
            return {$0.name < $1.name}
        case .ShowFavoriteFirst:
            return {$0.isFavorite &&  !$1.isFavorite}
        case .ShowCheckInFirst:
            return {$0.isCheckIn &&  !$1.isCheckIn}
        }
    }
}

class user_setting:ObservableObject {

    
    init(){
        UserDefaults.standard.register(defaults: ["user.display_order" : 0,
                                                  "user.Show_Check_in_Only" : false,
                                                  "user.max_price_level" : 5 ])
    }
    
    @Published var display_order_value:display_order = display_order(rawValue:UserDefaults.standard.integer(forKey:"user.display_order" )){
        didSet{
            UserDefaults.standard.set(display_order_value.rawValue, forKey: "user.display_order")
        }
    }
    
    @Published var ShowCheckinOnly:Bool = UserDefaults.standard.bool(forKey: "user.Show_Check_in_Only"){
        didSet{
            UserDefaults.standard.set(ShowCheckinOnly, forKey: "user.Show_Check_in_Only")
        }
    }
    
    @Published var PriceMaxLevel:Int = UserDefaults.standard.integer(forKey: "user.max_price_level"){
        didSet{
            UserDefaults.standard.set(PriceMaxLevel, forKey: "user.max_price_level")
        }
    }
}


struct SwiftUIView_12_frame: View {
    
    @State private var selected_order = display_order.Alphabetical
    @State var  check_toggle_value : Bool = false
    @State var price_max_level:Int = 5
    
    @EnvironmentObject var UserSetting : user_setting
    
    @Environment(\.presentationMode) var mode
    
    @State var check_onappear_picker:Bool = false
    
    var body: some View {
        NavigationView{
            Form{
                Section(header: Text("Sort Preference") ) {
                   
                    Picker(selection: $selected_order,label:  Text("Display Order")) {
                        
                        ForEach(display_order.allCases,id:\.self){index in
                            
                            Text(index.text)
                            
                            
                        }
                    }.onChange(of: selected_order) { newValue in
                        check_onappear_picker = true
                    }
                }
                
                Section(header: Text("Filter Preference") ) {
                    
                    Toggle(isOn: $check_toggle_value){
                        Text("Show Check-in Only")
                    }
                    Stepper {
                        
                        Text("Show \(String(repeating: "$", count: price_max_level))")
                    
                    } onIncrement: {
                        price_max_level += 1
                        
                
                        if price_max_level > 5{
                            price_max_level = 5
                        }
                    } onDecrement: {
                        price_max_level -= 1
                        
                        
                        if price_max_level < 1{
                            price_max_level = 1
                        }
                    }
                
                }
                
            }.navigationBarTitle("Settings")
                .toolbar {
                    ToolbarItem( placement: .navigationBarLeading) {
                        Button {
                            check_onappear_picker = false
                            self.mode.wrappedValue.dismiss()
                       } label: {
                           Text("Cancel").foregroundColor(.black)
                       }
                    }
                    
                    ToolbarItem( placement: .navigationBarTrailing) {
                        Button {
                            self.UserSetting.display_order_value = self.selected_order
                            self.UserSetting.ShowCheckinOnly = self.check_toggle_value
                            self.UserSetting.PriceMaxLevel = self.price_max_level
                            
                            check_onappear_picker = false
                            
                            self.mode.wrappedValue.dismiss()
                        } label: {
                            Text("Save").foregroundColor(.black)
                        }
                    }
                }
                .onAppear {
                    if check_onappear_picker == false{
                        self.selected_order = display_order(rawValue:UserDefaults.standard.integer(forKey:"user.display_order" ))
                    }
           
//                    bug : appear 刷掉字串
                    self.check_toggle_value = self.UserSetting.ShowCheckinOnly
                    self.price_max_level = self.UserSetting.PriceMaxLevel
                }

        }
    }
}

struct SwiftUIView_12_frame_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView_12_frame().environmentObject(user_setting())
    }
}
