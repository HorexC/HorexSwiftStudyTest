//: Playground - noun: a place where people can play

import Cocoa

/***      Access Control      **/

public class SomePublicClass {
    public var somePublicProperty = 0
    var someInternalProperty = 0
    private func somePrivateMethod() {}
}

internal class SomeInternalClass{
    var someInternalPropery = 0
    private func somePrivateMethod() {}
}
private class SomePrivateClass{
    var somePrivateProperty = 0
    private func somePrivateMethod() {}
}

public var somPulicVariable = 0
internal let someInternalConstant = 0
private func somePrivateFunction() {}


/***      元组是该数组中最低的访问权限      **/

private func someFunction() -> (SomeInternalClass, SomePrivateClass)? {
    return nil
}

public enum CompassPoint {
    case North
    case South
    case East
    case West
}


/***      嵌套类型自动拥有该嵌套的访问级别      **/

public class A {
    private func someMethod() {}
}

internal class B: A {
    override internal func someMethod() {
        super.someMethod()
    }
}

private var privateInstance = SomePrivateClass()

public struct TrackedString {
    public private(set) var numberOfEdits = 0
    public var value: String = "" {
        didSet {
            numberOfEdits++
        }
    }
    public init() {
        
    }
}

/*
初始化

我们可以给自定义的初始化方法申明访问级别，但是要不高于它所属类的访问级别。但必要构造器例外，它的访问级别必须和所属类的访问级别相同。

如同函数或方法参数，初始化方法参数的访问级别也不能低于初始化方法的访问级别。

默认初始化方法

Swift为结构体、类都提供了一个默认的无参初始化方法，用于给它们的所有属性提供赋值操作，但不会给出具体值。默认初始化方法可以参阅默认构造器。默认初始化方法的访问级别与所属类型的访问级别相同。

注意：如果一个类型被申明为public级别，那么默认的初始化方法的访问级别为internal。如果你想让无参的初始化方法在其他模块中可以被使用，那么你必须提供一个具有public访问级别的无参初始化方法。

结构体的默认成员初始化方法

如果结构体中的任一存储属性的访问级别为private，那么它的默认成员初始化方法访问级别就是private。尽管如此，结构体的初始化方法的访问级别依然是internal。

如果你想在其他模块中使用该结构体的默认成员初始化方法，那么你需要提供一个访问级别为public的默认成员初始化方法。

协议

如果想为一个协议明确的申明访问级别，那么需要注意一点，就是你要确保该协议只在你申明的访问级别作用域中使用。

协议中的每一个必须要实现的函数都具有和该协议相同的访问级别。这样才能确保该协议的使用者可以实现它所提供的函数。

注意：如果你定义了一个public访问级别的协议，那么实现该协议提供的必要函数也会是public的访问级别。这一点不同于其他类型，比如，public访问级别的其他类型，他们成员的访问级别为internal。

协议继承

如果定义了一个新的协议，并且该协议继承了一个已知的协议，那么新协议拥有的访问级别最高也只和被继承协议的访问级别相同。比如说，你不能定义一个public的协议而去继承一个internal的协议。

协议一致性

类可以采用比自身访问级别低的协议。比如说，你可以定义一个public级别的类，可以让它在其他模块中使用，同时它也可以采用一个internal级别的协议，并且只能在定义了该协议的模块中使用。

采用了协议的类的访问级别取它本身和所采用协议中最低的访问级别。也就是说如果一个类是public级别，采用的协议是internal级别，那么采用了这个协议后，该类的访问级别也是internal。

如果你采用了协议，那么实现了协议所必须的方法后，该方法的访问级别遵循协议的访问级别。比如说，一个public级别的类，采用了internal级别的协议，那么该类实现协议的方法至少也得是internal。

注意：Swift和Objective-C一样，协议的一致性保证了一个类不可能在同一个程序中用不同的方法采用同一个协议。

扩展

你可以在条件允许的情况下对类、结构体、枚举进行扩展。扩展成员应该具有和原始类成员一致的访问级别。比如你扩展了一个公共类型，那么你新加的成员应该具有和原始成员一样的默认的internal访问级别。

或者，你可以明确申明扩展的访问级别（比如使用private extension）给该扩展内所有成员申明一个新的默认访问级别。这个新的默认访问级别仍然可以被单独成员所申明的访问级别所覆盖。

协议的扩展

如果一个扩展采用了某个协议，那么你就不能对该扩展使用访问级别修饰符来申明了。该扩展中实现协议的方法都会遵循该协议的访问级别。

泛型

泛型类型或泛型函数的访问级别取泛型类型、函数本身、泛型类型参数三者中的最低访问级别。

类型别名

任何你定义的类型别名都会被当作不同的类型，以便于进行访问控制。一个类型别名的访问级别不可高于原类型的访问级别。比如说，一个private级别的类型别名可以设定给一个public、internal、private的类型，但是一个public级别的类型别名只能设定给一个public级别的类型，不能设定给internal或private 级别的类型。
*/

