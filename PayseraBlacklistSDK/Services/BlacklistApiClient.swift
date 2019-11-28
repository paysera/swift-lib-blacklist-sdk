import Foundation
import Alamofire
import ObjectMapper
import PromiseKit
import PayseraCommonSDK

public class BlacklistApiClient: PSBaseApiClient {
    public func getUserRestrictions(filter: PSBaseFilter) -> Promise<PSMetadataAwareResponse<PSRestriction>> {
        return doRequest(requestRouter: BlacklistApiRequestRouter.getUserRestrictions(filter: filter))
    }
}
