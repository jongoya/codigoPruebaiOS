//
//  RESTServices.swift
//  sae
//
//  Created by Mac Mini 5 on 7/6/22.
//

import Foundation

class RESTServices: NSObject {
    let baseUrl: String = ""
    
    lazy var conn: URLSession = {
        let config = URLSessionConfiguration.ephemeral
        let session = URLSession(configuration: config, delegate: self, delegateQueue: nil)
        return session
    }()
    
    func getLineas(llamada: String, delegate: GetLineasDelegate) {
        let url: String = "\(baseUrl)\(llamada)"
        let request = NSMutableURLRequest(url: URL(string: url)!, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 60000)
        request.httpMethod = "GET"
        let task = conn.dataTask(with: request as URLRequest, completionHandler: { (data, _, error) -> Void in
            if error != nil {
                delegate.errorGettingLineas()
                return
            }
            
            if data != nil {
                let lineas: [Linea] = try! JSONDecoder().decode([Linea].self, from: data!)
                delegate.successGettingLineas(lineas: lineas)
            }
        })
        task.resume()
    }
}

extension RESTServices: URLSessionDelegate {
    func urlSession(_ session: URLSession, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
        if challenge.protectionSpace.authenticationMethod == NSURLAuthenticationMethodServerTrust {
            challenge.sender?.use(URLCredential.init(trust: challenge.protectionSpace.serverTrust!), for: challenge)
        }
        
        challenge.sender?.continueWithoutCredential(for: challenge)
    }
}
