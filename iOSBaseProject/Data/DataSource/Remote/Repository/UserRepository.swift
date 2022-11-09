//
//  UserRepository.swift
//  iOSBaseProject
//
//  Created by Huy Pham on 09/11/2022.
//

import Foundation
import RxSwift

protocol UserRepository {
    
    func getUser() -> Observable<User>
}

class UserRepositoryFactory {
    
    static func makeUserRepository() -> UserRepository {
        UserRepositoryImpl()
    }
}

private class UserRepositoryImpl: BaseRepositoryImpl {
}

extension UserRepositoryImpl: UserRepository {
    
    func getUser() -> Observable<User> {
        request(api: .getUser)
    }
}
