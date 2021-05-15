import Foundation

//MARK: - Builder

protocol PizzaBuilder {
    
    func setDough()
    func setSauce()
    func setTopping()
}

class HawaiianPizzaBuilder: PizzaBuilder {
    
    private var product = Pizza()
    
    func reset() {
        product = Pizza()
    }
    
    func setDough() {
        product.createPizza(part: "thin crust")
    }
    
    func setSauce() {
        product.createPizza(part: "mild")
    }
    
    func setTopping() {
        product.createPizza(part: "peperoni")
    }
    
    func retrieveProduct() -> Pizza {
        let result = self.product
        reset()
        return result
    }
}

class SpicyPizzaBuilder: PizzaBuilder {
    
    private var product = Pizza()
    
    func reset() {
        product = Pizza()
    }
    
    func setDough() {
        product.createPizza(part: "pan baked")
    }
    
    func setSauce() {
        product.createPizza(part: "chili")
    }
    
    func setTopping() {
        product.createPizza(part: "peperoni+ham")
    }
    
    func retrieveProduct() -> Pizza {
        let result = self.product
        reset()
        return result
    }
}

class Pizza {
    
    private var pizzaParts = [String]()
    
    func createPizza(part: String) {
        self.pizzaParts.append(part)
    }
    
    func listParts() -> String {
        return "Pizza with: " + pizzaParts.joined(separator: ", ") + "\n"
    }
}

class Director {
    
    private var builder: PizzaBuilder?
    
    func update(builder: PizzaBuilder) {
        self.builder = builder
    }
    
    func builPizza() {
        builder?.setDough()
        builder?.setSauce()
        builder?.setTopping()
    }
}

class Client {
    static func createHawaiianPizza(director: Director) {
        let builder = HawaiianPizzaBuilder()
        director.update(builder: builder)
        director.builPizza()
        print(builder.retrieveProduct().listParts())
    }
    
    static func createSpicyPizza(director: Director) {
        let builder = SpicyPizzaBuilder()
        director.update(builder: builder)
        director.builPizza()
        print(builder.retrieveProduct().listParts())
    }
}

let dir = Director()
Client.createHawaiianPizza(director: dir)
Client.createSpicyPizza(director: dir)

//MARK: - Abstract factory

protocol FurnitureFactoryProtocol {
    func createChair() -> ChairFactoryProtocol
    func createTable() -> TableFactoryProtocol
}

protocol ChairFactoryProtocol {
    func makeChair() -> String
}

protocol TableFactoryProtocol {
    func makeTable() -> String
}

class ChairFactory: FurnitureFactoryProtocol {
    
    func createChair() -> ChairFactoryProtocol {
        return ModernChair()
    }
    
    func createTable() -> TableFactoryProtocol {
        return ModernTable()
    }
    
}

class TableFactory: FurnitureFactoryProtocol {
    func createChair() -> ChairFactoryProtocol {
        return BackChair()
    }
    
    func createTable() -> TableFactoryProtocol {
        return TableCurbstone()
    }
}

class ModernChair: ChairFactoryProtocol {
    func makeChair() -> String {
        return "Очень удобное кресло готово"
    }
}

class ModernTable: TableFactoryProtocol {
    func makeTable() -> String {
        return "Новый стол в стиле модерн"
    }
}

class TableCurbstone: TableFactoryProtocol {
    func makeTable() -> String {
        return "Стол с тумбой готов"
    }
}

class BackChair: ChairFactoryProtocol {
    func makeChair() -> String {
        return "Кресло с мягкой спинкой"
    }
}

class ClientFactory {
    static func makeSomeFurniture(factory: FurnitureFactoryProtocol) {
        let chair = factory.createChair()
        let table = factory.createTable()
        print(chair.makeChair())
        print(table.makeTable())
    }
}

ClientFactory.makeSomeFurniture(factory: ChairFactory())
ClientFactory.makeSomeFurniture(factory: TableFactory())

