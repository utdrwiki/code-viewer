if (made == 0)
{
    for (i = 0; i < 4; i += 1)
    {
        son[i] = instance_create_ch1(x, y, obj_regularbullet_ch1)
        son[i].sprite_index = spr_heartbullet_ch1
        scr_bullet_inherit_ch1(son[i])
    }
    made = 1
}
pausetimer += 1
if (pausetimer >= 10 && con == 0)
{
    move_towards_point((obj_heart_ch1.x + 8), (obj_heart_ch1.y + 8), 7)
    con = 1
}
siner += 1
if (maxlength < 40)
    maxlength += 4
for (i = 0; i < 4; i += 1)
{
    if instance_exists(son[i])
    {
        son[i].x = (x + lengthdir_x(maxlength, ((siner * 3) + (i * 90))))
        son[i].y = (y + lengthdir_y(maxlength, ((siner * 3) + (i * 90))))
    }
}
