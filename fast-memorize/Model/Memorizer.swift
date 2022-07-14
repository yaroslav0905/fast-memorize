//
//  Memorizer.swift
//  fast-memorize
//
//  Created by Yaroslav Kambarov on 12.07.2022.
//

import Foundation

struct Memorizer {
    let verb : String
    let pastSimple : String
    let pastParticiple : String
    
    let answers : [String]
    
    init (v : String, ps: String, pp : String, answer : [String]) {
        verb = v
        pastSimple = ps
        pastParticiple = pp
        answers = answer
    }
}
