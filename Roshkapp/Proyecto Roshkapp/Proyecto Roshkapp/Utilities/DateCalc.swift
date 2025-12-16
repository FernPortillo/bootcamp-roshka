import Foundation

func calcularTimeStamp(fecha: String) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd"
    
    // Convertir la fecha proporcionada a tipo Date
    guard let fechaObjetivo = dateFormatter.date(from: fecha) else {
        return "Fecha no válida"
    }
    
    // Configurar el DateFormatter para mostrar "01 de enero"
    let displayFormatter = DateFormatter()
    displayFormatter.dateFormat = "dd 'de' MMMM"
    displayFormatter.locale = Locale(identifier: "es_ES") // Configurar en español
    
    // Devolver la fecha en el formato deseado
    return displayFormatter.string(from: fechaObjetivo)
}
