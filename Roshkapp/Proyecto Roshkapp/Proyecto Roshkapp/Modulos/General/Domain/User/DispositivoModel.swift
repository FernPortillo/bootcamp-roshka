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
    
    
    
    static let mockDispositivos: [DispositivoModel] = [
        DispositivoModel(
            idDispositivo: 1,
            nombreDispositivo: "Laptop Administrativa",
            tipoDispositivo: 1, // laptop
            nroSerie: "LAP-2024-001",
            modelo: "Dell Latitude 5420",
            detalle: "Equipo asignado para tareas administrativas.",
            fechaFabricacion: "2023-05-10",
            estado: "Operativo",
            categoria: "Computo",
            encargado: 101,
            nombreEncargado: "Juan Pérez",
            ubicacion: 12
        ),

        DispositivoModel(
            idDispositivo: 2,
            nombreDispositivo: "Monitor Principal",
            tipoDispositivo: 3, // monitor
            nroSerie: "MON-2023-114",
            modelo: "Samsung 27'' IPS",
            detalle: "Monitor principal de estación de trabajo.",
            fechaFabricacion: "2022-11-22",
            estado: "Operativo",
            categoria: "Periféricos",
            encargado: 102,
            nombreEncargado: "María López",
            ubicacion: 7
        ),

        DispositivoModel(
            idDispositivo: 3,
            nombreDispositivo: "Impresora Láser",
            tipoDispositivo: 6, // impresora
            nroSerie: "IMP-2022-089",
            modelo: "HP LaserJet Pro M404dn",
            detalle: "Impresora departamental utilizada por administración.",
            fechaFabricacion: "2022-03-17",
            estado: "En mantenimiento",
            categoria: "Oficina",
            encargado: 103,
            nombreEncargado: "Carlos Gómez",
            ubicacion: 4
        )
    ]

}



extension DispositivoModel
{
    static func getDeviceIcon(tipo : Int) -> String{
        switch tipo {
        case 1 : return "laptop.icon"
        case 2 : return "desktop.icon"
        case 3 : return "monitor.icon"
        case 4 : return "teclado.icon"
        case 5 : return "mouse.icon"
        case 6 : return "impresora.icon"
        case 7 : return "telefonoIP"
        case 8 : return "tablet.icon"
        case 9 : return "proyectorIP"
        case 10 : return "auriculares.icon"
        case 11 : return "webcam.icon"
        case 12 : return "smartphone.icon"
        default : return "device.unknown.icon"
        }
    }
}
