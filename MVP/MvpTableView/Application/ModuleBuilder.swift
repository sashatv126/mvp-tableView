//
//  ModuleBuilder.swift
//  MvpTableView
//
//  Created by Владимир on 22.03.2022.
//

import UIKit

protocol Builder {
    static func createMain() -> UIViewController
}

class  ModuleBuilder : Builder {
    static func createMain() -> UIViewController {
        let view = ViewController()
        let networkService = NetworkService()
        let presenter = MainPresenter(view: view, networkService: networkService)
        view.presenter = presenter
        return view
    }
}
