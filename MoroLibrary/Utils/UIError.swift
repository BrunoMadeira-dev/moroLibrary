//
//  UIError.swift
//  MoroLibrary
//
//  Created by Bruno Madeira on 29/01/2026.
//

import Foundation


struct UIError: Identifiable {
    let id = UUID()
    let title: String
    let message: String
}
