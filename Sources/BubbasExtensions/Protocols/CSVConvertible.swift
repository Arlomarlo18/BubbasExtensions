//
//  CSVConvertible.swift
//
//
//  Created by Bubba Hall on 9/23/23.
//

import Foundation

public protocol CSVConvertible {
/// This protocol is to make the object able to be converted into a CSV file.
///
///```
/// struct Pokemon: Identifiable, CSVConvertible {
///     let id: Int
///     let name: String
///     let type1: String
///     let type2: String
///     let total: Int
///     let hp: Int
///     let attack: Int
///     let defense: Int
///     let spAtk: Int
///     let spDef: Int
///     let speed: Int
///     let generation: Int
///
///     init(raw: [String]) {
///         self.id = Int(raw[0])!
///         self.name = raw[1]
///         self.type1 = raw[2]
///         self.type2 = raw[3]
///         self.total = Int(raw[4])!
///         self.hp = Int(raw[5])!
///         self.attack = Int(raw[6])!
///         self.defense = Int(raw[7])!
///         self.spAtk = Int(raw[8])!
///         self.spDef = Int(raw[9])!
///         self.speed = Int(raw[10])!
///         self.generation = Int(raw[11])!
///    }
///}
///```
///
/// - Parameter raw: When using this parameter turn the entire object into one string.
    init?(raw: [String])
}
