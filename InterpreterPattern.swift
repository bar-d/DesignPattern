
// MARK: - Abstract Expression
// Abstract Syntax Tree의 모든 노드에서 사용할 Interpreter 작업을 정의

protocol IntegerExpression {
    func evaluate(_ context: IntegerContext) -> Int
}

// MARK: - Context
// InterPreter가 해석할 문장

final class IntegerContext {
    private var data: [Character:Int] = [:]

    // 각 Character별로 Int값을 key value로 대입
    func assign(expression: IntegerVariableExpression, value: Int) {
        self.data[expression.name] = value
    }
    
    // 위에서 assign으로 값을 넣어주고 lookup 메서드로 Character값으로 해당 value인 Int값 찾기
    func lookup(name: Character) -> Int {
        return self.data[name]!
    }
}

// MARK: - Terminal Experssion
// 터미널 기호와 관련된 작업을 구현함
// 여기서 말하는 터미널 기호라고 함은 어떤 문장에서 의미있는 최소의 단위
// 일종의 단위를 재가공 하는 작업 ex) Int -> String, Int -> Double, String -> Int

final class IntegerVariableExpression: IntegerExpression {
    let name: Character

    init(name: Character) {
        self.name = name
    }

    func evaluate(_ context: IntegerContext) -> Int {
        return context.lookup(name: self.name)
    }
}

// MARK: - NonTerminal Experssion
// 하나의 클래스는 문법이 가진 모든 규칙을 필요로 함
// Grammar에서 Nonterminal Symbol에 대한 해석 연산을 구현함
// 재가공 된 단위를 가지고 어떠한 규칙을 만들어서 다시 재가공을 해주는 것 ex) 1 + 2 -> 3, 가 + 나 -> 가나
// 문법이기에 손쉽게 대체 및 추가 가능 ex) 더해주는 규칙을 빼주는 규칙으로 구현부분이 거의 비슷해 쉽게 변경해줄 수 있고(대체),
//                                더해주는 규칙 하나만 있으면 빼주는 규칙도 손쉽게 생성해줄 수 있음(추가)

final class AddExpression: IntegerExpression {
    private var leftOperand: IntegerExpression
    private var rightOperand: IntegerExpression

    init(leftOperand: IntegerExpression, rightOperand: IntegerExpression) {
        self.leftOperand = leftOperand
        self.rightOperand = rightOperand
    }

    func evaluate(_ context: IntegerContext) -> Int {
        return self.leftOperand.evaluate(context) + self.rightOperand.evaluate(context)
    }
}

var context = IntegerContext()

var a = IntegerVariableExpression(name: "A")
var b = IntegerVariableExpression(name: "B")
var c = IntegerVariableExpression(name: "C")

// AddExpression(a, AddExpression(b, c))
// Client
var expression = AddExpression(leftOperand: a, rightOperand: AddExpression(leftOperand: b, rightOperand: c)) // a + (b + c)
context.assign(expression: a, value: 2) // a = 2
context.assign(expression: b, value: 1) // b = 1
context.assign(expression: c, value: 3) // c = 3

var result1 = expression.evaluate(context)  // 6

// MARK: - Client

final class Interpreter {
    // 인터프리터가 해석할 문장
    private var context = IntegerContext()
    
    // Abstract Syntax Tree 문법을 정의하는 특정 문장
    func solve(problems: String) -> Int {
        
        // context가 해석할 수 있도록 String -> Character 형변환
        var problemList: [Character] = problems.map { Character(extendedGraphemeClusterLiteral: $0) }
        
        let firstProblem = problemList.removeFirst()
        let secondProblem = problemList.removeFirst()
        let thirdProblem = problemList.removeFirst()
        
        // Terminal Experssion Instance
        let firstOperand = IntegerVariableExpression(name: firstProblem)
        let secondOperand = IntegerVariableExpression(name: secondProblem)
        let thirdOperand = IntegerVariableExpression(name: thirdProblem)
        
        // NonTerminal Experssion Instance
        let solvedExpression = AddExpression(leftOperand: firstOperand, rightOperand: AddExpression(leftOperand: secondOperand, rightOperand: thirdOperand))
        
        context.assign(expression: firstOperand, value: 1)
        context.assign(expression: secondOperand, value: 2)
        context.assign(expression: thirdOperand, value: 3)
        
        let result = solvedExpression.evaluate(context)
        
        return result
    }
}

let interpreter = Interpreter()
//interpreter.solve(problems: "123") // 6
interpreter.solve(problems: "CBC")






// first operand와 third operand의 value는 다른데 왜 third operand의 value로 둘다 저장이 될까




// key value값으로 assign해주었기에 처음 3은 1로 값이 들어갔지만 마지막에 3으로 다시 변경이됨
