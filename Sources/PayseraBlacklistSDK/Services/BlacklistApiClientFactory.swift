import Foundation
import Alamofire
import PayseraCommonSDK

public class BlacklistApiClientFactory {    
    public static func createBlacklistApiClient(
        credentials: PSApiJWTCredentials,
        tokenRefresher: PSTokenRefresherProtocol? = nil,
        logger: PSLoggerProtocol? = nil
    ) -> BlacklistApiClient {
        let interceptor = PSRequestAdapter(credentials: credentials)
        let session = Session(interceptor: interceptor)
    
        return BlacklistApiClient(
            session: session,
            credentials: credentials,
            tokenRefresher: tokenRefresher,
            logger: logger
        )
    }
}
