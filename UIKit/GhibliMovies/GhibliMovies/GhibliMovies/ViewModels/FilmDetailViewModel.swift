//
//  FilmDetailViewModel.swift
//  GhibliMovies
//
//  Created by Bootcamp on 2025-11-30.
//

import Foundation

@Observable
class FilmDetailViewModel {
    
    enum State: Equatable{
        case idle
        case loading
        case loaded([GMPerson])
        case error(String)
    }
    var state : State = .idle
    var people: [GMPerson] = []
    private let service : GhibliServices
    
    init(service: GhibliServices = DefaultGhibliServices()) {
        self.service = service
    }
    
    func fetch(for film: GMFilm) async {
        // Iterar film.people
        // El problema con esto es que hay que crear un grupo de tasks por cada persona
        // Entonces pones a ghibli service como sendable porque no va a variar
        
        guard state == .idle else { return }
        
        state = .loading
        
        var loadedPeople: [GMPerson] = []
        
        do{
            try await withThrowingTaskGroup(of: GMPerson.self) { group in
                
                for personInfoURL in film.people {
                    group.addTask{
                        try await self.service.fetchPerson(from: personInfoURL)
                    
                    }
                }
                for try await person in group{
                    loadedPeople.append(person)
                }
            }
            
            state = .loaded(loadedPeople)
            
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



import Playgrounds
#Playground {
    let service = MockGhibliService()
    let vm = FilmDetailViewModel()
    
    let film = service.fetchFilm()
    await vm.fetch(for: film)
    
    switch vm.state{
        case .loading: print("loading")
        case .idle: print("idle")
        case .loaded(let people):
            for person in people{
                print(person)
        }
    case .error(let error): print(error)
    }
}
