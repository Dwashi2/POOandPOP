import UIKit


class Car {
    var year: Int!
    var model: String!
    var color: String!
}

class Mitsubishi {
    var year: Int!
    var model: String!
    var color: String!
    
    func turnOn(turnTheKey: Bool) {
        
    }
}

class TurnTheCar {
    init() {
        //init
    }
}

class TiresCar {
    var tires: Int
        
    init() {
        tires = 4
        print("o carro tem 4 pneus")
    }
    
}


var tiresCar = TiresCar()


class NewColorCar {
    var color: String
    
    init(color: String) {
        self.color = color
        print("the color is \(color)")
    }
}

var newColor = NewColorCar(color: "black")


class NewModel {
    var model: String
    var year: Int
    
    init(model: String, year: Int) {
        self.model = model
        self.year = year
        print("a tentativa deu \(drive())")
    }
    
    
    func drive() -> Bool {
        if model == "Lancer" {
            return true
        } else {
            return false
        }
        
    }
}

var tryDrive = NewModel(model: "Lancer", year: 2016)
var failTryDrive = NewModel(model: "Mobi", year: 2006)


class CarYear {
    var year: Int
    
    init(){
        year = 2020
    }
    
    init(year: Int){
        self.year = year
    }
    
    func getYear() -> Int {
        return year
    }
}

var carYear = CarYear()
print("Car model age:", carYear.getYear())
var carNewYear = CarYear(year: 2022)
print("car new model age:", carNewYear.getYear())


//inicializador secundario
class Bank {
    var name: String
    var ranking: String
    
    init(name: String, ranking: String){
        self.name = name
        self.ranking = ranking
    }
    
    convenience init() {
        self.init(name: "Itau", ranking: "25")
    }
}

var bank = Bank()
print(bank.name)
print(bank.ranking)


//inicializador Opcional

class TestFiles {
    var folder: String
    
    init?(folder: String) {
        if folder.isEmpty {
            print("Folder is empty")
            return nil
        }
        self.folder = folder
    }
}

var files = TestFiles(folder: "")
if let files {
    print("testing the folder")
} else {
    print("error, not found")
}
 
//struct nao tem inicializador
struct CarStruct {
    var model: String
    var year: Int
}

var carStruct = CarStruct(model: "L200", year: 2023)
print(carStruct)
print(carStruct.model)


//Encapsulamento

class Size {
    let X: Int!
    let Y: Int!
    
    private var result: Int?
    
    init(X: Int, Y: Int) {
        self.X = X
        self.Y = Y
    }
    
    func mult() {
        result = X * Y
    }
    
    func printResult() {
        print("Result of X * Y = \(result ?? 0 )")
    }
}

let calc = Size(X: 5, Y: 6)
calc.mult()
calc.printResult()

open class OpenTestClass {
    open var year = 2006
    open func driveOpen(car: String) {}
}

public class PublicTestClass{
    public var year = 2003
    public func drivePublic(car: String) {}
}

internal class InternalTestClass {
    internal var year = 2012
    internal func driveInternal(car: String) {}
}

fileprivate class FileprivateTestClass {
    fileprivate var year = 2002
    fileprivate func driveFileprivate(car: String) {}
}

private class PrivateTestClass {
    private var year = 2000
    private func drivePrivate(car: String) {}
}


//Herança

class Fish {
    var color: String
    var size: Int
    var temperature: Int
    var ph: Double
    
    init(color: String, size: Int, temperature: Int, ph: Double) {
        self.color = color
        self.size = size
        self.temperature = temperature
        self.ph = ph
    }
    
    func canBreathOutOfWater(species: String) {
        switch species {
        case "bagre":
            print("can breather out of water")
        case "beta":
            print("can breather out of water")
        default:
            print("can not breather out of water")
        }
    }
    
    func nameOfSpecies(species: String) {
        print("the species is \(species)")
    }
}


class MyFish: Fish {
    
}


