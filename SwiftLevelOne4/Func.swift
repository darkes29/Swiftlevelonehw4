//
//  Func.swift
//  SwiftLevelOne4
//
//  Created by Александр Ломтев on 12.06.17.
//  Copyright © 2017 Александр Ломтев. All rights reserved.
//

import Foundation
class fun<T>{
    func WhaitIsType(a: T)->String{   // Функция выводящая сообщение о типе вводимых данных
        return(String(describing: type(of: a)))
    }
}
