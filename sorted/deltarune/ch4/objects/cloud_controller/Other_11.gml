clouds = [];
var _c = 0;
var _dist = 175;
var _cloud_num = 10;
repeat (2)
{
    var _angle = 0;
    repeat (_cloud_num)
    {
        var _cloud = 
        {
            __id: _c,
            base_angle: _angle,
            angle: _angle,
            dist: _dist,
            z_depth: 0,
            x: 0,
            y: 0
        };
        array_push(clouds, _cloud);
        _c++;
        _angle += (360 / _cloud_num);
    }
    _dist += 125;
    _cloud_num += 8;
}
