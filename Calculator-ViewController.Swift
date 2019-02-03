//
//  ViewController.swift
//  Calculator
//
//  Created by Mike Chen on 2/2/19.
//  Copyright © 2019 DePaul. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var warning: UILabel!
    @IBOutlet weak var label2: UILabel!
    //temp storage that will then turn into Int and store in to numlist
    var numtemp:String = "";
    //8 numbers max (most phone calc does 10 max on screen)
    var numlist: [Int?] = [nil,nil,nil,nil,nil,nil,nil,nil];
    //variable to track operator repeat
    var operecord: Int = 0;
    //track operation count
    var opecount: Int = 0;
    //store the operators
    var opes: String = "";
    
    @IBAction func Clear(_ sender: UIButton) {
        //clear all, reset all
        opecount  = 0;
        operecord = 0;
        numtemp.removeAll();
        warning.text?.removeAll();
        label2.text?.removeAll();
        numlist = [nil,nil,nil,nil,nil,nil,nil,nil];
    }
    
    //Show numbers on label, numtemp background recording numbers.
    @IBAction func NumberButtons(_ sender: UIButton){
        if let title = sender.currentTitle{
            label2.text?.append(contentsOf: "\(title)")
            numtemp.append(contentsOf: sender.currentTitle!)
        }
        //operecord set to 0 since no operators entered
        operecord = 0;
    }
    
    //when operators are pressed, put number into the numlist
    @IBAction func operators(_ sender: UIButton) {
        //if no numbers inserted at all, do nothing
        if(label2.text?.isEmpty==true){}
        //if opecount > 6 means numlist is at max, so do nothing and show warning
        else if(opecount > 6){warning.text = "7 Max operations reached"}
        //else if operecord is 1, meaning the last entry was an operator. Replace previous entered operator.
        else if(operecord == 1){
            label2.text?.removeLast(3);
            opes.removeLast()
            if let title = sender.currentTitle{
                label2.text?.append(contentsOf: " \(title) ")
                opes.append(title)
            }
        }
        //if operation is valid then put the number stored in numtemp into numlist array for later calculation
        else{
            if let title = sender.currentTitle{
                label2.text?.append(contentsOf: " \(title) ")
                opes.append(title)
            }
            for i in 0..<numlist.count {
                if (numlist[i] == nil) {
                    numlist[i] = Int(numtemp)!
                    break
                }
            }
            //now clear numtemp since added to array, ope record set to 1
            numtemp.removeAll();
            operecord = 1;
            opecount += 1;
            print(numlist)
        }
    }
    
    @IBAction func equals(_ sender: UIButton) {
        if(operecord == 1){}
        else{
        //enter number before equalling if theres number left
        var tempRes: Int = 0;
        for i in 0..<numlist.count {
            if (numlist[i] == nil) {
                if let a = Int(numtemp){
                    numlist[i] = a
                }
                break
            }
        }
        //similar to AC clears all variables
        opecount = 0;                      //ope count 0
        numtemp.removeAll();                //clear String temp number recorder
        warning.text?.removeAll();          //remove warning
        label2.text?.removeAll();           //clear label
        
        //Calculation
        print(opes)
        var j = 0;
        for i in opes{
            print("numlist[j]! = \(numlist[j]!)")
            if(i == "+"){tempRes = numlist[j]!+numlist[j+1]!; numlist[j+1] = tempRes}
            else if(i == "x"){tempRes = numlist[j]!*numlist[j+1]!; numlist[j+1] = tempRes}
            else if(i == "-"){tempRes = numlist[j]!-numlist[j+1]!; numlist[j+1] = tempRes}
            j += 1;
            print(numlist)
            print(tempRes)
        }
        //show result
        let a = String(tempRes)
        label2.text?.append(a)
        numtemp = a
        
        //clear the rest of the variables and reset
        opes.removeAll()
        numlist = [nil,nil,nil,nil,nil,nil,nil,nil];
        }
       
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

