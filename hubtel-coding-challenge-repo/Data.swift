//
//  Data.swift
//  hubtel-coding-challenge-repo
//
//  Created by Kwame Agyenim Boateng on 7/13/23.
//

import Foundation

enum TransactionStatus {
    case sucesss
    case failed
    case pending
}

enum TransactionType {
    case personal
    case other
}

enum MobileNetwork {
    case mtn
    case airtel
    case vodaphone
    case glo
    case bank
}

struct Transaction{
    var receipient: String
    var transaction_status: TransactionStatus
    var network: MobileNetwork
    var price: Double
    var mobile: String
    var transaction_type: TransactionType
    var comments: String
    var date: String
    
    
    static let data: [Transaction] = [
        Transaction(receipient: "Emmanuel Rockson Kwabena Uncle Ebo", transaction_status: .sucesss, network: .mtn, price: 500, mobile: "0241234567", transaction_type: .personal, comments: "Cool your heart wai", date: "May 23,2022"),
        Transaction(receipient: "Absa Bnak", transaction_status: .failed, network: .bank, price: 500, mobile: "0241234567", transaction_type: .personal, comments: "Cool your heart wai", date: "May 23,2022"),
        Transaction(receipient: "Emmanuel Rockson", transaction_status: .pending, network: .mtn, price: 500, mobile: "0241234567", transaction_type: .other, comments: "Cool your heart wai", date: "May 23,2022"),
        Transaction(receipient: "Emmanuel Rockson", transaction_status: .sucesss, network: .mtn, price: 500, mobile: "0241234567", transaction_type: .other, comments: "",date: "May 23,2022"),
        Transaction(receipient: "Emmanuel Rockson Kwabena Uncle Ebo", transaction_status: .sucesss, network: .mtn, price: 500, mobile: "0241234567", transaction_type: .personal, comments: "Cool your heart wai", date: "May 23,2022"),
        Transaction(receipient: "Absa Bnak", transaction_status: .failed, network: .bank, price: 500, mobile: "0241234567", transaction_type: .personal, comments: "Cool your heart wai", date: "May 23,2022"),
        Transaction(receipient: "Emmanuel Rockson", transaction_status: .pending, network: .mtn, price: 500, mobile: "0241234567", transaction_type: .other, comments: "Cool your heart wai", date: "May 23,2022"),
        Transaction(receipient: "Emmanuel Rockson", transaction_status: .sucesss, network: .mtn, price: 500, mobile: "0241234567", transaction_type: .other, comments: "",date: "May 23,2022"),
    ]
}
