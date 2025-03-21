//
//  Transfer.swift
//  ZKSync
//
//  Created by Eugene Belyakov on 12/01/2021.
//

import Foundation
import BigInt

public class Transfer: ZkSyncTransaction {

    override public var type: String { "Transfer" }

    let accountId: UInt32
    let from: String
    let to: String
    let token: UInt32
    let amount: BigUInt
    let fee: String
    let nonce: UInt32
    let timeRange: TimeRange

    var signature: Signature?

    // Ignored when generating JSON
    let tokenId: TokenId?

    var feeInteger: BigUInt { BigUInt(fee)! }

    public init(accountId: UInt32,
                from: String,
                to: String,
                token: UInt32,
                amount: BigUInt,
                fee: String,
                nonce: UInt32,
                tokenId: TokenId? = nil,
                timeRange: TimeRange) {
        self.accountId = accountId
        self.from = from
        self.to = to
        self.token = token
        self.amount = amount
        self.fee = fee
        self.nonce = nonce
        self.timeRange = timeRange
        self.tokenId = tokenId
    }

    enum CodingKeys: String, CodingKey {
        case accountId
        case from
        case to
        case token
        case amount
        case fee
        case nonce
        case type
        case signature
        case validFrom
        case validUntil
    }

    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(accountId, forKey: .accountId)
        try container.encode(from, forKey: .from)
        try container.encode(to, forKey: .to)
        try container.encode(token, forKey: .token)
        try container.encode(fee, forKey: .fee)
        try container.encode(nonce, forKey: .nonce)
        try container.encode(type, forKey: .type)
        try container.encode(signature, forKey: .signature)
        try container.encode(amount.description, forKey: .amount)
        try container.encode(timeRange.validFrom, forKey: .validFrom)
        try container.encode(timeRange.validUntil, forKey: .validUntil)
    }

    var description: String {
        let mirror = Mirror(reflecting: self)
        var objectDescription: String = ""
        for attribute in mirror.children {
            if let property = attribute.label as String? {
                objectDescription += "\(property): \(attribute.value) "
            }
        }

        return objectDescription
    }
}
