//
//  SearchView.swift
//  HaveBreak
//
//  Created by iMac on 2/8/23.
//

import SwiftUI

struct SearchView: View {
    
    @State private var isSearching = false
    var width:CGFloat?
    let searchValChanged:(String)->()
    
    @FocusState private var focusField: FocusedField?
    
    @State private var search = ""
    
    var body: some View {
        
        HStack {
            if isSearching == false {
                (Button {
                    withAnimation(.default.speed(1)) {
                        isSearching = true
                    }
                }label: {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.purpleColor)
                        .frame(width:30~w,height:30~h)
                })
                
                .opacity(isSearching == true ? 0 : 1)
            
            }
            else {
                CustomTextField(text:$search,hint: "Search",prefixView: Button {
                    isSearching = false
                }label: {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.purpleColor)
                        .frame(width:30~w,height:30~h)
                },focusState: $focusField,focusType: .search, valueChanged: {
                    value in
                    
                }, valueSubmitted: { value in
                    withAnimation(.default.speed(1)) {
                        searchValChanged(value)
                        isSearching=false
                    }
                }
                )
                .frame(width:width ?? UIScreen.main.bounds.width/2)
                .opacity(isSearching == true ? 1 : 0)
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView {
            val in
        }
    }
}
