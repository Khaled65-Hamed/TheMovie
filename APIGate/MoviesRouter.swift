//
//  CharactersRouter.swift
//  TheMovie
//
//  Created by Khaled Hamed on 02/11/2024
//

import Foundation
import BusinessLayer

class MoviesRouter : BaseAPIRouter{
    
     init(method: HTTPMethod, path: String, bodyParams: JSONDICTIONARY? = nil, queryParams: JSONDICTIONARY? = nil, requestHeaders: [String : Any]? = nil) {
        
        let baseUrl = BaseUrl
        let headers = ["accept" : "application/json",
                       "Authorization" : "Bearer \(accessToken)"]
         super.init(baseURLString: baseUrl, method: method, path: path, queryParams: queryParams, requestHeaders: headers)
        
    }
}
