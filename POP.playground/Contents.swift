import UIKit

protocol Airplane:CustomStringConvertible {
    var canFly: Bool { get }
    var name: String { get }
}

protocol AirPlaneWithMotor {
    var maximumSpeed: Double { get }
}

struct AirBus: Airplane, AirPlaneWithMotor {

    var canFly: Bool
    var name: String
    var maximumSpeed: Double {
        1000 - maximumCapacity
    }
    
    let maximumCapacity: Double
    let Distance: Float
    
}

let airPlane = AirBus(canFly: true, name: "747", maximumCapacity: 250, Distance: 27000)
print("The airplane \(airPlane.name) has maximum speed: \(airPlane.maximumSpeed)km/h")

struct ManutentionAirPlane: Airplane {
    var canFly: Bool = false
    
    var name: String
    
}

let manutentionAirPlane = ManutentionAirPlane(name: "707")
print("the airplane \(manutentionAirPlane.name) is in manutention")

extension Airplane {
    var canFly: Bool { self is Airplane }
}

struct Embraair: Airplane, AirPlaneWithMotor{
    var name: String
    var capacity: Double
    var maximumSpeed: Double {
        1230 - capacity
    }
    
}

struct BrokeAirplane: Airplane {
    var name: String
}

let embrair = Embraair(name: "falcon", capacity: 25)
print("Embrair \(embrair.name) pode voar \(embrair.canFly ? "sim" : "não")")

let brokeAirPlane = BrokeAirplane(name: "727")
print("Embrair \(brokeAirPlane.name) pode voar \(brokeAirPlane.canFly == false ? "sim" : "não")")

enum AirPlane707: Airplane {

    case american
    case northAmerican
    case unknown
    
    var name: String {
        switch self {
        case .american:
            return "made in america"
        case .northAmerican:
            return "made in northAmerica"
        case .unknown:
            return "airplane"
        }
    }
    
    var maximumSpeed: Double {
        switch self {
        case .american:
            return 12522.9
        case .northAmerican:
            return 27222.3
        case .unknown:
            return 0.0
        }
    }
    
}

extension AirPlane707 {
    var canFly: Bool {
        self != .unknown
    }
}

AirPlane707.unknown.canFly
AirPlane707.american.canFly


extension CustomStringConvertible where Self: Airplane {
    
    var description: String {
        canFly ? "can fly" : "in manutention"
    }
    
}

print(AirPlane707.american)
print(AirPlane707.unknown)


class Kart {
    var name: String
    var speed: Double
    
    init(name: String, speed: Double) {
        self.name = name
        self.speed = 82.7
    }
}

protocol Race {
    var speed: Double { get }
}

extension AirPlane707: Race {
    
    var speed: Double {
        maximumSpeed
    }
}

extension BrokeAirplane: Race {
    
    var speed: Double {
        canFly ? 0.0 : 1.0
    }
}

extension Kart: Race {
    
}

let kartRacer: [Race] = [
    AirPlane707.american,
    AirPlane707.northAmerican,
    AirPlane707.unknown,
    Kart(name: "piloto 1 ", speed: 87.9)
]

func maximumSpeed(of kartRacer: [Race]) -> Double {
    kartRacer.max (by: { $0.speed < $1.speed })?.speed ?? 0.0
}

print("maximum speed \(maximumSpeed(of: kartRacer))")


extension Sequence where Iterator.Element == Race {
    
    func maxSpeed() -> Double {
        self.max (by: { $0.speed < $1.speed })?.speed ?? 0.0
    }
    
}

print("top speed \(kartRacer.maxSpeed())")


protocol Change {
    mutating func improve(_ power: Double)
}

struct SwiftChange: Airplane {
    var name: String {
        "Change Swift"
    }
    
    var canFly: Bool = true
    
    private var speedFactor = 1234.44
    
}

extension SwiftChange: Change {
    mutating func improve(_ power: Double) {
        speedFactor += 9234
    }
    
}
