//
//  Concentration.swift
//  concentration
//
//  Created by mac on 12/30/19.
//  Copyright © 2019 tanacom limited. All rights reserved.
//

import Foundation


//change from class to struct. Struct are value type and they are not stored in heap.

struct Concentration{
    
  private(set)  var cards = [Card]()
    
    
    //using computed property
  private  var indexOfOneAndOnlyFacedCard: Int?{
        
        get{

            return cards.indices.filter{ cards[$0].isFaceUp}.oneAndOnly
            
        }
    
        set{
            for index in cards.indices{
            cards[index].isFaceUp = (index == newValue)
        }
        
    }
    
    }
    
    
    mutating func chooseCard(at index: Int){
    
        assert(cards.indices.contains(index),"Concentration.choosecard(at : \(index)) : index not found")
        
        

        if !cards[index].isMatched{
            
            if let matchIndex = indexOfOneAndOnlyFacedCard , matchIndex != index{
                if cards[matchIndex] == cards[index] {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched=true
                }
                
                cards[index].isFaceUp = true
            
                
            } 
            else{
                //  Either no cards or two cards are face up
        
               indexOfOneAndOnlyFacedCard = index
                
            }
            
            
            
        }
        
        
    }
    
    
    init(numberOfPairOfCards:Int){

        assert(numberOfPairOfCards > 0,"Concentration.init(at : \(numberOfPairOfCards )) : you must have at least one pair of cards")
        
        for  _ in 1...numberOfPairOfCards {
    
        let card = Card()
        cards += [card,card]
           
        }
        
        //TODO : Shuffle the Cards
//        for _ in 0...cards.count {
//              if cards.count >= 2 {
//                  var swapFromIndex = 0
//                  var swapToIndex = 0
//
//                  repeat {
//                      swapFromIndex = Int(arc4random_uniform(UInt32(cards.count)))
//                      swapToIndex = Int(arc4random_uniform(UInt32(cards.count)))
//                  } while(swapFromIndex == swapToIndex)
//                  cards.swapAt(swapFromIndex, swapToIndex)
//              }
//          }
        
        
    }
    
}

extension Collection{
    
    // return only one element.
    var oneAndOnly : Element? {
    
    return count == 1 ? first : nil
        
    }
}
