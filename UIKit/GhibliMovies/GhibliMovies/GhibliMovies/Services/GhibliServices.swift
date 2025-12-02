//
//  GhibliServices.swift
//  GhibliMovies
//
//  Created by Bootcamp on 2025-11-30.
//

import Foundation


protocol GhibliServices: Sendable{
    /// Servicios no deberian holdear nada mas que funciones que reciban input y devuelvan algo
    // Usamos repos para cosas que tienen que cambiar, como states y servicios para datos inalterables
    func fetchFilms() async throws -> [GMFilm]
    func fetchPerson(from URLString: String) async throws -> GMPerson
}
