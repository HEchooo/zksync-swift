//
//  Token.swift
//  ZKSync
//
//  Created by Eugene Belyakov on 06/01/2021.
//

import Foundation
import BigInt

public struct Token: TokenId, Decodable {

    public static let DefaultAddress = "0x0000000000000000000000000000000000000000"

    public let id: UInt32
    public let address: String
    public let symbol: String
    public let decimals: Int

    public static var ETH: Token {
        return Token(id: 0,
                     address: Token.DefaultAddress,
                     symbol: "ETH",
                     decimals: 18)
    }

    public init(id: UInt32, address: String, symbol: String, decimals: Int) {
        self.id = id
        self.address = address
        self.symbol = symbol
        self.decimals = decimals
    }

    public func intoDecimal(_ amount: BigUInt) -> Decimal {
        let sourceDecimal = Decimal(string: "\(amount)")!
        return  sourceDecimal / pow(Decimal(10), decimals)
    }

    var isETH: Bool {
        return (address == Token.DefaultAddress && symbol == "ETH")
    }
}
