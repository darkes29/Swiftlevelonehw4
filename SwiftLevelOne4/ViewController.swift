//
//  ViewController.swift
//  SwiftLevelOne4
//
//  Created by Александр Ломтев on 12.06.17.
//  Copyright © 2017 Александр Ломтев. All rights reserved.
/*1. Написать функцию, которая будет принимать параметром переменную и определять ее тип, выводя сообщение о типе.

2. *Используя библиотеки Alamofire, Realm, SwiftySJON загрузить из интернета и сохранить БД любой JSON набор данных. Вывести его в консоль Xcode.*/

import UIKit
import SwiftyJSON
import Alamofire
import RealmSwift
class ViewController: UIViewController {
    @IBOutlet var Label1: UILabel!
    @IBOutlet var Label2: UILabel!
    @IBOutlet var Label3: UILabel!
    @IBOutlet var Label4: UILabel!
    @IBOutlet var Label5: UILabel!
    @IBOutlet var Label6: UILabel!
    @IBOutlet var TextInput1: UITextField!
    @IBOutlet var Button1: UIButton!
    @IBAction func enter1(sender : AnyObject) {
        
      //  Label1.text=String(fun().WhaitIsType(a: TextInput1.text))
       
        let a: Character = "a"
        let b: String = "geek"
        let c: Int = 1024
        let d: Double = 1024.0
        let e: Bool = true
        let f: UInt = 2569999999999999999
        Label1.text = String(a) + " is " + fun().WhaitIsType(a: a)
        Label2.text = String(b) + " is " + fun().WhaitIsType(a: b)
        Label3.text = String(c) + " is " + fun().WhaitIsType(a: c)
        Label4.text = String(d) + " is " + fun().WhaitIsType(a: d)
        Label5.text = String(e) + " is " + fun().WhaitIsType(a: e)
        Label6.text = String(f) + " is " + fun().WhaitIsType(a: f)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        Alamofire.request("http://samples.openweathermap.org/data/2.5/forecast?q=Helsinki,fi&appid=b1b15e88fa797225412429c1c50c122a1").responseJSON { response in
            print(response.request)  // original URL request
            print(response.response) // HTTP URL response
            print(response.data)     // server data
            print(response.result)   // result of response serialization
            
            if let JSON = response.result.value {
                print("JSON: \(JSON)")
            }
        }
        
       // print(fun().WhaitIsType(a: a as Any))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

