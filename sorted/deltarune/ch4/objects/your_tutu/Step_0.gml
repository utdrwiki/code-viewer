if (attached)
{
    x = obj_heart.x + 1;
    y = obj_heart.y + 5;
}
if (vanished == 1 && place_meeting(x, y, obj_ghosthouse_jackolantern))
{
    vanished = 2;
    visible = false;
    with (obj_ghosthouse_jackolantern)
    {
        tutu = true;
        active = false;
        damage = 0;
    }
}
if (instance_exists(obj_ghosthouse_jackolantern) && vanished == 1)
    depth = obj_ghosthouse_jackolantern.depth + 1;
