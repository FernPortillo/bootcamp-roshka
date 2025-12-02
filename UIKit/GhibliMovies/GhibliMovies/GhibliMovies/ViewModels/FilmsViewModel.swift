//
//  FilmsViewModel.swift
//  GhibliMovies
//
//  Created by Bootcamp on 2025-11-30.
//

import Foundation

@Observable
class FilmsViewModel
{
    enum State: Equatable{
        case idle
        case loading
        case loaded([GMFilm])
        case error(String)
    }
    var state : State = .idle
    var films: [GMFilm] = []
    private let service : GhibliServices
    
    init(service: GhibliServices = DefaultGhibliServices()) {
        self.service = service
    }
    
    func fetch() async {
        guard self.state == .idle else {return}
        
        state = .loading
        
        do
        {
            let films = try await service.fetchFilms()
            self.state = .loaded(films)
        }
        catch let error as APIError
        {
            self.state = .error(error.errorDescription ?? "error desconocido, no deberia llegar aca")
        }
        catch
        {
            self.state = .error("error desconocido, no deberia llegar aca")
        }
    }
    
}
