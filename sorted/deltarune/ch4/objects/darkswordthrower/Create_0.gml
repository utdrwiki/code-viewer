Sword = function(arg0 = 0, arg1 = 1)
{
    for (var s = 0; s < arg1; s++)
    {
        var _sword = instance_create(bbox_left + arg0 + (40 * s), 40, obj_overworld_knight_sword2);
        with (_sword)
        {
            placed = true;
            cameratrack_x = false;
            spring_length = other.spring_length;
            murder = other.murder;
            damage = other.damage;
            target = other.target;
            heavy = other.heavy;
        }
    }
};

murder = false;
damage = (global.maxhp[1] * 0.5) / 6;
target = 0;
spring_length = 40;
heavy = false;
