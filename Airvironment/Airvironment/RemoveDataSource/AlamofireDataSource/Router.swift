//
//  Router.swift
//  Airvironment
//
//  Created by Letnja Praksa 8 on 22.7.21..
//
import Foundation
import Alamofire

struct Router {
    
    public static var baseUrl: URL = URL(string: "https://airvironment.live")!
    
    enum Weather: URLRequestConvertible {
        case getWeather
        case getCurrentWeather
        
        var resource: String {
            switch self {
            case .getWeather: return "/api/measurements"
            case .getCurrentWeather: return "/api/measurements/latest"
            }
        }
        
        var method: HTTPMethod {
            switch self {
            case .getWeather: return .get
            case .getCurrentWeather: return .get
            }
        }
        
        var path: String {
            switch self {
            case .getWeather: return resource
            case .getCurrentWeather: return resource
                
                
            }
        }
        
        func asURLRequest() throws -> URLRequest {
            var request = URLRequest(url: baseUrl.appendingPathComponent(path))
            request.method = method
            
            switch self {
            case .getWeather:
                break
            case .getCurrentWeather:
                break
            }
            
            return request
        }
    }
}


