//
//  Joke.swift
//  Joke3rd
//
//  Created by zgaga on 02/05/2020.
//  Copyright © 2020 Hime Electronics Int. All rights reserved.
//

import UIKit

struct Joke: Decodable {
let type: String
let id:Int
let setup:String
let punchline: String
    
enum SerializationError:Error {
    case missing(String)
    case invalid(String,Any)
  }
}
