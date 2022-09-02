import Foundation
import RxSwift
import SwiftyJSON
import Moya

class BaseRepository {

    typealias JSONResponse = Observable<JSON>
    typealias StringResponse = Observable<String>
    typealias StringsResponse = Observable<[String]>
    typealias Integer64Response = Observable<Int64>
    typealias BooleanResponse = Observable<Bool>
    typealias EmptyResponse = Observable<Void>
}

class BaseRepositoryImpl: BaseRepository {

    func requestEmpty(api: API) -> BaseRepository.EmptyResponse {
        let observable = Observable<Void>.create { observer -> Disposable in
            let request = APIProvider.provider.request(api) { [unowned self] result in
                do {
                    switch result {
                    case .success:
                        observer.onNext(())
                        observer.onCompleted()
                    case .failure(let error):
                        throw Errors.mapError(error)
                    }
                } catch {
                    self.handleErrorEmptyData(api: api, observer: observer, error: error)
                }
            }
            return Disposables.create {
                request.cancel()
            }
        }.observe(on: MainScheduler.instance)
        return observable
    }

    func requestJSON(api: API) -> BaseRepository.JSONResponse {
        let observable = Observable<JSON>.create { observer -> Disposable in
            let request = APIProvider.provider.request(api) { [unowned self] result in
                do {
                    switch result {
                    case .success(let response):
                        let json = JSON(try response.mapJSON())
                        observer.onNext(json)
                        observer.onCompleted()
                    case .failure(let error):
                        throw error
                    }
                } catch {
                    self.handleError(api: api, observer: observer, error: error)
                }
            }
            return Disposables.create {
                request.cancel()
            }
        }.observe(on: MainScheduler.instance)
        return observable
    }

    private func handleError(api: API, observer: AnyObserver<JSON>, error: Error) {
        if let err = error as? MoyaError,
           case .underlying(_, let response) = err,
           response?.statusCode == 401 {
//            AuthorizationManager.shared.logout()
            return observer.onError(error)
        }
        observer.onError(Errors.mapError(error))
    }

    private func handleErrorEmptyData(api: API, observer: AnyObserver<Void>, error: Error) {
        if let err = error as? MoyaError,
           case .underlying(_, let response) = err,
           response?.statusCode == 401 {
//            AuthorizationManager.shared.logout()
            return observer.onError(error)
        }
        observer.onError(Errors.mapError(error))
    }
}