let myFish = MyFish(color: "gray", size: 10, temperature: 26, ph: 7.4)
print(myFish.color)

class Bagre: Fish {
    override func nameOfSpecies(species: String) {
        if species == "bagre" {
            print("it is a bagre")
        }
        
    }
}

let myBagre = Bagre(color: "gray", size: 10, temperature: 25, ph: 7.4)
myBagre.nameOfSpecies(species: "bagre")


class Betta: Fish {
    override func canBreathOutOfWater(species: String) {
        if species == "betta" {
            print("it is a good fish")
        }
    }
}

let myBetta = Betta(color: "blue", size: 4, temperature: 20, ph: 6.0)
myBetta.canBreathOutOfWater(species: "betta")


//polimorfismo
class PlayerOne {
    let name: String
    init(name: String) {
        self.name = name
    }
    
    func play() {
        print("inicial")
    }
}

class Batsman: PlayerOne {
    override func play() {
        bat()
    }
    
    private func bat() {
        print("\(name) está rebatendo")
    }
}

class Bowler: PlayerOne {
    
    override func play() {
        bowl()
    }
    
    private func bowl() {
        print("\(name) está jogando boliche")
    }
    
}

class CricketTeam {
    let name: String
    let team: [PlayerOne]
    
    init(name: String, team: [PlayerOne]) {
        self.name = name
        self.team = team
    }
    
    func play() {
        team.forEach { $0.play() }
    }
    //clouser
    func calc(n1: Int, n2: Int, operation: (Int, Int) -> Int) ->  Int {
        return operation(n1, n2)
    }
    
}

let maria = Batsman(name: "Maria")
let pedro = Bowler(name: "Pedro")
let rioCricket = CricketTeam(name: "Rio Cricket", team: [maria,pedro])

rioCricket.play()

let result = rioCricket.calc(n1: 2, n2: 3, operation: {$0 * $1})
print(result)


class Soccer {
    var teamName: String
    var numberOfPlayer: String
    var victoryNumber: Int
    var drawNumber: Int
    var defeatNumber: Int
    var playerNamer: String
    var enjure: Bool
    var salary: Float
    var division: [String]
    
    init(teamName: String, numberOfPlayer: String, victoryNumber: Int, drawNumber: Int, defeatNumber: Int, playerNamer: String, enjure: Bool, salary: Float, division: [String]) {
        self.teamName = teamName
        self.numberOfPlayer = numberOfPlayer
        self.victoryNumber = victoryNumber
        self.drawNumber = drawNumber
        self.defeatNumber = defeatNumber
        self.playerNamer = playerNamer
        self.enjure = enjure
        self.salary = salary
        self.division = division
    }
    
    func checkDivision(division: [String]){
        for i in division {
            if i == "A" {
                print("it is a good team")
            } else if i == "B" {
                print("could be better")
            } else {
                print("it is not a good team")
            }
        }
    }
    
    func checkVictoryNumber(victoryNumber: Int) {
        var numbers = victoryNumber
        while numbers < 0 {
            print(numbers)
            numbers = numbers - 1
        }
    }
    
    func checkEnjure(enjure: Bool) {
        switch enjure {
        case true:
            print("the player is ok")
        case false:
            print("need a doctor")
        default:
            print("cannot check")
        }
    }
    
    
    func points(n1: Int, n2: Int, operation: (Int, Int) -> Int) ->  Int {
        return operation(n1, n2)
    }
}

let soccer = Soccer(teamName: "Bat", numberOfPlayer: "4", victoryNumber: 10, drawNumber: 2, defeatNumber: 5, playerNamer: "20", enjure: false, salary: 10.00, division: ["A","B"])

let soccerPoints = soccer.points(n1: 10, n2: 3, operation: {$0 + $1})
print(soccerPoints)


enum Rank: Int {
    case idade = 1
    case ronaldo
    
    func description() -> String {
        switch self {
        case .idade:
            return "idade"
        case .ronaldo:
            return "ronaldo"
        default:
            return "nao encontrei"
        }
    }
}

