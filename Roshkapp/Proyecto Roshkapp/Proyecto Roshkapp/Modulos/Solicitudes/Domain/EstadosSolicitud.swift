//
//  EstadosSolicitud.swift
//  Proyecto Roshkapp
//
//  Created by Bootcamp on 2025-12-20.
//


enum EstadosSolicitud: String, CaseIterable, Identifiable{
    case A = "Aprobada"
    case P = "Pendiente"
    case R = "Rechazada"
    
    var id: Self { self }
}