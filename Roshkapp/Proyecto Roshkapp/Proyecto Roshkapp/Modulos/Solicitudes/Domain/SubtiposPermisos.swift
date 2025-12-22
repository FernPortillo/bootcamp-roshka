//
//  SubtiposPermisos.swift
//  Proyecto Roshkapp
//
//  Created by Bootcamp on 2025-12-20.
//


enum SubtiposPermisos: String, CaseIterable, Identifiable{
    case matrimonio = "Permiso por matrimonio"
    case fallecimientoConyugeHijos = "Permiso por fallecimiento cónyuge/hijos"
    case fallecimientoPadresHermanos = "Permiso por fallecimiento padres/hermanos"
    case nacimientoHijos = "Permiso por nacimiento de hijo"
    case permisoMedico = "Permiso médico"
    case permisoEstudios = "Permiso por estudios"
    case tramitesPersonales = "Permiso por trámites personales"
    case donacionSangre = "Permiso por donación de sangre"
    case servicioMilitar = "Permiso por servicio militar"
    case citacionJudicial = "Permiso por citación judicial"
    case permisoEmergenciaFamiliar = "Permiso por emergencia familiar"
    case licenciaMaternidad = "Licencia por maternidad"
    case licenciaPaternidad = "Licencia por paternidad"
    case permisoSindical = "Permiso sindical"
    case cumpleanos = "Permiso por cumpleaños"
    var id: Self {self}
}
