//
//  FirstViewController.swift
//  9ToDoList
//
//  Created by Javier Gomez on 11/4/15.
//  Copyright © 2015 Javier Gomez. All rights reserved.
//

import UIKit

//declaro una variable global para los dos viewcontroller
//para declara un arreglo vacio solo el tipo es como lo siguiente
var toDoListArray = [String]()

//dclaro tableview y textfield para controlar la tabla y la caja de texto para poder ocultarla
class FirstViewController: UIViewController, UITableViewDelegate, UITextFieldDelegate
{
    
    @IBOutlet var listTable: UITableView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        //accesa a los valores de memoria y si encuentra diferente de nulo, es decir entrara si encuentra algo en memoria con el nombre toDoList
        //como nombre de dictionary
        if NSUserDefaults.standardUserDefaults().objectForKey("toDoList") != nil
        {
            //lo que encuentre en ese dictionary guardado anteriormente, lo asigna a un arreglo
            toDoListArray = NSUserDefaults.standardUserDefaults().objectForKey("toDoList") as! [String]
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    //cuenta la cantidad de valores en arreglo y crea las filas de la tabla
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        //contara los elementos del arreglo
        //agregara la cantidad de celdas segun el tamano del arreglo
        return toDoListArray.count
    }
    
    //asigna los valores del arreglo a las filas de la tabla
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        //agregar constante de tipo viewcell con identificador llamado Cell
        let cel = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
        
        //utilizar constante anterior y asignar en texto
        //el valor del array segun el indice de la tabla
        cel.textLabel?.text = toDoListArray[indexPath.row]
        
        return cel
    }
    
    //funcion para actualizar cada vez que apareza este viewcontroller
    override func viewDidAppear(animated: Bool)
    {
        listTable.reloadData()
    }
    
    //metodo que nos permite "editar" (este caso sera eliminar) un elemento en una tabla
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath)
    {
        //estilo especifico cuando se desliza a la izquierda
        if editingStyle == UITableViewCellEditingStyle.Delete
        {
            //borrar el elemento del arreglo en el indice indicado por la tabla
            toDoListArray.removeAtIndex(indexPath.row)
            
            //actualizar lo que se guardo permanente en el telefono, ahora acutlizarlo sin el valor borrado
            NSUserDefaults.standardUserDefaults().setObject(toDoListArray, forKey: "toDoList")
            
            //actualidar la lista en la tabla
            listTable.reloadData()
        }
    }
      
}

