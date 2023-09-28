//
//  APIService.swift
//  Bloc
//
//  Created by iMac on 10/22/22.
//

import Foundation
import Alamofire
import Combine
import UIKit

class APIService : NSObject,URLSessionDelegate{
    
    static let shared = APIService()
    
    var session : Session?
    
    private var cancelables : Set<AnyCancellable> = []
    
    private override init(){}
    
    func apiRequest<T : Decodable>(converter:T.Type,url:String,method:HTTPMethod,parameter:Parameters?,encoder:ParameterEncoding,headers:HTTPHeaders?)->Future<T,Error> {
        
        
        return Future<T,Error> { promise in
            let request = AF.request(url, method: method, parameters: parameter, encoding: encoder, headers: headers, interceptor: nil, requestModifier: nil)
            request.validate()
            request.responseDecodable(of: T.self) { (response) in
                switch response.result{
                case .failure(let Lerror):
                    
                    if let errorCode = Lerror.asAFError?.responseCode,errorCode == 403 {
                        if let restartNotifier : RestartAppNotifier = DependencyInjector.shared.getService() {
                            restartNotifier.restartPublisher.send(true)
                        }
                    }
                 
                    else if let code = response.response?.statusCode, code == 200 {
                        if let emptyModel = EmptyModel() as? T {
                            promise(.success(emptyModel))
                        }
                        else {
                            promise(.failure(CustomError(errorDescription: "Empty")))
                        }
                    }
                    else {
                        promise(.failure(Lerror))
                    }
                    break
                case .success(let dataObj):
                    promise(.success(dataObj))
                    break
                }
                
            }
        }
    }

}

