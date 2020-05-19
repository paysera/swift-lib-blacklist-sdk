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
        let trustedSession = PSTrustedSession(
            interceptor: interceptor,
            hosts: ["blacklist.paysera.com"]
        )
    
        return BlacklistApiClient(
            session: trustedSession,
            credentials: credentials,
            tokenRefresher: tokenRefresher,
            logger: logger
        )
    }
}
