//
//  SwiftUIView_13.1.swift
//  swift_ui_pj
//
//  Created by 江培瑋 on 2022/4/4.
//
//SwiftUI 中的 @ViewBuilder 系統在任何給定的視圖容器中都限制為 10 個視圖。沒有關於第 11  個視圖，所以出現錯誤。



import SwiftUI
import Combine


struct SwiftUIView_13_1: View {
  
  @State var user_name:String = ""
  @State var user_password:String = ""
  @State var confirm_password:String = ""
  @StateObject var check_valid = check_invalid_model()
    
    var body: some View {
        
        GeometryReader{ geometry in
            VStack{
                Text("Create An Account")
                    .font(.title)
                    .bold()
                    .shadow(color: Color(UIColor.systemGray), radius: 1, x: 2, y: 2)
                
                VStack(alignment: .leading){
                    
                    input_field(binding_value: $check_valid.user_name, check_textfield_value: true, display_string: "User Name")
                    
                    waring_view(icon_name:  "lock.open", waring_string:  "A minimum of 4 characters", check_strikethrough: check_valid.user_name_length_valid,color_value: check_valid.user_name_length_valid ? Color.green :  Color( red: 251/255, green: 128/255, blue: 128/255))
                    
                    input_field(binding_value: $check_valid.password, check_textfield_value: false, display_string: "Password")
                    
                    waring_view(icon_name: "lock.open", waring_string: "A minimum of 8 characters", check_strikethrough: check_valid.user_password_length_valid,color_value: check_valid.user_password_length_valid ? Color.green :  Color( red: 251/255, green: 128/255, blue: 128/255))
        
                    waring_view(icon_name: "x.square", waring_string: "One uppercase letter", check_strikethrough: check_valid.password_uppercase,color_value: check_valid.password_uppercase ? Color.green :  Color( red: 251/255, green: 128/255, blue: 128/255))
      
                    input_field(binding_value: $check_valid.confirm_password, check_textfield_value: false, display_string: "Confirm Password")
                    
                    waring_view(icon_name: "x.square", waring_string: "Your confirm password should be the same as password", check_strikethrough: check_valid.confirm_password_valid,color_value: check_valid.confirm_password_valid ? Color.green :  Color( red: 251/255, green: 128/255, blue: 128/255))
                }
                
                Button {
                
                    
                   
                } label: {
                    Text("Sign Up")
                        .font(.system(.body, design: .rounded))
                        .foregroundColor(.white)
                        .bold()
                        .padding()
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .background(LinearGradient(gradient: Gradient(colors: [Color(red: 251/255, green: 128/255, blue: 128/255),Color(red: 253/255, green: 193/255, blue: 104/255)]), startPoint: .leading, endPoint: .trailing))
                        .cornerRadius(25)
                        .padding(.horizontal)
                        
                }.padding()

                
            }.position(x: geometry.size.width/2, y: geometry.size.height/2 )
        }
    
    }
}

struct input_field : View{
    
   @Binding var binding_value:String
    
    var check_textfield_value:Bool
   
    var display_string:String = ""
    
    var body: some View{
        
        if check_textfield_value == true{
            
            TextField(display_string,text: $binding_value)
                .font(.system(size: 20, weight: .semibold, design: .rounded))
                .foregroundColor(Color(.systemGray))
                .padding(.horizontal).padding(.top,20)
        }else{
            
            SecureField(display_string,text: $binding_value )
                .font(.system(size: 20, weight: .semibold, design: .rounded))
                .padding(.horizontal).padding(.top,20)
        }
        
        Divider().frame( height: 1).padding(.horizontal)
            .background(Color(.systemGray3))
            .padding(.horizontal)
    
    }
    
}

struct waring_view: View {
    
    var icon_name:String?
    var waring_string:String?
    var check_strikethrough:Bool?
    var color_value:Color?
    
    var body: some View {
        HStack{
            
            Image(systemName: icon_name!).padding(.leading)
                .foregroundColor(color_value)
            
            Text(waring_string!)
                .font(.system(.body, design: .rounded))
                .foregroundColor(color_value)
                .strikethrough(check_strikethrough!)
        
        }.padding(.top,10).padding(.trailing)
    }
}

class check_invalid_model: ObservableObject{
    
    @Published var user_name = ""
    @Published var password = ""
    @Published var confirm_password = ""
    
    @Published var user_name_length_valid = false
    @Published var user_password_length_valid = false
    @Published var password_uppercase = false
    @Published var confirm_password_valid = false
    
    private var cancel_set : Set<AnyCancellable> = []
    
    init(){
        $user_name
            .receive(on: RunLoop.main)
            .map{ value in
                return value.count >= 4
            }
            .assign(to: \.user_name_length_valid, on: self)
            .store(in: &cancel_set)
        
        $password
            .receive(on: RunLoop.main)
            .map{ value in
                return value.count >= 8
            }
            .assign(to: \.user_password_length_valid, on: self)
            .store(in: &cancel_set)
        
        $password
            .receive(on: RunLoop.main)
            .map{ value in
                
                let pattern = "[A-Z]"
                
                if let _ = value.range(of: pattern,options: .regularExpression){
                    return true
                }else{
                    return false
                }
                  
            }
            .assign(to: \.password_uppercase, on: self)
            .store(in: &cancel_set)
        
        Publishers.CombineLatest($password, $confirm_password)
            .receive(on: RunLoop.main)
            .map{
                (password_value,confirm_password_value) in
                return (password_value == confirm_password_value) && (!confirm_password_value.isEmpty)
            }
            .assign(to: \.confirm_password_valid, on: self)
            .store(in: &cancel_set)
            
        
    }
}

struct SwiftUIView_13_1_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView_13_1()
    }
}

