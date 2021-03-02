import Alamofire
import Foundation
import PayseraCommonSDK

public enum BlacklistApiRequestRouter: URLRequestConvertible {
    // MARK: - GET
    case getUserRestrictions(filter: PSBaseFilter)

    // MARK: - Declarations
    static let baseURL = URL(string: "https://blacklist.paysera.com")!
    
    private var method: HTTPMethod {
        switch self {
        case .getUserRestrictions:
            return .get
        }
    }
    
    private var path: String {
        switch self {
        case .getUserRestrictions:
            return "/restriction/rest/v1/restrictions"
        }
    }
    
    private var parameters: Parameters? {
        switch self {
        case .getUserRestrictions(let filter):
            return filter.toJSON()
        }
    }
    
    // MARK: - Method
    public func asURLRequest() throws -> URLRequest {
        let url = Self.baseURL.appendingPathComponent(path)
        var urlRequest = URLRequest(url: url)
        urlRequest.method = method
        urlRequest = try URLEncoding.default.encode(urlRequest, with: parameters)
        return urlRequest
    }
}
