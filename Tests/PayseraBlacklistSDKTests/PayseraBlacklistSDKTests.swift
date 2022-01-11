import XCTest
import JWTDecode
import PayseraCommonSDK

@testable import PayseraBlacklistSDK

class PayseraBlacklistSDKTests: XCTestCase {
    private var blacklistApiClient : BlacklistApiClient!
    
    override func setUp() {
        super.setUp()
        
        let token = "change_me"
        
        let credentials = PSApiJWTCredentials()
        
        credentials.token = try! decode(jwt: token)
        blacklistApiClient = BlacklistApiClientFactory.createBlacklistApiClient(credentials: credentials)
    }
    
    func testGetRestrictions() {
        let expectation = XCTestExpectation(description: "")
        
        let filter = PSRestrictionFilter()
        filter.hidden = "false"
        filter.statuses = ["active", "pending_removal"]
        filter.userId = 1234
        
        blacklistApiClient
            .getUserRestrictions(filter: filter)
            .done { obj in
                print(obj)
            }.catch { error in
                if
                    let error = error as? PSApiError,
                    let description = error.description
                {
                    print(description)
                }
                
            }.finally { expectation.fulfill() }
        
        wait(for: [expectation], timeout: 5.0)
    }
}
