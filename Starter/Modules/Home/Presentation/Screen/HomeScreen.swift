//
//  HomeScreen.swift
//  HaveBreak
//
//  Created by iMac on 1/3/23.
//

import Foundation
import SwiftUI
import Combine



struct HomeScreen :  View {
    
    var viewModel : HomeViewModel! {
        if let _viewModel : HomeViewModel = ServiceLocator.shared.getService() {
            return _viewModel
        }
        else {
            return nil
        }
    }
    @State var number:Int?
    @StateObject var countryState = ViewModelState()
    
    var body : some View {
        
        VStack {
            
            if let _number = number {
                Text("\(_number)")
                    .style(fontWeight: .w400, fontSize: 20, textColor: .purpleColor)
                Spacer()
                    .frame(height:50)
            }
            Button {
                viewModel.addEvent(event: GetNumberEvent())
            }label: {
                Text("Add Counter")
            }
            Button {
                viewModel.addEvent(event: GetCountriesEvent())
            }label: {
                Text("Get Countries")
            }
            if let countrySuccessState = countryState.state as? GetCountriesSuccessState {
                ScrollView(.horizontal,showsIndicators: false) {
                    LazyHStack{
                        ForEach(countrySuccessState.model.data,id: \.name) { item in
                            Text(item.name)
                        }
                    }
                }
                .frame(width:320,height:80)
            }
            else if countryState.state is GetCountriesWaitingState {
                LoadingView(size: CGSize(width: 80, height: 80),tintColor: .purpleColor)
            }
            
        }
        .onViewDidLoad{
            bindViewModelToState()
        }
    }
    
    func bindViewModelToState() {
        viewModel.numberState.sink { state in
            if let successState = state as? GetNumberSuccessState {
                number = successState.model
            }
        }
        .store(in: &viewModel.cancelables)
        viewModel.countriesState.sink { state in
            countryState.state = state
        }
        .store(in: &viewModel.cancelables)
    }
}
