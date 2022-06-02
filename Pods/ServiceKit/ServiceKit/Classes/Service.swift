//
//  Service.swift
//  ServiceKit
//
//  Created by Failyn Kaye Sedik on 5/25/22.
//

import Foundation

public class Service {
	public let endpoint: EndpointProtocol
	
	public init(endpoint: EndpointProtocol) {
		self.endpoint = endpoint
	}
	
	public func request<T: Codable>(responseType type: T.Type) async -> Result<T, Error> {
		switch endpoint.httpMethod {
		case .get: return await URLSession.shared.requestGet(endpoint: endpoint, type: type)
		case .post: return await URLSession.shared.requestPost(endpoint: endpoint, type: type)
		}
	}
}

extension URLSession {
	fileprivate func requestGet<T: Codable>(endpoint: EndpointProtocol, type: T.Type) async -> Result<T, Error> {
		do {
			let (data, _) = try await data(for: endpoint.request)
			
#if DEBUG
			jsonToString(data: data)
#endif
			
			// TODO: Consider handling status code at this stage
			
			let result = try JSONDecoder().decode(type, from: data)
			return .success(result)
		} catch {
			return .failure(error)
		}
	}
	
	fileprivate func requestPost<T: Codable>(endpoint: EndpointProtocol, type: T.Type) async -> Result<T, Error> {
		// TODO: Change to post request
		
		// This is placeholder code. This is for GET request.
		do {
			let (data, _) = try await data(for: endpoint.request)
			let result = try JSONDecoder().decode(type, from: data)
			return .success(result)
		} catch {
			return .failure(error)
		}
	}
	
	// TODO: Create custom logger
	fileprivate func jsonToString(data: Data) {
		print(String(data: data, encoding: .utf8) ?? "N/A")
	}
}
