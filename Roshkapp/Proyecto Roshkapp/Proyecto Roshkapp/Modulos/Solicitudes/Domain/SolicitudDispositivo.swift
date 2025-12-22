//
//  SolicitudDispositivo.swift
//  Proyecto Roshkapp
//
//  Created by Bootcamp on 2025-12-12.
//

struct SolicitudDispositivo : Codable {
    let id_tipo_dispositivo: Int
    let comentario: String
}

struct SolicitudPermiso
{
    let id_tipo_permiso: Int
}
/*
  "id_tipo_permiso": 6,
  "fecha_inicio": "2025-09-27",
  "cant_dias": 3,
  "comentario": "Permiso por rendir examen parcial"
}

{
  "id_tipo_permiso": 6,
  "fecha_inicio": "2025-09-27",
  "cant_dias": 3,
  "comentario": "Permiso por rendir examen parcial"
}

{
  "id_tipo_permiso": 6,
  "fecha_inicio": "2025-09-27",
  "fecha_fin": "2025-09-30",
  "Destinatario": "Talento Humano",
  "cant_dias": 3,
  "comentario": "Permiso por rendir examen parcial"
}
*/
