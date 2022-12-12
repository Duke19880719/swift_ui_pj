//
//  class1.swift
//  swift_ui_pj
//
//  Created by 江培瑋 on 2022/2/21.
//

import Foundation

class test{
    var name:String
    var score:Int
    
    init(name:String,score:Int){
        self.name = name
        self.score = score
    }
    
    func print_method(){
        print("\(name)'s score is \(score) ")
    }
    
}
