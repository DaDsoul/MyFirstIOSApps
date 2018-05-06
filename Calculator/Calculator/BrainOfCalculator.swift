//
//  BrainOfCalculator.swift
//  Calculator
//
//  Created by talgat on 29.05.17.
//  Copyright © 2017 Akezhan. All rights reserved.
//

import Foundation



struct BrainOfCalculator {
    
    
    
    private var accumulator: (Double,String)?
    
    private enum Operation {
        case constant(Double)
        case unaryOperation ((Double) -> Double, (String) -> String )
        case binaryOperation((Double,Double) -> Double, (String, String) -> String)
        case equals
        }


    private var operations: Dictionary<String,Operation> = [
        "π" : Operation.constant(Double.pi),
        "e" : Operation.constant(M_E),
        "√" : Operation.unaryOperation(sqrt,{ "√(" + $0 + ")" }),
        "cos":Operation.unaryOperation(cos,{"cos(" + $0 + ")" }),
        "±" : Operation.unaryOperation({-$0},{"(-1)*(" + $0 + ")" }),
        "×" : Operation.binaryOperation({$0 * $1}, { $0 + "×" + $1 }),
        "÷" : Operation.binaryOperation({$0 / $1},{ $0 + "÷" + $1 }),
        "+" : Operation.binaryOperation({$0 + $1},{ $0 + "+" + $1 }),
        "−" : Operation.binaryOperation({$0 - $1},{ $0 + "-" + $1 }),
       
        "x²" : Operation.unaryOperation({$0 * $0},{$0 + "×" + $0 }),
        "x³" : Operation.unaryOperation({$0 * $0 * $0},{$0 + "×" + $0 + "×" + $0}),
        "x⁻¹" : Operation.unaryOperation ({1/$0},{"(" + $0 + ")⁻¹"}),
        "ln" : Operation.unaryOperation (log,{ "ln(" + $0 + ")" }),
        "log" :Operation.unaryOperation (log10, { "log(" + $0 + ")" }),
        "sin":Operation.unaryOperation(sin, { "sin(" + $0 + ")" }),
        "tan":Operation.unaryOperation(tan, { "tan(" + $0 + ")" }),
        "tanh":Operation.unaryOperation(tanh, { "tanh(" + $0 + ")" }),
        "=" : Operation.equals
          ]
  
  
    mutating func performOpearation(_ symbol: String){
        if let operation = operations[symbol] {
            switch operation{
            case .constant(let value):
                accumulator = (value, symbol)
            case .unaryOperation(let function, let description):
                if accumulator != nil{
                accumulator = (function(accumulator!.0), description(accumulator!.1))
                }
            case.binaryOperation(let function, let description):
                if  nil != accumulator
                {
            pendingBinaryOperation  = PendingBinaryOperation(function: function, firstOperand:accumulator!, description: description)
                    accumulator = nil
                }
                
            case.equals:
                performPendingBinaryOperation ()
                
            }
        }
    }
    
    private mutating func performPendingBinaryOperation(){
        if pendingBinaryOperation != nil && accumulator != nil{
            accumulator = pendingBinaryOperation!.perform(with: accumulator!)
            pendingBinaryOperation = nil
        }
    }
    
    
    
  
    private var pendingBinaryOperation : PendingBinaryOperation?
    
    
    private struct PendingBinaryOperation {
        let function: (Double,Double) -> Double
        let firstOperand: (Double,String)
        let description: (String, String) -> String
        func perform(with secondOperand: (Double,String)) -> (Double,String) {
        return (function(firstOperand.0,secondOperand.0), description(firstOperand.1,secondOperand.1))
        }
    }
    
    mutating func setOperand(_ operand: Double){
        accumulator=(operand,"\( operand )")
    }
    var description: String? {
        get {
            if resultIsPending {
                return pendingBinaryOperation!.description(pendingBinaryOperation!.firstOperand.1, accumulator?.1 ?? "")
            } else {
                return accumulator?.1
            }
        }
    }
    
    var result: Double? {
        get {
            if nil != accumulator {
                return accumulator!.0
            }
            return nil
        }
    }

    var resultIsPending: Bool {
        get {
            return nil != pendingBinaryOperation
        }
    }
    
 
    
}



