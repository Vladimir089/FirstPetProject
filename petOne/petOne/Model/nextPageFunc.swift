//
//  nextPageFunc.swift
//  petOne
//
//  Created by Владимир on 15.08.2023.
//

import Foundation
import UIKit

func nextPage(_ identifier: String) -> UIViewController {
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let vc = storyboard.instantiateViewController(withIdentifier: identifier)
    return vc
}


