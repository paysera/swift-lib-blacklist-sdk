import PayseraCommonSDK
import PromiseKit

public class BlacklistApiClient: PSBaseApiClient {
    public func getUserRestrictions(
        filter: PSBaseFilter
    ) -> Promise<PSMetadataAwareResponse<PSRestriction>> {
        doRequest(requestRouter: BlacklistApiRequestRouter.getUserRestrictions(filter: filter))
    }
}
