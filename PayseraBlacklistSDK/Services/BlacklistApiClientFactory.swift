import Foundation
import Alamofire
import PayseraCommonSDK

public class BlacklistApiClientFactory {    
    public static func createBlacklistApiClient(
        credentials: PSApiJWTCredentials,
        tokenRefresher: PSTokenRefresherProtocol? = nil,
        logger: PSLoggerProtocol? = nil
    ) -> BlacklistApiClient {
        let sessionManager = SessionManager()
        sessionManager.adapter = PSRequestAdapter(credentials: credentials)
    
        return BlacklistApiClient(
            sessionManager: sessionManager,
            credentials: credentials,
            tokenRefresher: tokenRefresher,
            logger: logger
        )
    }
}
