//
//  main.swift
//  command
//
//  Created by Baek on 2022/09/20.
//

import Foundation

let invoker = Invoker() //호출자
let receiver = TextEditor() //수신자

//호출자가 쓰기기능을 호출해서 수신자가 받은후 Print
invoker.executeCommand(command: WriteCommand(receiver: receiver, backup: "ABC"))
print(receiver.text) //ABC

invoker.executeCommand(command: CopyCommand(receiver: receiver))
invoker.executeCommand(command: PasteCommand(receiver: receiver)) //ABCABC
print(receiver.text)

invoker.executeCommand(command: WriteCommand(receiver: receiver, backup: "ZZZ")) // ABCABCZZZ
print(receiver.text)

invoker.executeCommand(command: PasteCommand(receiver: receiver))
print(receiver.text) // ABCABCZZZABC

invoker.undoCommand() // ABCABCZZZ
print(receiver.text)

invoker.undoCommand()
print(receiver.text) //ABCABC


