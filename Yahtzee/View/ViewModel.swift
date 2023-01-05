//
//  ViewModel.swift
//  Yahtzee
//
//  Created by Aashiq Mortimer on 08/12/2022.
//

import Foundation

protocol ViewModelRepresentable {
    var title: String { get }
}

struct ViewModel: ViewModelRepresentable {
    let title: String = "Yahtzee"
    
    
}
