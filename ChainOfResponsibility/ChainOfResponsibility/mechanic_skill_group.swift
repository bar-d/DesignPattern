//
//  mechanic_skill_group.swift
//  Mechanic - Chain Of Responsibility
//
//  Created by Kiwon Song on 2022/09/20.
//

import Foundation
// 공통된 기술 수준을 가진 그룹을 나타내는 객체 해당 객체는 다음 레벨 기술그룹의 레퍼런스를 가지고 있다.
class MechanicSkillGroup {
    
    var mechanics: [Mechanic]
    var nextLevel: MechanicSkillGroup? // 마스터 레벨의 경우 다음 레벨이 없기 때문에 옵셔널 처리
    var skill: Skill
    
    init(skill: Skill, mechanics: [Mechanic], nextLevel: MechanicSkillGroup?) {
        self.mechanics = mechanics
        self.skill = skill
        self.nextLevel = nextLevel
    }
    // 해당 그룹내에서 작업을 할 수 있을지 판단하고 못한다면 다음 레벨로 넘기는 메서드
    func firstAvailableMechanicForJobWithSkillLevel(job: Job) -> Bool {
        if (job.minimumSkillSet > skill || mechanics.filter({!$0.isBusy}).isEmpty) {
            if let nextLevel = nextLevel {
                return nextLevel.firstAvailableMechanicForJobWithSkillLevel(job: job)
            } else {
                print("해당일을 할 수 있는 사람이 부족 합니다")
                return false
            }
        } else {
            if let firstAvailableMechanic = mechanics.filter({!$0.isBusy}).first {
                return firstAvailableMechanic.performJob(job: job)
            }
            return false
        }
    }
}
