//
//  CheckboxFilterStyle.swift
//  HaveBreak
//
//  Created by iMac on 9/9/23.
//

import Foundation
import SwiftUI

struct CheckboxFilterStyleToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        
        Button(action: {
            
            configuration.isOn.toggle()
            
        }, label: {
            HStack {
                if configuration.isOn {
                    ZStack {
                        RoundedRectangle(cornerRadius: 4)
                            .fill(Color.purpleColor)
                        
                        Image(systemName: "checkmark")
                            .foregroundColor(Color.whiteColor)
                            .scaleEffect(x:0.6,y:0.6)
                        
                    }
                    .frame(width:20,height:20)
                }
                else {
                    RoundedRectangle(cornerRadius: 4)
                        .stroke(Color.purpleColor)
                        .frame(width:20,height:20)
                }
                configuration.label
            }
        })
    }
}
