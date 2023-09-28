//
//  ModalProgress.swift
//  HaveBreak
//
//  Created by iMac on 1/25/23.
//

import SwiftUI

struct ModalProgress<Content: View>: View {
    
    @Binding var showProgress : Bool
    var darkModal:Bool?
    
    @ViewBuilder var content: () -> Content

    var body: some View {
        GeometryReader { proxy in
            ZStack (alignment:.bottom){
                content()
                    .zIndex(0)
                
                if darkModal != nil && darkModal! == true {
                    Color.blackColor.opacity(showProgress == true ? 0.4 : 0)
                        .frame(width:proxy.size.width,height:proxy.size.height)
                        .ignoresSafeArea()
                        .zIndex(1)
                }
                else {
                    Color.blackColor.opacity(showProgress == true ? 0.15 : 0)
                        .frame(width:proxy.size.width,height:proxy.size.height)
                        .ignoresSafeArea()
                        .zIndex(1)
                }
                if showProgress {
                    if darkModal != nil && darkModal! == true {
                        ZStack (alignment:.center){
                            LoadingView(size: CGSize(width:80,height:80))
                        }
                        .frame(width:proxy.size.width,height:proxy.size.height)
                        .transition(.move(edge: .bottom).combined(with: .opacity))
                        .zIndex(2)
                        .ignoresSafeArea()
                    }
                    else {
                        ZStack (alignment:.center){
                            Color.whiteColor2
                                .cornerRadius(20, corners: [.topLeft,.topRight])
                                .shadow(color:.blackColor.opacity(0.1), radius: 8,x:0,y:3)
                            LoadingView(size: CGSize(width:80,height:80))
                        }
                        .frame(width:proxy.size.width,height:proxy.size.height*0.4)
                        .transition(.move(edge: .bottom).combined(with: .opacity))
                        .zIndex(2)
                        .ignoresSafeArea()
                    }
                }
            }
        }
        .animation(.default.speed(0.7), value: showProgress)
        
    }
}

struct ModalProgress_Previews: PreviewProvider {
    
    @State static var showModal = true
    static var previews: some View {

        return ModalProgress (showProgress:$showModal){
            VStack {
                Text("asdf")
                CustomButton {
                    
                }
                Spacer()
            }
        }
    }
}
