//
//  Endpoints.swift
//  Proyecto Roshkapp
//
//  Created by Bootcamp on 2025-12-04.
//

/// Esto no deberia estar hardcodeado
enum Endpoints: String {
    case login = "http://localhost:8080/login"
    case myUser = "http://localhost:8080/api/v1/usuarios/me"
    case novedades = "http://localhost:8080/api/v1/admin/th/novedades/activas"
    case misSolicitudes = "http://localhost:8080/api/v1/usuarios/solicitudes"
    case thTodosBeneficios = "http://localhost:8080/api/v1/admin/th/users/requests/sortby?type=beneficio"
    case thTodosPermisos = "http://localhost:8080/api/v1/admin/th/users/requests/sortby?type=permiso"
    case thTodosVacaciones = "http://localhost:8080/api/v1/admin/th/users/requests/vacations"
    case asTodosSolicitudDispositivos = "http://localhost:8080/api/v1/admin/sysadmin/allRequests"
    case updateProfilePic = "http://localhost:8080/api/v1/usuarios/actualizarfoto"
}

