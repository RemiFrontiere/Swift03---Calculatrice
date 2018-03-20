//
//  ViewController.swift
//  Calculatrice
//
//  Created by Digital on 20/03/2018.
//  Copyright © 2018 Remi. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    var myCalc : Calcul = Calcul()
    
    @IBOutlet weak var myLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buttonClick(_ sender: UIButton) {
        
        myCalc.action((sender.titleLabel?.text)!)
        
        if(myCalc.showValue != nil){
            myLabel.text = myCalc.showValue!
        }
        else{
            if(myCalc.operatorValue != nil && myCalc.rightOp != nil){
               myLabel.text = myCalc.rightOp!
            }
            else{
                if(myCalc.leftOp != nil){
                    myLabel.text = myCalc.leftOp!
                }
                else{
                    myLabel.text = "0"
                }
            }
        }
        

        
    }
}

class Calcul {
    
    enum Operators {
        case plus, minus, divide, mult
    }
    
    var leftOp : String? = nil
    var operatorValue : Operators? = nil
    var rightOp : String? = nil
    var showValue : String? = nil
    var isCalculated : Bool = false
    

    public func action(_ value: String){
        if(isCalculated)
        {
            leftOp = nil
            operatorValue = nil
            rightOp = nil
            showValue = nil
            isCalculated = false
        }
        switch value {
        case "/":
            operatorValue = Operators.divide
            break;
        case "X":
            operatorValue = Operators.mult
            break;
        case "-":
            operatorValue = Operators.minus
            break;
        case "+":
            operatorValue = Operators.plus
            break;
        case "=":
            if(leftOp != nil && operatorValue != nil && rightOp != nil){
                print("right: "+rightOp!)
                print("left: "+leftOp!)
                performCalc()
                isCalculated = true
            }
            else{
                leftOp = nil
                operatorValue = nil
                rightOp = nil
                showValue = nil
                isCalculated = false
            }
            break;
        case ",":
            break;
        case "AC":
            leftOp = nil
            operatorValue = nil
            rightOp = nil
            showValue = nil
            isCalculated = false
            break;
        default:
            
            if(leftOp == nil || operatorValue == nil)
            {
                if(leftOp != nil){
                    leftOp = leftOp!+value
                    print("left: "+leftOp!)
                }
                else{
                    leftOp = value
                    print("left: "+leftOp!)
                }
            }
            else{
                if(rightOp != nil){
                    rightOp = rightOp!+value
                }
                else{
                    rightOp = value
                }
            }

            break;

        }
        //
        
        
    }
    
    private func performCalc(){
        
        var x:Float?
        if(operatorValue == Operators.plus && rightOp != nil){
            x = ((leftOp! as NSString).floatValue) + ((rightOp! as NSString).floatValue)
        }
        if(operatorValue == Operators.minus && rightOp != nil){
            x = ((leftOp! as NSString).floatValue) - ((rightOp! as NSString).floatValue)
        }
        if(operatorValue == Operators.mult && rightOp != nil){
            x = ((leftOp! as NSString).floatValue) * ((rightOp! as NSString).floatValue)
        }
        if(operatorValue == Operators.divide && rightOp != nil){
            x = ((leftOp! as NSString).floatValue) / ((rightOp! as NSString).floatValue)
        }
        showValue = String(format:"%g", x!)
    }

}

