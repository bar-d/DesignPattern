//
//  skill.swift
//  Mechanic - Chain Of Responsibility
//
//  Created by Kiwon Song on 2022/09/20..
//

import Foundation

// 열거형을 통해 기술 수준을 정의
enum Skill: Int, Comparable {
    case OilChangeOnly = 0, Junior, Apprentice, MasterMechanic
}

// 기술 수준의 비교를 위한 메서드
func < (lhs: Skill, rhs: Skill) -> Bool {
    return lhs.rawValue < rhs.rawValue
}

func == (lhs: Skill, rhs: Skill) -> Bool {
    return lhs.rawValue == rhs.rawValue
}
