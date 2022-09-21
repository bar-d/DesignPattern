//
//  Command.swift
//  command
//
//  Created by Baek on 2022/09/20.
//

import Foundation

protocol Command {
    var receiver: TextEditor { get set } //Command 객체는 receiver를 참조해야합니다
    var backup: String { get set }
    
    func execute() //실행 메서드
    func undo() // 취소 메서드
}
