//
//  Binding+.swift
//  betcha
//
//  Created by Leon Wolf on 08.10.22.
//

import SwiftUI

@MainActor
prefix func ! (value: Binding<Bool>) -> Binding<Bool> {
    Binding<Bool>(
        get: { !value.wrappedValue },
        set: { value.wrappedValue = !$0 }
    )
}
