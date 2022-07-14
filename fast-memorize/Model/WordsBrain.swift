//
//  WordsBrain.swift
//  fast-memorize
//
//  Created by Yaroslav Kambarov on 12.07.2022.
//

import Foundation


struct WordsBrain {
    let words = [
        Memorizer(v: "be", ps: "was, were", pp: "been", answer: ["wos, ware", "was, were", "wer, wore", "wes, were"]),
        Memorizer(v: "beat", ps: "beat", pp: "beaten", answer: ["buat", "baut", "biat", "beat"]),
        Memorizer(v: "become", ps: "became", pp: "become", answer: ["becomed", "bacome", "becameed", "became"]),
        Memorizer(v: "begin", ps: "began", pp: "begun", answer: ["began", "bigan", "bougan", "bogan"]),
        Memorizer(v: "bleed", ps: "bled", pp: "bled", answer: ["bleeded", "bled", "blid", "blod"]),
        Memorizer(v: "blow", ps: "blew", pp: "blown", answer: ["blew", "blowed", "blouw", "blow"]),
        Memorizer(v: "break", ps: "broke", pp: "broken", answer: ["brok", "breaked", "break", "broke"]),
        Memorizer(v: "bring", ps: "brought", pp: "brought", answer: ["bright", "breeght", "brought", "braht"]),
        Memorizer(v: "build", ps: "built", pp: "built", answer: ["boilt", "buolt", "built", "bilt"]),
        Memorizer(v: "burn", ps: "burnt", pp: "burnt", answer: ["bernt", "bornt", "burnt", "bernt"]),
        Memorizer(v: "burst", ps: "burst", pp: "burst", answer: ["bourst", "burst", "borst", "barst"]),
        Memorizer(v: "buy", ps: "bought", pp: "bought", answer: ["beght", "bought", "boughted", "beeght"])
    ]
    
    
    var scoreTrue = 0
    var scoreFalse = 0
    var count = 0
    
    func gameScore() -> String {
        return "true \(scoreTrue) / false \(scoreFalse)"
    }
    
    mutating func arrayCount() -> Int {
        return Int.random(in: 0...(words.count - 1))
    }
    
    mutating func checkRandom() -> Int {
        let random = arrayCount()
        if random == count {
            return checkRandom()
        } else {
            return random
        }
    }
    
    mutating func setImage() -> String {
        count = checkRandom()
        return words[count].verb
    }
    
    func setVerb() -> String{
        return words[count].verb
    }
    func setVerbPP() -> String{
        return words[count].pastParticiple
    }
    func setBtnText() -> [String] {
        return words[count].answers
    }
    
    func checkAnswer(_ answer : String) -> Bool {
        if answer == words[count].pastSimple {
            return true
        } else {
            return false
        }
    }
    
    func buttonCheck(_ answer : String) -> Int {
        return words[count].answers.firstIndex(of: answer)!
    }
    
    
    
}

