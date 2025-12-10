//
//  EquipoModel.swift
//  Proyecto Roshkapp
//
//  Created by Bootcamp on 2025-12-08.
//


struct DispositivoModel: Codable
{
    let idDispositivo: Int
    let nombreDispositivo: String
    let tipoDispositivo: Int
    let nroSerie: String
    let modelo: String
    let detalle: String
    let fechaFabricacion: String
    let estado: String
    let categoria: String
    let encargado: Int
    let nombreEncargado: String
    let ubicacion: Int
}


enum TipoDispositivos : String
{
    case laptop = "laptop.icon"
    case desktop = "desktop.icon"
    case monitor = "monitor.icon"
    case teclado = "teclado.icon"
    case mouse = "mouse.icon"
    case impresora = "impresora.icon"
    case telefonoIP = "." //
    case tablet = "tablet.icon"
    case proyector = ".." //
    case auriculares = "auriculares.icon"
    case webcam = "webcam.icon"
    case smartphone = "smartphone.icon"
}
