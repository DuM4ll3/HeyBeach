//
//  ServiceResult.swift
//  Hey Beach
//
//  Created by Rafael Ferraz on 24/12/18.
//  Copyright © 2018 Rafael Ferraz. All rights reserved.
//

enum ServiceResult<T: Decodable> {
    case success(T?)
    case failure(Error)
}
