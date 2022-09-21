//
//  PastCommand.swift
//  command
//
//  Created by Baek on 2022/09/20.
//

import Foundation

// Concrete Command 붙여넣기 기능 클래스입니다
class PasteCommand: Command {
    var receiver: TextEditor
    var backup: String
    
    init(receiver: TextEditor) {
        self.receiver = receiver
        self.backup = self.receiver.clipboard
    }
    
    //실행취소 메서드
    func undo() {
        let startIndex = receiver.text.startIndex
        let lastIndex = receiver.text.index(startIndex, offsetBy: receiver.text.count - backup.count)
        receiver.text = String(receiver.text[startIndex..<lastIndex])
    }
    
    //복사 메서드
    func execute() {
        self.receiver.text += backup
    }
}
