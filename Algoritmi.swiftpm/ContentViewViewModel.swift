//
//  ContentViewViewModel.swift
//  Test
//
//  Created by Alexandr Booharin on 25.06.2022.
//

import Foundation

protocol ContentViewViewModelProtocol {
    
}

final class ContentViewViewModel: ContentViewViewModelProtocol {
    init() {
        initialState()
    }

    func initialState() {
//        let lesson1 = Lesson1()
//        lesson1.runAlgoritms()
//        lesson1.runHomeWork()
//        let lesson2 = Lesson2()
//        lesson2.runAlgoritms()
//        lesson2.runHomeWork()

        let lesson3 = Lesson3()
        lesson3.runAlgoritms()
        lesson3.runHomeWork()
    }
}
