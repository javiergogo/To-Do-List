//
//  SecondViewController.swift
//  9ToDoList
//
//  Created by Javier Gomez on 11/4/15.
//  Copyright © 2015 Javier Gomez. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet var itemText: UITextField!
    
    @IBAction func additemButton(sender: AnyObject) {
        //agregar datos al arreglo global
        toDoListArray.append(itemText.text!)
        
        itemText.text=""
        
        //guardar el dato del arreglo en un dictionary llamado toDoList
        NSUserDefaults.standardUserDefaults().setObject(toDoListArray, forKey: "toDoList")
        
    }
    
    override func viewDidLoad()
    {
        NSUserDefaults.standardUserDefaults().setObject(toDoListArray, forKey: "toDoList")
        
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        //diciendo que es verdad que la edicion(teclado) se cerrara
        self.view.endEditing(true)
    }
    
    //para que al presionar el boton return se esconda el teclado usamos esta funcion
    func textFieldShouldReturn(textField: UITextField!) -> Bool
    {
        itemText.resignFirstResponder()
        
        return true
    }


}

