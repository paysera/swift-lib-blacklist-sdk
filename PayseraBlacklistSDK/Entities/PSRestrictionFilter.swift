import Foundation
import PayseraCommonSDK
import ObjectMapper

public class PSRestrictionFilter: PSBaseFilter {
    public var statuses: [String]?
    public var hidden: String?
    public var userId: Int?

    override open func mapping(map: Map) {
        super.mapping(map: map)
        
        statuses            <- map["statuses"]
        hidden              <- map["hidden"]
        userId              <- map["user_id"]
    }
}
