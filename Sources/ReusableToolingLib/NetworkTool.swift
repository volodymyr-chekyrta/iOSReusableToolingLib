//
//  NetworkTool.swift
//
//
//  Created by Volodymyr Chekyrta on 10.07.24.
//

import Foundation
import Alamofire

public class NetworkTool {
    
    public init() {
        
    }
    
    public func sendRequest() async {
        // Automatic String to URL conversion, Swift concurrency support, and automatic retry.
        let response = await AF.request("https://httpbin.org/get", interceptor: .retryPolicy)
        // Automatic HTTP Basic Auth.
            .authenticate(username: "user", password: "pass")
        // Caching customization.
            .cacheResponse(using: .cache)
        // Redirect customization.
            .redirect(using: .follow)
        // Validate response code and Content-Type.
            .validate()
        // Produce a cURL command for the request.
            .cURLDescription { description in
                print(description)
            }
        // Automatic Decodable support with background parsing.
//            .serializingDecodable(DecodableType.self)
            .serializingString()
        // Await the full response with metrics and a parsed body.
            .response
        // Detailed response description for easy debugging.
        debugPrint(response)
    }
    
}
