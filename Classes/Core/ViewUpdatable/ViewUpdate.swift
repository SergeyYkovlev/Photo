//
//  ViewUpdate.swift
//  Photo
//
//  Created by Сергей Яковлев on 22.03.2022.
//

import Foundation

public protocol ViewUpdate {
    // swiftlint:disable:next function_parameter_count superfluous_disable_command
    func update<T, U: Equatable>(new newViewModel: T,
                                 old oldViewModel: T,
                                 keyPath: KeyPath<T, U>,
                                 force: Bool,
                                 configurationBlock: (U) -> Void)
}

public extension ViewUpdate {
    // swiftlint:disable:next function_parameter_count superfluous_disable_command statement_position
    func update<T, U: Equatable>(new newViewModel: T,
                                 old oldViewModel: T,
                                 keyPath: KeyPath<T, U>,
                                 force: Bool,
                                 configurationBlock: (U) -> Void) {
        let newValue = newViewModel[keyPath: keyPath]
        if force {
            configurationBlock(newValue)
            // swiftlint:disable:next function_parameter_count superfluous_disable_command statement_position
        }
        else if oldViewModel[keyPath: keyPath] != newValue {
            configurationBlock(newValue)
        }
    }
}
