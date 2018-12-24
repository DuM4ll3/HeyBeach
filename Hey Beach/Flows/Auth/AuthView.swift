//
//  AuthView.swift
//  Hey Beach
//
//  Created by Rafael Ferraz on 24/12/18.
//  Copyright © 2018 Rafael Ferraz. All rights reserved.
//

/// actions to be defined by its coordinator
protocol AuthView: Presentable {
    var onLoginButtonTap: (() -> Void)? { get set }
}
