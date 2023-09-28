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
        let indicator = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        indicator.startAnimating()
        indicator.color = UIColor.systemBlue
        return indicator
    }()
    
    lazy var errorView : UILabel = {
        
        let errorLabel = UILabel()
        errorLabel.text = "Error Getting this variant, Retry?"
        errorLabel.textColor = UIColor.systemBlue
        errorLabel.font = UIFont(name: "Glory-Regular", size: 18)
        errorLabel.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self , action: #selector(ExerciseListItemIdLoader.handleErrorLabelTapped))
        errorLabel.addGestureRecognizer(tapGesture)
        return errorLabel
        
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
                self.viewWithTag(2)?.removeFromSuperview()
                
                let exerciseItemView = ExerciseListItemView(model: successState.model) {
                    self.itemPressed(successState.model)
                }
                if let exerciseItemViewUIKitWrapper = UIHostingController(rootView: exerciseItemView).view {
                    exerciseItemViewUIKitWrapper.tag = 2
                    self.addSubview(exerciseItemViewUIKitWrapper)
                    exerciseItemViewUIKitWrapper.snp.makeConstraints { make in
                        make.top.equalToSuperview()
                        make.left.equalToSuperview()
                        make.right.equalToSuperview()
                        make.bottom.equalToSuperview()
                    }
                }
                
            }
            
        }.store(in: &viewModel.cancelables)
    }
    
    @objc func handleErrorLabelTapped() {
        self.viewModel.addEvent(event: GetExerciseByIdEvent(param: GetExerciseByIdParam(id: self.exerciseId)))
    }
}

struct ExerciseListItemIdLoaderSwiftUIWrapper: UIViewRepresentable {
    
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
