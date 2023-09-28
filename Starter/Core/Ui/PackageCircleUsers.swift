//
//  PackageCircleUsers.swift
//  HaveBreak
//
//  Created by iMac on 1/4/23.
//

import Foundation
import SwiftUI
import SVGView

struct PackageStateView : View {
    
    let size:CGFloat
    let text:String
    
    var body: some View {
        
        ZStack{
            Circle()
                .fill(Color.purpleColor.opacity(0.8))
            VStack {
                Spacer()
                Text(text)
                    .font(Font.gloryVariable(with: 13))
                    .fontWeight(.semibold)
                    .foregroundColor(Color.white)
                Spacer()
            }
        }
        .frame(width: size,height:size)
    }
}

struct PackageCircleUsers : View {
    
    let size:CGFloat
    let maxAttendees:Int
    let numberAttendees:Int
    
    var body: some View {
        
        ZStack {
            Circle()
                .fill(Color.circleGray)
            SVGView(contentsOf: loadSvg(fileName: SvgsFiles.chair))
                .frame(width: size/3,height:size/3)
                .offset(y:-size/6.5)
            Text("\(numberAttendees)/\(maxAttendees)")
                .font(Font.gloryVariable(with: 15))
                .fontWeight(.medium)
                .foregroundColor(Color.darkGrayText)
                .offset(y:size/5)
            
        }
        .frame(width: size,height:size)
    }
}

struct PackageCircleUsers_Previews : PreviewProvider {
    
    static var previews: some View {
        ZStack {
            Color.red.ignoresSafeArea()
            PackageCircleUsers(size: 56,maxAttendees: 12,numberAttendees: 3)
        }
        
    }
}
