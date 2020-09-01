import Foundation
import Alamofire
import PayseraCommonSDK

public enum BlacklistApiRequestRouter: URLRequestConvertible {
    // MARK: - GET
    case getUserRestrictions(filter: PSBaseFilter)

    // MARK: - Declarations
    static var baseURLString = "https://blacklist.paysera.com"
    
    private var method: HTTPMethod {
        switch self {
        case .getUserRestrictions( _):
            return .get
        }
    }
    
    private var path: String {
        switch self {
        case .getUserRestrictions( _):
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
        let url = try! BlacklistApiRequestRouter.baseURLString.asURL()
        
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        urlRequest.httpMethod = method.rawValue

        switch self {
        case (_) where method == .get:
            urlRequest = try URLEncoding.default.encode(urlRequest, with: parameters)
            
        default:
            break
        }

        return urlRequest
    }
}
