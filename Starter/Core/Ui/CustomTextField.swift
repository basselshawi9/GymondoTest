//
//  CustomTextField.swift
//  HaveBreak
//
//  Created by iMac on 1/11/23.
//

import Foundation
import SwiftUI

struct CustomTextField : View {
    
    var text:Binding<String>
    let hint:String
    var isSecure:Bool?
    var prefixView:(any View)?
    var lineHeight:CGFloat = 2
    
    var focusState:FocusState<FocusedField?>.Binding
    var focusType:FocusedField?=nil
    
    let valueChanged:(String)->()
    var valueSubmitted:((String)->())?
    
    var body: some View {

       VStack (spacing:8){
            HStack {
                isSecure == nil || isSecure == false ?
                TextField("", text: text)
                    .onChange(of: text.wrappedValue) {
                        newValue in
                        self.valueChanged(newValue)
                    }
                    .onSubmit {
                        if let _valueSubmitted = valueSubmitted {
                            _valueSubmitted(text.wrappedValue)
                        }
                    }
                    .focused(focusState, equals: focusType)
                    .font(TextModifier.weightToFont(fontWeight: .w500, fontSize:20))
                    .foregroundColor(.blackColor)
                    .placeholder(when: text.wrappedValue.isEmpty) {
                        Text(hint)
                            .foregroundColor(.lightGrayText)
                            .font(TextModifier.weightToFont(fontWeight: .w500, fontSize: 18))
                            
                    }
                    .eraseType()
                : SecureField("", text: text)
                    .focused(focusState, equals: focusType)
                    .onChange(of: text.wrappedValue) {
                        newValue in
                        self.valueChanged(newValue)
                    }
                    .onSubmit {
                        if let _valueSubmitted = valueSubmitted {
                            _valueSubmitted(text.wrappedValue)
                        }
                    }
                    .font(TextModifier.weightToFont(fontWeight: .w500, fontSize:20))
                    .foregroundColor(.blackColor)
                    .placeholder(when: text.wrappedValue.isEmpty) {
                        Text(hint)
                            .font(TextModifier.weightToFont(fontWeight: .w500, fontSize: 18))
                            .foregroundColor(.lightGrayText)
                    }.eraseType()
                if prefixView != nil {
                    Spacer()
                    prefixView!.eraseType()
                }
            }
                
            Line()
                .stroke(style: StrokeStyle(lineWidth: lineHeight))
                .foregroundColor(.purpleColor.opacity(0.7))
        }
        .frame(height:55~h)
            
    }
}


struct CustomTextFieldRectangle : View {
    
    var text:Binding<String>
    let hint:String
    var isSecure:Bool?
    var prefixView:(any View)?
    var lineHeight:CGFloat = 2
    
    var focusState:FocusState<FocusedField?>.Binding
    var focusType:FocusedField?=nil
    
    let valueChanged:(String)->()
    var valueSubmitted:((String)->())?
    
    var body: some View {

       ZStack{
           RoundedRectangle(cornerRadius: 20)
               .fill()
               .foregroundColor(.whiteColor)
           RoundedRectangle(cornerRadius: 20)
               .stroke(style: StrokeStyle(lineWidth: 1))
               .foregroundColor(.borderColor2.opacity(0.8))
           
            HStack {
                isSecure == nil || isSecure == false ?
                TextField("", text: text)
                    .onChange(of: text.wrappedValue) {
                        newValue in
                        self.valueChanged(newValue)
                    }
                    .onSubmit {
                        if let _valueSubmitted = valueSubmitted {
                            _valueSubmitted(text.wrappedValue)
                        }
                    }
                    .focused(focusState, equals: focusType)
                    .font(TextModifier.weightToFont(fontWeight: .w500, fontSize:20))
                    .foregroundColor(.darkGrayText2)
                    .placeholder(when: text.wrappedValue.isEmpty) {
                        Text(hint)
                            .foregroundColor(.lightGrayText)
                            .font(TextModifier.weightToFont(fontWeight: .w500, fontSize: 18))
                            
                    }
                    .eraseType()
                : SecureField("", text: text)
                    .focused(focusState, equals: focusType)
                    .onChange(of: text.wrappedValue) {
                        newValue in
                        self.valueChanged(newValue)
                    }
                    .onSubmit {
                        if let _valueSubmitted = valueSubmitted {
                            _valueSubmitted(text.wrappedValue)
                        }
                    }
                    .font(TextModifier.weightToFont(fontWeight: .w500, fontSize:20))
                    .foregroundColor(.darkGrayText2)
                    .placeholder(when: text.wrappedValue.isEmpty) {
                        Text(hint)
                            .font(TextModifier.weightToFont(fontWeight: .w500, fontSize: 18))
                            .foregroundColor(.lightGrayText)
                    }.eraseType()
                if prefixView != nil {
                    Spacer()
                    prefixView!.eraseType()
                }
            }
            .padding(.all,8)
          
        }
        .frame(height:55~h)
            
    }
}
