//
//  ViewController.swift
//  iCalc
//
//  Created by Juan Morillo on 25/9/15.
//  Copyright © 2015 JuanMorillios. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblResult: UILabel!
    
    //Declaramos la variable que va a guardar el resultado:
    
    var result: Float = 0
    
    //Declaramos la variable que va a mantener el último numero pulsado
    
    var lastNumPress: Float = 0
    
    //Declaramos la variable que va a mantener la última operación seleccionada.
    
    var lastPressOpt: String = "="
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
    //Asignamos el valor de la variable result al Label, el tipo de dato de la variable result es Float, para poder mostrarlo en la propiedad Text del label hay que convertirlo a  tipo String, a continuación.
        
        
     lblResult.text = "\(result)"
        
        
    }

   
    @IBAction func pressNum(sender: UIButton) {
        
        
        
        lastNumPress = lastNumPress * 10 + Float(Int(sender.titleLabel!.text!)!)
        
        lblResult.text = "\(lastNumPress)"
        
    }

    @IBAction func pressOpt(sender: UIButton) {
        
        //Vamos a utilizar Switch para controlar el flujo de la operación
        
        
        switch lastPressOpt {
        
        case "=":
            result = lastNumPress
            
        case "+":
            result = result + lastNumPress
        case "-":
            result = result - lastNumPress
        case "*":
            result = result * lastNumPress
        case "/":
            result = result / lastNumPress
            
        default:
            print("Hay un error, por favor corregirlo")
        
        
        }
        
        lastNumPress = 0
        lblResult.text = ("\(result)")
        
        if (sender.titleLabel!.text == "=") {
        
        result = 0
            
        }
        
        lastPressOpt = sender.titleLabel!.text! as String!
        
    }
 
    @IBAction func clearBtn(sender: UIButton) {
        
        result = 0
        lastNumPress = 0
        lastPressOpt = "="
        lblResult.text = "\(result)"
        
    }
}

