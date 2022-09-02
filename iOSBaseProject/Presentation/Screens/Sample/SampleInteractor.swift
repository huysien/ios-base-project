import Foundation

struct SampleInteractorDependency {
}

class SampleInteractorFactory {
    
    func getSampleInteractor(entity: SampleEntity, dependency: SampleInteractorDependency) -> SampleInteractor {
        SampleInteractorImpl(entity: entity, dependency: dependency)
    }
}

private class SampleInteractorImpl {

    private weak var output: SampleInteractorOutput?
    private var entity: SampleEntity
    // Define dependencies
    
    init(entity: SampleEntity, dependency: SampleInteractorDependency) {
        self.entity = entity
        // Assign dependencies
    }

    func inject(_ output: SampleInteractorOutput) {
        self.output = output
    }
}

extension SampleInteractorImpl: SampleInteractor {
}