let idade = Rank.idade
let idadeRawValue = idade.rawValue


struct Player {
    var rank: Rank
    
    func descriptionStruct() -> String {
        return "Nome do jogardor \(rank.description())"
    }
}


let jogador = Player(rank: .ronaldo)


//Concorrencias
let startTime = CFAbsoluteTimeGetCurrent()
DispatchQueue.global().sync {
    for i in 0...5 {
        print("\(i)")
    }
}


DispatchQueue.global().sync {
    for i in 0...80 {
        print("ate 80 - \(i)")
    }
}

//DispatchQueue.main.sync {
//    //playground nao tem main thread
//}

func buscarUsuarios(from server: String) async -> Int {
    if server == "servidor" {
        return 200
    }
    return 400
}

func buscarNome(from server: String) async -> String {
    let id = await buscarUsuarios(from: server)
    if id == 502 {
        return "achei o usuario"
    }
    return "nao encontrado"
}


func coneccao(to server: String) async {
    async let id = buscarNome(from: server)
    async let usuario = buscarUsuarios(from: server)
    let ola = await "oi \(usuario), do id \(id)"
    print(ola)
}

Task {
    await coneccao(to: "servidor")
}


func dowload() async -> Int {
    do {
        try await Task.sleep(until: .now + .seconds(2), clock: .continuous)
        return 1
    }catch {}
    return 0
}

Task {
    async let dow = dowload()
    async let dowl = dowload()
    async let dowld = dowload()
    
    let final = await [dow, dowl, dowld]
}

Task {
    await withTaskGroup(of: Data.self) {
        TaskGroup in let teste = await dowload()
    }
}

actor Temp {
    let label: String
    var id: [Int]
    private(set) var max: Int
    
    init(label: String, id: [Int], max: Int) {
        self.label = label
        self.id = id
        self.max = max
    }
}

Task {
    let conts = Temp(label: "tempo de chuva", id: [1], max: 2)
    print(await conts.max)
}


extension Temp {
    func checkId(with id: Int) {
        if max > 0 {
            print("sim")
        }
        print("nao")
    }
}

struct TempStr: Sendable {
    var id: Int
}

extension Temp {
    func update(from reading: TempStr) {
        max = reading.id
    }
}

Task {
    let temp = Temp(label: "teste", id: [1], max: 3)
}


var myArray: [Int] = []
myArray.append(1)
myArray.removeAll()
myArray.append(2)
myArray.removeLast()
myArray.append(4)


var list: [String] = ["primeiro", "segundo"]

if list.isEmpty {
    print("vazio")
} else {
    print(list)
}

list.append("terceiro")

list += ["quarto"]
list += ["quinto", "sexto"]

print(list)

var myFirst = list[0]

list[0] = "mais"
print(list)
print(list.count)

list[0...2] = ["teste1", "teste2"]
print(list)
list.insert("penultimo", at: 4)
print(list)
list.remove(at: 5)

for item in list {
    print(item)
}

for (index, value) in list.enumerated() {
    print("\(index), \(value)")
}


var camisa = Set<String>()
print(camisa)
camisa.insert("branca")
print(camisa)
camisa = []
print(camisa)

var camisaFavorita: Set<String> = ["Preta", "Branca", "Azul"]
var novoCamisaFavorita: Set = ["Preta", "Branca", "Azul"]

if camisaFavorita.isEmpty {
    print("array vazio")
} else {
    print("array tem valor")
}

camisaFavorita.insert("Amarela")

if let remove = camisaFavorita.remove("Azul") {
    print("\(remove) foi retirado")
} else {
    print("valor nao encontrado")
}
    
print(camisaFavorita)

if camisaFavorita.contains("Preta") {
    print("encontrei")
} else {
    print("nao encontrei")
}

for item in camisaFavorita {
    print(item)
}

for item in camisaFavorita.sorted() {
    print(item)
}
