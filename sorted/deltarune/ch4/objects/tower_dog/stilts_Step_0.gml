y = cameray() + 380 + yoffset;
yoffset += vsp;
vsp += grav;
if (con == 0)
{
    if ((image_index > 0.9 && image_index < 1.1) || (image_index > 3.9 && image_index < 4.1))
        snd_play_x(snd_bump, 0.6, 1.2);
    timer++;
    if ((timer % 30) == 0)
    {
        anim = instance_create(x + 15, y, obj_animation);
        anim.sprite_index = spr_sweat_anim;
        anim.image_xscale = -1;
        anim.image_yscale = 1;
        anim.image_speed = 1/3;
    }
    if (i_ex(obj_animation))
    {
        obj_animation.x = x + 15;
        obj_animation.y = y;
    }
}
if (con == 0 && x < (camerax() + 610) && obj_rotating_tower_controller_new.tower_falls_apart_con != 0)
{
    obj_rotating_tower_controller_new.tower_falls_apart_con = 0;
    obj_rotating_tower_controller_new.tower_falls_apart_i = 0;
    with (obj_rotating_tower_controller)
    {
        for (var i = 0; i < towerpiececount; i++)
            tower_piece_sprite_dog[i] = 4168;
    }
}
if (con == 0 && x < (camerax() + 220))
{
    snd_play_pitch(snd_slidewhistle, 1.3);
    snd_play_pitch(snd_pombark, 0.7);
    stilt = instance_create(x - 14, y + 880, obj_tower_dog_stilts2);
    stilt.image_xscale = 2;
    stilt.image_yscale = 2;
    stilt = instance_create(x + 10, y + 880, obj_tower_dog_stilts2);
    stilt.sprite_index = spr_dog_stilts_long3;
    stilt.image_xscale = 2;
    stilt.image_yscale = 2;
    sprite_index = spr_dog_climb1;
    image_index = 2;
    image_xscale = -2;
    image_speed = 0;
    hspeed = -4;
    timer = 0;
    con = 1;
}
if (con == 1)
{
    timer++;
    if (timer == 5)
    {
        dog = instance_create_depth(0, 0, depth - 10, obj_tower_dog);
        dog.draw_y = y + 20;
        dog.climbfaster = true;
        dog.depth = 99450;
        obj_rotating_tower_controller_new.endclimb = true;
        with (obj_climb_kris)
        {
            forceclimb = true;
            climb_finished = true;
        }
        with (obj_rotating_bullet)
            instance_destroy();
        with (obj_afterimage)
            instance_destroy();
        instance_destroy();
    }
    if (timer == 6)
        instance_destroy();
}
