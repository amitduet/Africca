//
//  Animal.swift
//  Africca
//
//  Created by Amit on 2021/05/29.
//

import Foundation

struct Animal:Codable, Identifiable {
    let id:String
    let name:String
    let headline:String
    let description:String
    let link:String
    let image:String
    let gallery:[String]
    let fact:[String]
}
