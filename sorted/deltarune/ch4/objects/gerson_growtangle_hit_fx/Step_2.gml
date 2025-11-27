if (dir == -1)
    x = obj_growtangle.x + 74;
if (dir == 1)
    x = obj_growtangle.x - 74;
if (sprite_index == spr_gerson_box_hit_fx2)
{
    timer++;
    if (timer == 6)
        instance_destroy();
}
