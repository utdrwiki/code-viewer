function Vector2(arg0 = 0, arg1 = 0) constructor
{
    static add = function(arg0)
    {
        x += arg0.x;
        y += arg0.y;
    };
    
    static scale = function(arg0)
    {
        x *= arg0.x;
        y *= arg0.y;
    };
    
    x = arg0;
    y = arg1;
    
    direction = function(arg0, arg1)
    {
        return point_direction(0, 0, arg0, arg1);
    };
    
    magnitude = function(arg0, arg1)
    {
        return point_distance(0, 0, arg0, arg1);
    };
    
    normalized = function(arg0, arg1)
    {
        var __len = point_direction(0, 0, arg0, arg1);
        if (arg0 == 0 && arg1 == 0)
            return new Vector2();
        return new Vector2(arg0 / __len, arg1 / __len);
    };
}
