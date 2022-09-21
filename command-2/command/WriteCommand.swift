//
//  WriteCommand.swift
//  command
//
//  Created by Baek on 2022/09/20.
//

import Foundation

// Concrete Command 쓰기기능 커맨드 입니다
class WriteCommand: Command {
    var receiver: TextEditor
    var backup: String
    
    init(receiver: TextEditor, backup: String) {
        self.receiver = receiver
        self.backup = backup
    }
   
    //실행취소 메서드
    func undo() {
        let startIndex = receiver.text.startIndex
        let lastIndex = receiver.text.index(startIndex, offsetBy: receiver.text.count - backup.count)
        receiver.text = String(receiver.text[startIndex..<lastIndex])
    }
    
    //쓰기 메서드
    func execute() {
        receiver.text += backup
    }
}
