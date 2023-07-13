//
//  Helpers.swift
//  hubtel-coding-challenge-repo
//
//  Created by Kwame Agyenim Boateng on 7/13/23.
//

import Foundation


func delay(duration: Double, completion: @escaping () -> Void ){
    DispatchQueue.main.asyncAfter(deadline: .now() + duration, execute: completion)
}
