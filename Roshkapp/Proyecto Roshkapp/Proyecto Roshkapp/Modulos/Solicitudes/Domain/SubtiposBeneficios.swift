//
//  SubtiposBeneficios.swift
//  Proyecto Roshkapp
//
//  Created by Bootcamp on 2025-12-20.
//


enum SubtiposBeneficios: String, CaseIterable, Identifiable{
    case capacitaciones = "Capacitaciones"
    case nutricionista = "Nutricionista"
    case gym = "Gym"
    case seguroMedico = "Seguro médico"
    case bonificacionDesempeno = "Bonificación por desempeño"
    case subsidioTransporte = "Subsidio transporte"
    case subsidioAlimentario = "Subsidio alimentario"
    var id: Self {self}
}