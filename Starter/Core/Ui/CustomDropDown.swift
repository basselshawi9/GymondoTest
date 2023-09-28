//
//  CustomDropDown.swift
//  HaveBreak
//
//  Created by iMac on 1/11/23.
//

import Foundation
import SwiftUI

struct DropdownOption: Hashable {
    let key: String
    let value: String
    
    public static func == (lhs: DropdownOption, rhs: DropdownOption) -> Bool {
        return lhs.key == rhs.key
    }
}

struct DropdownSelector: View {
    @State private var shouldShowDropdown = false
    @State private var selectedOption: DropdownOption? = nil
    var placeholder: String
    var options: Binding<[DropdownOption]>
    var lineHeight:CGFloat = 2
    var height=160~h
    var showSearch = false
    var placeHolderTextOnly = false
    var onOptionSelected: ((_ option: DropdownOption) -> Void)?
    var searchValueChanged : ((String)->())? = nil
    var alignment=Alignment.bottom
    
    private let buttonHeight: CGFloat = 45
    
    var body: some View {
        
        return GeometryReader { proxy in
            VStack(spacing:0) {
                Button(action: {
                    self.shouldShowDropdown.toggle()
                }) {
                    HStack {
                        Text(selectedOption == nil || placeHolderTextOnly == true ? placeholder : selectedOption!.value)
                            .modifier(TextModifier(fontWeight: .w500, fontSize: 16, textColor: .blackColor))
                        /*.font(.system(size: 14))
                         .foregroundColor(selectedOption == nil ? Color.gray: Color.black)*/
                        
                        Spacer()
                        
                        Image(systemName: self.shouldShowDropdown ? "arrowtriangle.up.fill" : "arrowtriangle.down.fill")
                            .resizable()
                            .frame(width: 14~w, height: 12~w)
                            .font(Font.system(size: 9, weight: .medium))
                            .foregroundColor(Color.black)
                    }
                }
                
                .cornerRadius(5)
                .frame(width: proxy.size.width, height: self.buttonHeight)
                
                
                Line()
                    .stroke(style: StrokeStyle(lineWidth: lineHeight))
                    .foregroundColor(.purpleColor.opacity(0.7))
            }
        }
        .zIndex(9)
        .overlay (alignment:alignment){
            VStack {
                if self.shouldShowDropdown {
                    Spacer(minLength: buttonHeight + 10)
                    Dropdown(options: self.options,
                             height:height,
                             
                             onOptionSelected: { option in
                        shouldShowDropdown = false
                        selectedOption = option
                        self.onOptionSelected?(option)
                    },showSearch: showSearch,searchValueChanged: searchValueChanged)
                    
                }
            }
        }.zIndex(11)
            .frame(height:70~h)
        
    }
    
}

struct DropdownSelectorRounded: View {
    @State private var shouldShowDropdown = false
    @State private var selectedOption: DropdownOption? = nil
    var placeholder: String
    var options: Binding<[DropdownOption]>
    var lineHeight:CGFloat = 2
    var height=160~h
    var showSearch = false
    var onOptionSelected: ((_ option: DropdownOption) -> Void)?
    var searchValueChanged : ((String)->())? = nil
    
    private let buttonHeight: CGFloat = 26
    
    var body: some View {
        
        return GeometryReader { proxy in
            
                Button(action: {
                    self.shouldShowDropdown.toggle()
                }) {
                    VStack {
                        Spacer()
                        HStack (alignment:.center){
                            Text(selectedOption == nil ? placeholder : selectedOption!.value)
                                .modifier(TextModifier(fontWeight: .w500, fontSize: 15, textColor: .offWhite))
                            /*.font(.system(size: 14))
                             .foregroundColor(selectedOption == nil ? Color.gray: Color.black)*/
                            
                            Spacer()
                                .frame(width:12)
                            
                            Image(systemName: "chevron.down")
                                .frame(width: 14~w, height: 12~w)
                                .foregroundColor(Color.offWhite)
                        }
                        Spacer()
                    }
                    .padding(.horizontal,8)
                    .background(Color.purpleColor)
                    .cornerRadius(height/2)
                    .frame(width: 140~w, height: self.buttonHeight)
                }
            
        }
        .zIndex(9)
        .overlay (alignment:.top){
            VStack {
                if self.shouldShowDropdown {
                    Spacer(minLength: buttonHeight + 10)
                    Dropdown(options: self.options,
                             height:height,
                             
                             onOptionSelected: { option in
                        shouldShowDropdown = false
                        selectedOption = option
                        self.onOptionSelected?(option)
                    },showSearch: showSearch,searchValueChanged: searchValueChanged)
                    
                }
            }
        }.zIndex(11)
            .frame(height:70~h)
        
    }
    
}

struct Dropdown: View {
    var options: Binding<[DropdownOption]>
    let height:CGFloat
    var onOptionSelected: ((_ option: DropdownOption) -> Void)?
    var showSearch = false
    var searchValueChanged : ((String)->())? = nil
    
    @State private var search = ""
    
    @FocusState private var focusField: FocusedField?
    var body: some View {
        ZStack {
            Color.whiteColor
            ScrollView (showsIndicators: true){
                
                LazyVStack(alignment: .leading, spacing: 0) {
                    
                    if showSearch {
                        Group {
                            Spacer()
                                .frame(height:20~h)
                            CustomTextField(text:$search,hint: "Search",focusState:$focusField,focusType:.search) { val in
                                if let _searchValueChanged = searchValueChanged {
                                    _searchValueChanged(val)
                                }
                            }
                            .padding(.horizontal,20)
                        }
                    }
                    Spacer()
                        .frame(height:20~h)
                    ForEach(self.options, id: \.self) { option in
                        DropdownRow(option: option, onOptionSelected: self.onOptionSelected)
                    }
                    Spacer()
                        .frame(height:6~h)
                }
                
                
            }
        }
        .frame(height: height)
        .padding(.vertical, 5)
        .cornerRadius(12~w)
        .shadow(color:.purpleColor, radius: 4)
        
    }
}

struct DropdownRow: View {
    var option: Binding<DropdownOption>
    var onOptionSelected: ((_ option: DropdownOption) -> Void)?
    
    var body: some View {
        let tap = TapGesture()
            .onEnded { _ in
                
                if let onOptionSelected = self.onOptionSelected {
                    onOptionSelected(self.option.wrappedValue)
                }
            }
        return HStack {
            Text(self.option.wrappedValue.value)
                .modifier(TextModifier(fontWeight: .w500, fontSize: 16, textColor: .blackColor))
            Spacer()
        }
        .gesture(tap)
        .padding(.horizontal, 16)
        .padding(.vertical, 5)
        
    }
}

/*struct DropdownSelector_Previews: PreviewProvider {
 
 static let options: [DropdownOption] = [
 DropdownOption(key: uniqueKey(), value: "Sunday"),
 DropdownOption(key: uniqueKey(), value: "Monday"),
 DropdownOption(key: uniqueKey(), value: "Tuesday"),
 DropdownOption(key: uniqueKey(), value: "Wednesday"),
 DropdownOption(key: uniqueKey(), value: "Thursday"),
 DropdownOption(key: uniqueKey(), value: "Friday"),
 DropdownOption(key: uniqueKey(), value: "Saturday")
 ]
 
 
 static var previews: some View {
 
 DropdownSelector(
 placeholder: "Day of the week",
 options: options,
 onOptionSelected: { option in
 print(option)
 })
 .padding(.horizontal)
 
 }
 }
 */
