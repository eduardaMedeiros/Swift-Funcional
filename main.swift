let strings = ["a", "b", "c"]
let numbers = [1, 2, 3, 4, 5]
let names = ["Alice", "Bob", "Clara", "Dave", "Eve", "Frank"]

// Definindo funções de operações matemáticas
func add(_ a: Int, _ b: Int) -> Int {
    return a + b
}

func subtract(_ a: Int, _ b: Int) -> Int {
    return a - b
}

func multiply(_ a: Int, _ b: Int) -> Int {
    return a * b
}

// Atribuindo a função add a uma variável
let operation: (Int, Int) -> Int = add

// Chamando a função através da variável
let result = operation(3, 4) // Retorna 7
print("Resultado da operação: \(result)")

// Função que recebe outra função como parâmetro para executar uma operação
func executeOperation(_ a: Int, _ b: Int, operation: (Int, Int) -> Int) -> Int {
    return operation(a, b)
}

// Chamando executeOperation com diferentes funções como parâmetro
let sum = executeOperation(6, 2, operation: add)       
let sub = executeOperation(6, 2, operation: subtract) 
let mult = executeOperation(6, 2, operation: multiply)

print("Soma: \(sum)")
print("Subtração: \(sub)")
print("Multiplicação: \(mult)")

let customOperation = executeOperation(6, 2, operation: { (a: Int, b: Int) -> Int in
    return a + b * 2 // Operação personalizada
})
print("Operação personalizada: \(customOperation)") // Resultado: 10

// Função de alta ordem que aplica uma transformação a cada elemento de um array
func applyTransformation<T>(_ array: [T], _ transform: (T) -> T) -> [T] {
    return array.map(transform)
}

// Exemplo de uso com Integers
let doubledNumbers = applyTransformation(numbers) { $0 * 2 } // [2, 4, 6, 8, 10]

// Exemplo de uso com Strings
let uppercasedStrings = applyTransformation(strings) { $0.uppercased() } // ["A", "B", "C"]

print("Números dobrados: \(doubledNumbers)")
print("Strings maiúsculas: \(uppercasedStrings)")

let doubled = numbers.map { $0 * 2 }
print("Map - Números dobrados: \(doubled)") // [2, 4, 6, 8, 10]

let evenNumbers = numbers.filter { $0 % 2 == 0 }
print("Filter - Números pares: \(evenNumbers)") // [2, 4]

let total = numbers.reduce(0, +)
print("Reduce - Soma dos números: \(total)") // 15

// Exemplo de encadeamento
let chaining = numbers
    .map { $0 * 2 }         // Dobra cada número
    .filter { $0 > 5 }      // Mantém apenas números maiores que 5
    .reduce(0, +)           // Soma os valores restantes

print("Encadeamento - Cálculo final: \(chaining)") // Resultado: 24

let formatted = names
    .map { $0.uppercased() }            // Converte cada nome para maiúsculas
    .filter { $0.count > 4 }             // Filtra nomes com mais de 4 letras
    .joined(separator: ", ")             // Concatena nomes em uma única string

print("Encadeamento - Nomes formatados: \(formatted)") //Resultado: ALICE, CLARA, FRANK

// Função que retorna uma nova função com o primeiro valor fixo
func partialMultiply(by factor: Int) -> (Int) -> Int {
    return { number in multiply(factor, number) }
}

// Usando a função parcial
let multiplyBy3 = partialMultiply(by: 3) // Nova função com o fator 3 fixo
let product = multiplyBy3(4) // Multiplica 3 por 4, resultado é 12

print("Função Parcial - Multiplicação por 3: \(product)")

// Função de soma currificada
func curriedAdd(_ a: Int) -> (Int) -> Int {
    return { b in a + b }
}

// Usando a função curried
let addFive = curriedAdd(5)    // Nova função com o primeiro valor fixo como 5
let addResult = addFive(3)        // Soma 5 e 3, resultado é 8

print("Currying - Soma: \(addResult)")

// Função de calcular volume currificada
func curriedVolume(length: Double) -> (Double) -> (Double) -> Double {
    return { width in
        return { height in
            return length * width * height
        }
    }
}

let length5 = curriedVolume(length: 5)      // Define uma função parcial com length = 5
let length5Width3 = length5(3)              // Define uma função parcial com width = 3
let volume = length5Width3(2)               // Calcula o volume com height = 2

print("Currying - Volume: \(volume)") // Volume: 5 * 3 * 2 = 30


