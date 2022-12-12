//
//  SwiftUIView_16_data_struct.swift
//  swift_ui_pj
//
//  Created by 江培瑋 on 2022/4/11.
//

import Foundation
import UIKit

struct Trip {
    var destination: String
    var image: String
}

var trips = [ Trip(destination: "Yosemite, USA", image: "yosemite-usa"),
              Trip(destination: "Venice, Italy", image: "venice-italy"),
              Trip(destination: "Hong Kong", image: "hong-kong"),
              Trip(destination: "Barcelona, Spain", image: "barcelona-spain"),
              Trip(destination: "Braies, Italy", image: "braies-italy"),
              Trip(destination: "Kanangra, Australia", image: "kanangra-australia"),
              Trip(destination: "Mount Currie, Canada", image: "mount-currie-canada"),
              Trip(destination: "Ohrid, Macedonia", image: "ohrid-macedonia"),
              Trip(destination: "Oia, Greece", image: "oia-greece"),
              Trip(destination: "Palawan, Philippines", image: "palawan-philippines"),
              Trip(destination: "Salerno, Italy", image: "salerno-italy"),
              Trip(destination: "Tokyo, Japan", image: "tokyo-japan"),
              Trip(destination: "West Vancouver, Canada", image: "west-vancouver-canada"),
              Trip(destination: "Singapore", image: "garden-by-bay-singapore"),
              Trip(destination: "Perhentian Islands, Malaysia", image: "perhentian-islands-malaysia")
            ]

enum cardview_drag_state{
    case inactive
    case pressing
    case dragging( translation:CGSize)
    
    var translation: CGSize{
        
        switch self {
        case .inactive,.pressing:
            return .zero
       
        case .dragging(let  translation):
            return translation
        }
    }
    
    var is_dragging:Bool{
        switch self {
  
        case .pressing,.inactive:
            return false
        case .dragging:
            return true
        }
    }
    
    var is_pressing:Bool{
        switch self {

        case .pressing:
            return true
        case .dragging,.inactive:
            return false
        }
    }
    
}



