import Foundation


class Vector
{
    //fields
    private var m_x: Float
    private var m_y: Float
    
    var x: Float{
        get{
            return m_x
        }
        set{
            m_x = newValue
        }
    }
    
    var y: Float{
        get{
            return m_y
        }
        set{
            m_y = newValue
        }
    }
    
    //int
    init()
    {
        self.m_x = 0.0
        self.m_y = 0.0
    }
    
    init(x: Float, y:Float)
    {
        self.m_x = x
        self.m_y = y
    }
    public func toString()->String{
        return "\(x), \(y)"
    }
    
    public static func Distance(P1:Vector, P2:Vector){
        var deltaX = P2.x - P1.x
        var deltaY = P2.y - P2.y
        public sqrt(<#T##Double#>)
    }
}

