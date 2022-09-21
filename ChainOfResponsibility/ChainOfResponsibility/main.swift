//
//  main.swift
//  Chain of Resposibility
//
//  Created by Kiwon Song on 2022/09/20.
//

import Foundation

var kakao_JeonMinsu = Mechanic(skill: .MasterMechanic, name: "yagom")
var baekgom = Mechanic(skill: .MasterMechanic, name: "baekgom")
var kiwi = Mechanic(skill: .MasterMechanic, name: "kiwi")
var bard = Mechanic(skill: .MasterMechanic, name: "bard")

var masterMechanics = MechanicSkillGroup(skill: .MasterMechanic,
                                         mechanics: [kakao_JeonMinsu, baekgom, kiwi, bard],
                                         nextLevel: nil)

var groot = Mechanic(skill: .Apprentice, name: "groot")
var bonf = Mechanic(skill: .Apprentice, name: "bonf")
var unchain = Mechanic(skill: .Apprentice, name: "unchain")
var bory = Mechanic(skill: .Apprentice, name: "bory")

var apprenticeMechanics = MechanicSkillGroup(skill: .Apprentice,
                                             mechanics: [groot, bonf, unchain, bory],
                                             nextLevel: masterMechanics)

var yeton = Mechanic(skill: .Junior, name: "yeton")
var judy = Mechanic(skill: .Junior, name: "judy")
var hyun2 = Mechanic(skill: .Junior, name: "hyun2")
var zzbae = Mechanic(skill: .Junior, name: "zzbae")

var juniorMechanics = MechanicSkillGroup(skill: .Junior,
                                         mechanics: [yeton, judy, hyun2, zzbae],
                                         nextLevel: apprenticeMechanics)

var brad = Mechanic(skill: .OilChangeOnly, name: "brad")
var finnn = Mechanic(skill: .OilChangeOnly, name: "finnn")
var wingbong = Mechanic(skill: .OilChangeOnly, name: "wingbong")
var hugh = Mechanic(skill: .OilChangeOnly, name: "hugh")
var derrick = Mechanic(skill: .OilChangeOnly, name: "derrick")
var minsson = Mechanic(skill: .OilChangeOnly, name: "minsson")

var oilChangeOnlyes = MechanicSkillGroup(skill: .OilChangeOnly,
                                         mechanics: [wingbong],
                                         nextLevel: juniorMechanics)

var shop = Shop(firstMechanics: oilChangeOnlyes)

var jobs = [Job(minimumSkillSet: .Junior, name: "앞유리 와이퍼 교체"),
            Job(minimumSkillSet: .Apprentice, name: "전구 교체"),
            Job(minimumSkillSet: .Apprentice, name: "배터리 교체"),
            Job(minimumSkillSet: .OilChangeOnly, name: "오일 교체"),
            Job(minimumSkillSet: .OilChangeOnly, name: "오일 교체"),
            Job(minimumSkillSet: .OilChangeOnly, name: "오일 교체"),
            Job(minimumSkillSet: .OilChangeOnly, name: "오일 교체"),
            Job(minimumSkillSet: .MasterMechanic, name: "엔진 타이밍 벨트 교체"),
            Job(minimumSkillSet: .Junior, name: "브레이크 페드 교체")
]

for job in jobs {
    shop.performJob(job: job)
}
