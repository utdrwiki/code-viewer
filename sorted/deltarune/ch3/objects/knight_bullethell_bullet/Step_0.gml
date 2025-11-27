image_angle = direction;
timer++;
if (i_ex(obj_knight_lightorb) && distance_to_object(obj_knight_lightorb) > 110)
{
    image_alpha -= 0.2;
    if (image_alpha <= 0)
        instance_destroy();
}
if (i_ex(obj_knight_lightorb))
    depth = obj_knight_lightorb.depth - 10;
if (timer == 20)
    instance_destroy();
if (i_ex(obj_knight_enemy) && global.turntimer < 1)
    instance_destroy();
