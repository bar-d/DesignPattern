//
//  CopyCommand.swift
//  command
//
//  Created by Baek on 2022/09/20.
//

import Foundation

// Concrete Command 복사기능 커맨드 입니다
class CopyCommand: Command {
    var receiver: TextEditor
    var backup: String = ""
    
    init(receiver: TextEditor) {
        self.receiver = receiver
    }
    
    //실행취소 메서드
    func undo() {
        receiver.clipboard = self.backup
        self.backup = ""
    }

    //붙여넣기 메서드
    func execute() {
        self.backup = receiver.clipboard
        receiver.clipboard = receiver.text
    }
}
