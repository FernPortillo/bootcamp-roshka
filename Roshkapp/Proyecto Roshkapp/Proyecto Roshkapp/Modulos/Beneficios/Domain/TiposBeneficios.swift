//
//  Estados.swift
//  Proyecto Roshkapp
//
//  Created by Bootcamp on 2025-12-19.
//
enum TiposBeneficios : String, CaseIterable, Identifiable {
    case horarios = "Horarios"
    case reposos = "Reposos"
    case cumpleaños = "Cumpleaños"
    case examenesFinalesOTesis = "Examenes o Tesis"
    case matrimonio = "Matrimonio"
    case luto = "Luto"
    case permisoPorNacimiento = "Permiso por nacimiento"
    case viernes4You = "Viernes 4 you"
    case prestamos = "Prestamos"
    case capacitaciones = "Capacitaciones"
    case nutricionista = "Nutricionista"
    case gym = "Gym"
    case graduacion = "Graduacion"
    case frutasYSnack = "Frutas y snacks"
    var id: Self {self}
    
    var descripcion : String {
        switch self {
        case .horarios:
            return "Esquemas flexibles mientras no afecte tu productividad"
        case .reposos:
            return "Roshka cubre el otro 50% que IPS no cubre!"
        case .cumpleaños:
            return "Dia libre por tu cumpleaños!"
        case .examenesFinalesOTesis:
            return "Dias libres para concentrarte en tus estudios"
        case .matrimonio:
            return "Dias libres y bonos!"
        case .luto:
            return "Dias de licencia para apoyar al trabajador y ayuda social"
        case .permisoPorNacimiento:
            return "Dias libres y obsequios!"
        case .viernes4You:
            return "Un viernes de salida temprana al mes!"
        case .prestamos:
            return "Prestamos sin intereses!"
        case .capacitaciones:
            return "Financiacion y 50 horas libres al año"
        case .nutricionista:
            return "Convenio con nutricionista y cuota automatica"
        case .gym:
            return "Convenio con el gym FITTEST"
        case .graduacion:
            return "Regalos para los nuevos egresados"
        case .frutasYSnack:
            return "Snacks para merienda y desayuno saludable"
        }
    }
    var icon: String {
        switch self {
        case .horarios: return "clock"
        case .reposos : return "bed.double"
        case .cumpleaños : return "birthday.cake"
        case .examenesFinalesOTesis : return "doc.text.magnifyingglass"
        case .matrimonio : return "person.2"
        case .luto : return "heart.slash"
        case .permisoPorNacimiento : return "figure.and.child.holdinghands"
        case .viernes4You : return "calendar.badge.clock"
        case .prestamos : return "banknote"
        case .capacitaciones : return "book.closed"
        case .nutricionista : return "leaf"
        case .gym : return "dumbbell"
        case .graduacion : return "graduationcap"
        case .frutasYSnack : return "carrot"
        }
    }
}
