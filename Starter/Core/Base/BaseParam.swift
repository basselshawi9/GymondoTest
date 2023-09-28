//
//  BaseParam.swift
//  Bloc
//
//  Created by iMac on 10/22/22.
//

import Foundation

protocol BaseParam : Equatable{
    
    var jsonObject : Dictionary<String,Any>{get}
}

class PaginationParam: BaseParam {
    static func == (lhs: PaginationParam, rhs: PaginationParam) -> Bool {
        return lhs._filter == rhs._filter &&
        lhs._maxResultCount == rhs._maxResultCount &&
        lhs._skipCount == rhs._skipCount &&
        lhs._sorting == rhs._sorting
    }
    
    
    private let _filter:String
    private let _maxResultCount:Int
    private let _skipCount:Int
    private let _sorting:String
    
    init(filter:String="",maxResultCount:Int=12,skipCount:Int=0,sorting:String="") {
        _filter = filter
        _sorting = sorting
        _skipCount = skipCount
        _maxResultCount = maxResultCount
    }
    
    var jsonObject: Dictionary<String, Any> {
        get {
            if _sorting.isEmpty {
                return ["Filter":_filter,"MaxResultCount":_maxResultCount,"SkipCount":_skipCount]
            }
            else {
                return ["Filter":_filter,"MaxResultCount":_maxResultCount,"SkipCount":_skipCount,"Sorting":_sorting]
            }
        }
    }
}
