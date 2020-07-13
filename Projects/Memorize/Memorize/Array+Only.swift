//
//  Array+Only.swift
//  Memorize
//
//  Created by Akshith Ramadugu on 7/11/20.
//  Copyright © 2020 AK-Vitae. All rights reserved.
//

import Foundation

extension Array {
    var only: Element?{
        count == 1 ? first : nil
    }
}
