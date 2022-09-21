//
//  Mechanic.swift
//  Mechanic - Chain Of Responsibility
//
//  Created by Kiwon Song on 2022/09/20.
//

import Foundation

class Mechanic {
    let skill: Skill // 기술 능력 표시
    var name: String // 정비공 이름
    var isBusy: Bool = false // 바쁜지 안바쁜지
    
    init(skill: Skill, name: String, isBusy: Bool = false) {
        self.skill = skill
        self.name = name
        self.isBusy = isBusy
    }
    // 해당 메서드를 통하여 정비공의 기술 능력과 바쁨 여부를 판단
    func performJob(job: Job) -> Bool {
        if job.minimumSkillSet > self.skill || isBusy == true {
            assert(false, "해당 정비사는 바쁘거나 이 일을 처리하기에는 충분이 숙련되지 않았습니다, " +
                   "그는 이 일을 하기에 적합하지 않습니다, " +
                   "chain of responsibility에 문제가 있습니다")
        } else {
            isBusy = true
            print("\(name) 은 \(skill)해당하는 기술을 가지고 있으며 \(job.name)작업을 하고 있습니다")
            job.completed = true
            return true
        }
    }
}
