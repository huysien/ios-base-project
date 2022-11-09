//  ___FILEHEADER___

import Foundation

struct ___FILEBASENAMEASIDENTIFIER___Dependency {
}

class ___FILEBASENAMEASIDENTIFIER___Factory {
    
    func get___FILEBASENAMEASIDENTIFIER___(entity: ___VARIABLE_productName:identifier___Entity, dependency: ___FILEBASENAMEASIDENTIFIER___Dependency) -> ___FILEBASENAMEASIDENTIFIER___ {
        ___FILEBASENAMEASIDENTIFIER___Impl(entity: entity, dependency: dependency)
    }
}

private class ___FILEBASENAMEASIDENTIFIER___Impl {

    private weak var output: ___FILEBASENAMEASIDENTIFIER___Output?
    private var entity: ___VARIABLE_productName:identifier___Entity
    // Define dependencies
    
    init(entity: ___VARIABLE_productName:identifier___Entity, dependency: ___FILEBASENAMEASIDENTIFIER___Dependency) {
        self.entity = entity
        // Assign dependencies
    }

    func inject(_ output: ___FILEBASENAMEASIDENTIFIER___Output) {
        self.output = output
    }
}

extension ___FILEBASENAMEASIDENTIFIER___Impl: ___FILEBASENAMEASIDENTIFIER___ {
}
