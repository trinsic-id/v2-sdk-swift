//
//  File.swift
//
//
//  Created by Tomislav Markovski on 11/30/21.
//

import Foundation
import Proto
import XCTest
@testable import Services

final class CredentialTests: XCTestCase {
    
    let testEndpoint = "staging-internal.trinsic.cloud"
    
    let vaccinationCertificateFrame: [String: Any] = [
        "@context": [
            "https://www.w3.org/2018/credentials/v1",
            "https://w3id.org/vaccination/v1",
            "https://w3id.org/security/bbs/v1"
            ],
        "type": [
            "VerifiableCredential",
            "VaccinationCertificate"
        ],
        "@explicit": true,
        "issuer": [],
        "credentialSubject": [
            "@explicit": true,
            "@type": "VaccinationEvent",
            "batchNumber": [],
            "countryOfVaccination": []
        ]
    ]
    
    let vaccinationCertificateUnsigned: [String: Any] = [
        "@context": [
            "https://www.w3.org/2018/credentials/v1",
            "https://w3id.org/vaccination/v1",
            "https://w3id.org/security/bbs/v1"
        ],
        "id": "urn:uvci:af5vshde843jf831j128fj",
        "type": [
            "VaccinationCertificate",
            "VerifiableCredential"
        ],
        "description": "COVID-19 Vaccination Certificate",
        "name": "COVID-19 Vaccination Certificate",
        "expirationDate": "2029-12-03T12:19:52Z",
        "issuanceDate": "2019-12-03T12:19:52Z",
        "issuer": "did:key:zUC724vuGvHpnCGFG1qqpXb81SiBLu3KLSqVzenwEZNPoY35i2Bscb8DLaVwHvRFs6F2NkNNXRcPWvqnPDUd9ukdjLkjZd3u9zzL4wDZDUpkPAatLDGLEYVo8kkAzuAKJQMr7N2",
        "credentialSubject": [
            "id": "urn:uuid:c53e70f8-ce9a-4576-8744-e5f85c20a743",
            "type": "VaccinationEvent",
            "batchNumber": "1183738569",
            "countryOfVaccination": "US"
        ]
    ]
    
    func testCredentialDemo() throws {
        let accountService = Services.Account()
            .with(endpoint: testEndpoint)
            .build()
        
        // SETUP Actors
        // Create 3 different profiles for each participant in the scenario
        let allison = try accountService.signIn()
        let clinic = allison //try accountService.signIn()
        let airline = clinic //try accountService.signIn()

        // Store profile for later use
        // Create profile from existing data

        // ISSUE CREDENTIAL
        // Sign a credential as the clinic and send it to Allison
        let credential = try Services.Credential()
            .with(endpoint: testEndpoint)
            .with(profile: clinic)
            .build()
            .issue(document: vaccinationCertificateUnsigned)

        NSLog("%@", credential);
        XCTAssertNotNil(credential)

        // STORE CREDENTIAL
        // Alice stores the credential in her cloud wallet
        let itemId = try Services.Wallet()
            .with(profile: allison)
            .with(endpoint: testEndpoint)
            .build()
            .insertItem(item: credential)
        
        NSLog("item id = %@", itemId)
        XCTAssertNotNil(itemId)

        // SHARE CREDENTIAL
        // Allison shares the credential with the venue
        // The venue has communicated with Allison the details of the credential
        // that they require expressed as a Json-LD frame.
        let credentialProof = try Services.Credential()
            .with(profile: allison)
            .with(endpoint: testEndpoint)
            .build()
            .createProof(documentId: itemId, revealDocument: vaccinationCertificateFrame)
        
        NSLog("Proof: %@", credentialProof)
        XCTAssertNotNil(credentialProof)

        // VERIFY CREDENTIAL
        // The airline verifies the credential
        let valid = try Services.Credential()
            .with(profile: airline)
            .with(endpoint: testEndpoint)
            .build()
            .verify(proofDocument: credentialProof);

        XCTAssertTrue(valid, "Result should be valid");
    }
}
