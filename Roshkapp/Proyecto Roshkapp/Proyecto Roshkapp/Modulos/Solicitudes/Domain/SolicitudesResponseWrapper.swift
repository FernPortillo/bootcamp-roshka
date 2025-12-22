//
//  SolicitudesResponseWrapper.swift
//  Proyecto Roshkapp
//
//  Created by Bootcamp on 2025-12-22.
//

struct PagedContent<T: Codable>: Codable {
    let content: [T]
}
