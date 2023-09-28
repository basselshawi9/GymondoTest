//
//  CustomErrorView.swift
//  HaveBreak
//
//  Created by iMac on 2/6/23.
//

import SwiftUI

struct CustomErrorView: View {
    
    let text:String
    let callBackPressed:()->()
    
    var body: some View {
        Button {
           callBackPressed()
       } label: {
           HStack {
               Text("\(text), ")
                   .style(fontWeight: .w400, fontSize: 16, textColor: .purpleColor)
               +
               Text("Retry?")
                   .style(fontWeight: .w600, fontSize: 18, textColor: .purpleColor)
               Spacer()
           }
           .padding(.horizontal,20)
       }
    }
}
