import Moya
import RxSwift

protocol BaseRepository {
}

class BaseRepositoryImpl: BaseRepository {
    
    private let apiProvider: APIProvider = APIProviderFactory().makeAPIProvider()
    
    func request<T: Codable>(api: API) -> Observable<T> {
        Observable<T>.create { [unowned self] observer -> Disposable in
            let request = self.apiProvider.getProvider().request(api) { result in
                do {
                    switch result {
                    case .success(let response):
                        let object = try JSONDecoder.default.decode(T.self, from: response.data)
                        observer.onNext(object)
                        observer.onCompleted()
                    case .failure(let error):
                        throw error
                    }
                } catch {
                    observer.onError(Errors.mapError(error))
                }
            }
            return Disposables.create {
                request.cancel()
            }
        }
    }

    func request<T: Codable>(api: API) -> Observable<[T]> {
        Observable.create { [unowned self] observer -> Disposable in
            let request = self.apiProvider.getProvider().request(api) { result in
                do {
                    switch result {
                    case .success(let response):
                        let object = try JSONDecoder.default.decode([T].self, from: response.data)
                        observer.onNext(object)
                        observer.onCompleted()
                    case .failure(let error):
                        throw error
                    }
                } catch {
                    observer.onError(Errors.mapError(error))
                }
            }
            return Disposables.create {
                request.cancel()
            }
        }
    }
}
