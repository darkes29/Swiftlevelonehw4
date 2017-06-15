//
//  ViewController.swift
//  SwiftLevelOne4
//
//  Created by Александр Ломтев on 12.06.17.
//  Copyright © 2017 Александр Ломтев. All rights reserved.
/*1. Написать функцию, которая будет принимать параметром переменную и определять ее тип, выводя сообщение о типе.
/тогда как доп задание вывести весь этот текст с переходами на новые строки в один View элемент
2. *Используя библиотеки Alamofire, Realm, SwiftySJON загрузить из интернета и сохранить БД любой JSON набор данных. Вывести его в консоль Xcode.*/

import UIKit
import SwiftyJSON
import Alamofire
import RealmSwift
var Str: String = ""
class weather : Object {
    dynamic var id = ""
    dynamic var data = ""
    
}

class ViewController: UIViewController {
    @IBOutlet var Label1: UILabel!
    @IBOutlet var TextInput1: UITextField!
    @IBOutlet var Button1: UIButton!
    @IBOutlet var TextView1: UITextView!
    @IBAction func enter1(sender : AnyObject) {
        let a: Character = "a"
        let b: String = "geek"
        let c: Int = 1024
        let d: Double = 1024.0
        let e: Bool = true
        let f: UInt = 2569999999999999999
        Label1.text = String(a) + " is " + fun().WhatIsType(a: a) + "\r\n" +
            String(b) + " is " + fun().WhatIsType(a: b) + "\r\n" +
            String(c) + " is " + fun().WhatIsType(a: c) + "\r\n" +
            String(d) + " is " + fun().WhatIsType(a: d) + "\r\n" +
            String(e) + " is " + fun().WhatIsType(a: e) + "\r\n" +
            String(f) + " is " + fun().WhatIsType(a: f)
        let myweather = weather()
        

        
        //http://samples.openweathermap.org/data/2.5/forecast?q=Helsinki,fi&appid=b1b15e88fa797225412429c1c50c122a1
        
        Alamofire.request(TextInput1.text!).responseJSON { response in
         //   print(response.request)  // original URL request
         //   print(response.response) // HTTP URL response
        //    print(response.data)     // server data
            print(response.result)   // result of response serialization
            
            if let JSON = response.result.value {
               // Str+=String(describing: response.result)
                
                Str = Str + String(describing: response.result.value)
                
            }
        }
        print(Str)
        
        myweather.id = "1"
        myweather.data = Str
        // Get the default Realm
        let realm = try! Realm()
        // You only need to do this once (per thread)
        
        // Add to the Realm inside a transaction
        try! realm.write {
            realm.add(myweather)
        }
        let rez = realm.objects(weather.self) // retrieves all Dogs from the default Realm
        print(String(describing: rez))
        self.TextView1.text = String(describing: rez)

        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

