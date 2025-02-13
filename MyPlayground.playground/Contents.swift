import UIKit

enum ProductType: String, CaseIterable{
    case aceRepository = "Ace Repository"
    case dealEnforcer = "Deal Enforcer"
    case kadancePlanner = "Kandence Planner"
    case mailCannon = "Mail Cannon"
}

print("There are 4 products")

func loop(){
    for product in ProductType.allCases{
        print(product.rawValue)
    }
}
loop()

enum Edition: String, CaseIterable{
    case basic = "Basic"
    case premium = "Premium"
    case ultimate = "Ultimate"
    
    mutating func update(){
        switch self{
        case .basic:
            self = .premium
        case .premium:
            self = .ultimate
        case .ultimate:
            print("Can't go further")
        }
        }
    

}

enum DeliveryMethod{
    case cloudDigital(isLifttime: Bool)
    case shipping(weight: Int)
    var shippingCost: Int{
        switch self{
        case .shipping(let weight):
            return weight * 2
        case .cloudDigital:
            return 0
        }
    }
}

func sendConfirmation(of productType: ProductType, in edition: Edition, by deliverMethod: DeliveryMethod){
    print("thank you for purchasing \(edition.rawValue) of \(productType.rawValue)")
    
    switch deliverMethod{
    case .shipping:
        print("Your order will be shipped to you at \(deliverMethod.shippingCost)")
    case . cloudDigital(let lifeTime):
        if lifeTime{
            print("You have lifetime")
        }
    }
    
}
