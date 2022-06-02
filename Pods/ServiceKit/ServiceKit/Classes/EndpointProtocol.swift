//
//  EndpointProtocol.swift
//  ServiceKit
//
//  Created by Failyn Kaye Sedik on 5/25/22.
//

import Foundation

public enum EndpointRequestMethod: String {
	case get = "GET"
	case post = "POST"
}

public protocol EndpointProtocol {
	var host: String { get }
	var path: String { get }
	var httpMethod: EndpointRequestMethod { get }
	var parameters: [String: Any] { get }
	var headers: [String: String]? { get }
}

extension EndpointProtocol {
	public var urlComponents: URLComponents {
		var components = URLComponents()
		components.scheme = "https"
		components.host = host
		components.path = path
		
		components.queryItems = parameters.map({ (key: String, value: Any) in
			URLQueryItem(name: key, value: "\(value)")
		})
		
		return components
	}
	
	public var request: URLRequest {
		guard let url = urlComponents.url else {
			preconditionFailure("Invalid URL components: \(urlComponents)")
		}
		
		var request = URLRequest(url: url)
		request.httpMethod = httpMethod.rawValue
		
		headers?.forEach({ (key: String, value: String) in
			request.setValue(value, forHTTPHeaderField: key)
		})
		
		return request
	}
	
	public var headers: [String: String]? {
		return nil
	}
}
