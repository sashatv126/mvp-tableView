//
//  Presenter.swift
//  MvpTableView
//
//  Created by Владимир on 22.03.2022.
//

import Foundation

protocol MainViewProtocol : class {
    func success()
    func failure(error : Error)
}
protocol MainViewPresenterProtocol : class {
    init(view : MainViewProtocol, networkService : NetworkServiceProtocol)
    func getComments()
    var comments : [Comment]? { get set }
}
class MainPresenter: MainViewPresenterProtocol {
    weak var view : MainViewProtocol?
         let networkService : NetworkServiceProtocol!
         var comments: [Comment]?
    
     required init(view: MainViewProtocol, networkService : NetworkServiceProtocol) {
         self.view = view
         self.networkService = networkService
        getComments()
     }
     
    func getComments() {
        networkService.loadData(complition: {[weak self] result in
            guard let self = self else {return}
            DispatchQueue.main.async {
                switch result {
                case .success(let comments) :
                    self.comments = comments
                    self.view?.success()
                case .failure(let error) :
                    self.view?.failure(error : error)
                }
            }
          
        })
    }
    
   
    
   
   
}
