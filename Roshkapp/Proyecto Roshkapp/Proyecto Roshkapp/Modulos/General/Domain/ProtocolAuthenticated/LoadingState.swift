//
//  LoadingState.swift
//  Proyecto Roshkapp
//
//  Created by Bootcamp on 2025-12-05.
//


enum LoadingState<T>
{
    case idle
    case loading
    case loaded(T)
    case failed(Error)
    
    
}
