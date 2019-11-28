import XCTest
import JWTDecode
import PayseraCommonSDK
import PromiseKit

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
                if let error = error as? PSApiError {
                    print(error.description)
                }
                
            }.finally { expectation.fulfill() }
        
        wait(for: [expectation], timeout: 5.0)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
