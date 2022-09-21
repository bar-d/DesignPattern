//
//  shop.swift
//  Mechanic - Chain Of Responsibility
//
//  Created by Kiwon Song on 2022/09/20.
//

import Foundation
// 업무의 가능 여부를 판단 하는 가장 첫번째 그룹을 정하는 역할
class Shop {
    
    private var firstMechanics: MechanicSkillGroup
    
    init(firstMechanics: MechanicSkillGroup) {
        self.firstMechanics = firstMechanics
    }
    // oilChangeOnlyes가 주입될 거임
    func performJob(job: Job) -> Bool {
        return firstMechanics.firstAvailableMechanicForJobWithSkillLevel(job: job)
    }
}
