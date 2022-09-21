//
//  job.swift
//  Mechanic - Chain Of Responsibility
//
//  Created by Kiwon Song on 2022/09/20.
//

import Foundation
//요청 작업을 나타내는 객체를 생성

class Job {
    let minimumSkillSet: Skill // 해당 작업을 하는데 필요한 최소한의 기술 능력
    let name: String // 작업의 이름
    var completed: Bool = false // 완료여부
    
    init(minimumSkillSet: Skill, name: String, completed: Bool = false) {
        self.minimumSkillSet = minimumSkillSet
        self.name = name
        self.completed = completed
    }
}
