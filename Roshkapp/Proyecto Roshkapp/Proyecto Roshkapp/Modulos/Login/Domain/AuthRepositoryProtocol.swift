//
//  AuthRepositoryProtocol.swift
//  Proyecto Roshkapp
//
//  Created by Bootcamp on 2025-12-18.
//



/// Protocol es la clase contrato
protocol AuthRepositoryProtocol {
    func login(request: LoginRequest) async throws -> LoginResponse
    func logout() async throws
}