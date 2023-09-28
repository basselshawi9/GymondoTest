//
//  ExerciseListItemIdLoader.swift
//  Starter
//
//  Created by iMac on 9/27/23.
//

import Foundation
import UIKit
import SnapKit
import SwiftUI

class ExerciseListItemIdLoader : UIView {
    
    let exerciseId : Int
    let itemPressed:(ExerciseModel)->()
    
    let viewModel = ExerciseViewModel()
    
    lazy var loadingView : UIView = {
        UIHostingController(rootView: LoadingView(size: CGSize(width: 40, height: 40))).view
    }()
    
    lazy var errorView : UIView = {
        UIHostingController(rootView: CustomErrorView(text: "Error Getting this variant", callBackPressed: {
            self.viewModel.addEvent(event: GetExerciseByIdEvent(param: GetExerciseByIdParam(id: self.exerciseId)))
        })).view
    }()
    
    init(exerciseId:Int,itemPressed: @escaping (ExerciseModel)->()) {
        self.exerciseId = exerciseId
        self.itemPressed = itemPressed
        super.init(frame: CGRect.zero)
        addSubview(loadingView)
        addSubview(errorView)
        errorView.isHidden = true
        
        listenToViewModel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        loadingView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalTo(40)
            make.height.equalTo(40)
        }
        errorView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(32)
            make.trailing.equalToSuperview().offset(-32)
            make.height.equalTo(80)
            make.centerY.equalToSuperview()
        }
    }
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        viewModel.addEvent(event: GetExerciseByIdEvent(param: GetExerciseByIdParam(id: exerciseId)))
    }
    
    func listenToViewModel() {
        
        viewModel.exerciseByIdState.sink { state in
            
            if let _ = state as? ExerciseWaitingState {
                self.loadingView.isHidden = false
                self.errorView.isHidden = true
            }
            else if let _ = state as? ExerciseFailureState {
                self.loadingView.isHidden = true
                self.errorView.isHidden = false
            }
            else if let successState = state as? GetExerciseByIdSuccessState {
                
                self.loadingView.isHidden = true
                self.errorView.isHidden = true
                
                let exerciseItemView = ExerciseListItemView(model: successState.model) {
                    self.itemPressed(successState.model)
                }
                if let exerciseItemViewWrapper = UIHostingController(rootView: exerciseItemView).view {
                    self.addSubview(exerciseItemViewWrapper)
                    exerciseItemViewWrapper.snp.makeConstraints { make in
                        make.top.equalToSuperview()
                        make.left.equalToSuperview()
                        make.right.equalToSuperview()
                        make.bottom.equalToSuperview()
                    }
                }
                
            }
            
        }.store(in: &viewModel.cancelables)
    }
}

struct ExerciseListItemIdLoaderSwiftUI: UIViewRepresentable {
    
    let exerciseId : Int
    let itemPressed:(ExerciseModel)->()
    
    func makeUIView(context: Context) -> UIView {
        ExerciseListItemIdLoader(exerciseId: exerciseId) { model in
            itemPressed(model)
        }
    }
    
    func updateUIView(_ activityIndicator: UIView, context: Context) {
        
    }
}
