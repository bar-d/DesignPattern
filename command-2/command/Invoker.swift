//
//  Invoker.swift
//  command
//
//  Created by Baek on 2022/09/20.
//

import Foundation

// Invoker는 Command를 수행하고 되돌리는걸 시작하는 역할만 합니다.
class Invoker {
    var history: [Command] = [] // 실행취소를 구현하기 위해 실행된 Command를 순서대로 저장할 Stack을 만들어줍니다.
    
    private func push(command: Command) {
        self.history.append(command)
    }
    
    private func pop() -> Command? {
        return history.popLast()
    }
    
    //실행 메서드
    func executeCommand(command: Command) {
        command.execute()
        self.push(command: command)
    }
    
    //취소 메서드
    func undoCommand() {
        let command = self.pop()
        if command == nil {
            print("되돌릴 작업이 없습니다.")
        } else {
            command?.undo()
        }
    }
}
