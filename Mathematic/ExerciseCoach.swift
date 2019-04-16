//
//  ExerciseCoach.swift
//  Mathematic
//
//  Created by Kotyada,Durga Susmitha on 4/15/19.
//  Copyright © 2019 Kotyada,Durga Susmitha. All rights reserved.
//

import Foundation

struct ExerciseCoach{
    
    static let sport:[String:Double] = ["Bicycling":8.0, "Jumping rope":12.3, "Running Slow":9.8, "Running Fast":23.0, "Tennis":8.0]
    
    static let kg = 2.2
    
   static func energyConsumed(during:String,weight:Double,time:Int) -> Double{
    
    let met = sport[during]!
    let energy:Double = met * 3.5 * ((weight) / (2.2 * 200)) * Double(time)
    return energy
    }
    
    static func timeToLose1Pound(during:String,weight:Double) -> Double{
        let met = sport[during]!
        let loose = Double(3500)/Double(met * 3.5 * ((weight) / (2.2 * 200)))
        return loose
    }
}


