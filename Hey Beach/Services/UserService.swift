//
//  UserService.swift
//  Hey Beach
//
//  Created by Rafael Ferraz on 24/12/18.
//  Copyright © 2018 Rafael Ferraz. All rights reserved.
//

import Foundation

typealias UserServiceCompletion = (ServiceResult<User>) -> Void

protocol UserServiceType {
    /// register user in the api
    func register(_ user: User, _ completion: @escaping UserServiceCompletion)
    /// logs user in
    func login(_ user: User, _ completion: @escaping UserServiceCompletion)
    /// logs user out
    func logout(_ completion: @escaping UserServiceCompletion)
    /// get user
    func getMe(_ completion: @escaping UserServiceCompletion)
}

struct UserService: UserServiceType {
    
    private let heyBeach: NetworkProvider<HeyBeachApi>
    
    init(heyBeach: NetworkProvider<HeyBeachApi> = NetworkProvider<HeyBeachApi>()) {
        self.heyBeach = heyBeach
    }
    
    func register(_ user: User, _ completion: @escaping UserServiceCompletion) {
        request(.register(user), with: completion)
    }
    
    func login(_ user: User, _ completion: @escaping UserServiceCompletion) {
        request(.login(user), with: completion)
    }
    
    func logout(_ completion: @escaping UserServiceCompletion) {
        request(.logout, with: completion)
    }
    
    func getMe(_ completion: @escaping UserServiceCompletion) {
        heyBeach.request(.me) { (result) in
            DispatchQueue.main.async {
                switch result {
                case let .success(data):
                    if let json = data {
                        let user: User? = try? User.decode(from: json)
                        completion(.success(user))
                    }
                case let .error(error):
                    completion(.failure(error))
                }
            }
        }
    }
    
    private func request(_ service: HeyBeachApi, with completion: @escaping UserServiceCompletion) {
        heyBeach.request(service) { (result) in
            DispatchQueue.main.async {
                switch result {
                case .success:
                    completion(.success(nil))
                case let .error(error):
                    completion(.failure(error))
                }
            }
        }
    }
}
