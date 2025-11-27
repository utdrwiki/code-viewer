function Vector3(arg0 = 0, arg1 = 0, arg2 = 0) constructor
{
    static add = function(arg0)
    {
        x += arg0.x;
        y += arg0.y;
        z += arg0.z;
    };
    
    static scale = function(arg0)
    {
        x *= arg0.x;
        y *= arg0.y;
        z *= arg0.z;
    };
    
    x = arg0;
    y = arg1;
    z = arg2;
    
    direction = function(arg0, arg1)
    {
        return point_direction(0, 0, arg0, arg1);
    };
    
    magnitude = function(arg0, arg1, arg2)
    {
        return point_distance_3d(0, 0, 0, arg0, arg1, arg2);
    };
    
    normalized = function(arg0, arg1, arg2)
    {
        var __len = point_distance_3d(0, 0, 0, arg0, arg1, arg2);
        if (arg0 == 0 && arg1 == 0 && arg2 == 0)
            return new Vector3();
        return new Vector3(arg0 / __len, arg1 / __len, arg2 / __len);
    };
}

function getxyz(arg0)
{
    return new Vector3(arg0.x, arg0.y, arg0.z);
}

function setxyz_v3(arg0)
{
    x = arg0.x;
    y = arg0.y;
    z = arg0.z;
}
