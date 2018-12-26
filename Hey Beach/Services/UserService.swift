//
//  UserService.swift
//  Hey Beach
//
//  Created by Rafael Ferraz on 24/12/18.
//  Copyright © 2018 Rafael Ferraz. All rights reserved.
//

typealias UserServiceCompletion = (ServiceResult<User>) -> Void

protocol UserServiceType: NetworkService {
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
            self.decode(result, for: User.self, completion: completion)
        }
    }
    
    private func request(_ service: HeyBeachApi, with completion: @escaping UserServiceCompletion) {
        heyBeach.request(service) { (result) in
            self.decode(result, completion: completion)
        }
    }
}
