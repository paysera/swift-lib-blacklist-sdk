import ObjectMapper
import PayseraCommonSDK

public class PSRestriction: Mappable {
    public var id: Int!
    public var userId: String!
    public var type: String?
    public var status: String?
    public var createMethod: String?
    public var awaitedConditionRemovalType: String?
    public var awaitedConditionType: String?
    public var createdAt: Date?
    public var hidden: Bool?
    public var reviewStatus: String?
    public var comments: [PSRestrictionComment]?
    public var resolvedAt: Date?
    public var restrictedActions: [PSRestrictionRestrictedAction]?
    public var activatesAt: Date?
    
    public init() {}
    
    required public init?(map: Map) {}
    
    public func mapping(map: Map) {
        id                          <- map["id"]
        userId                      <- map["user_id"]
        type                        <- map["type"]
        status                      <- map["status"]
        createMethod                <- map["create_method"]
        awaitedConditionRemovalType <- map["awaited_condition_removal_type"]
        awaitedConditionType        <- map["awaited_condition_type"]
        createdAt                   <- (map["created_at"], DateTransform())
        hidden                      <- map["hidden"]
        reviewStatus                <- map["review_status"]
        comments                    <- map["comments"]
        resolvedAt                  <- (map["resolved_at"], DateTransform())
        restrictedActions           <- map["restricted_actions"]
        activatesAt                 <- (map["activates_at"], DateTransform())
    }
}

public class PSRestrictionComment: Mappable {
    public var id: Int!
    public var comment: String!
    public var type: String!
    
    public init() {}
    
    required public init?(map: Map) {}
    
    public func mapping(map: Map) {
        id      <- map["id"]
        comment <- map["comment"]
        type    <- map["type"]
    }
}

public class PSRestrictionRestrictedAction: Mappable {
    public var id: Int!
    public var action: String!
    
    public init() {}
    
    required public init?(map: Map) {}
    
    public func mapping(map: Map) {
        id      <- map["id"]
        action  <- map["action"]
    }
}
