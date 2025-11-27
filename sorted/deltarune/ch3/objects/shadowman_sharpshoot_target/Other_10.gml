hittable = 0;
vspeed = -12;
gravity = 1;
gravity_direction = 270;
hspeed = 20;
snd_play(snd_hitcar_little);
if (type == 0)
{
    with (obj_shadowman_enemy)
        forceacttype = 1;
    parentid.idlesprite = spr_shadowman_idle_bunny;
    parentid.sparedsprite = spr_shadowman_idle_bunny;
    parentid.darken = 0;
}
if (spare == true && !i_ex(obj_tenna_board4_enemy))
{
    with (parentid)
    {
        image_alpha = 0;
        scr_spareanim();
        scr_recruit();
        scr_monsterdefeat();
        if (object_index == obj_shadowman_enemy)
        {
            x = -9999;
            fsiner = 0;
            flash = 0;
        }
    }
}
alarm[0] = 26;
