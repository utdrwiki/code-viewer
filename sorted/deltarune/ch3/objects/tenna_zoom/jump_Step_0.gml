var yy = 40;
if (minigametransition_con == 1)
{
    minigametransition_timer++;
    if (minigametransition_timer == 1)
    {
        tenna_actor.vspeed = -18;
        tenna_actor.hspeed = -10.5;
        tenna_actor.gravity = 2;
        tenna_actor.sprite_index = spr_tenna_attack;
        tenna_actor.depth -= 9999999;
        snd_play(snd_jump);
    }
    if (tenna_actor.y > (tenna_actor.ystart + yy) && tenna_actor.vspeed > 0)
    {
        tenna_actor.y = tenna_actor.ystart + yy;
        tenna_actor.sprite_index = spr_tenna_grasp;
        tenna_actor._static = true;
        tenna_actor.vspeed = 0;
        tenna_actor.hspeed = 0;
        tenna_actor.gravity = 0;
        tenna_actor.x = camerax() + 320;
        tenna_actor.y = cameray() + 254 + yy;
        snd_play(snd_impact);
        scr_shakescreen();
        minigametransition_con = 1.5;
        minigametransition_timer = 0;
    }
}
if (minigametransition_con == 1.5)
{
    minigametransition_timer++;
    if (minigametransition_timer == 1)
    {
        tenna_zoom = instance_create(tenna_actor.x, tenna_actor.y - 154, obj_tenna_zoom);
        tenna_zoom.minigametype = minigametype;
        tenna_zoom.persistent = true;
        tenna_actor.x = -9999;
        tenna_actor.y = -9999;
    }
    if (minigametransition_timer == 15)
    {
        minigametransition_con = 2;
        minigametransition_timer = 0;
        instance_destroy();
    }
}
if (minigametransition_con == 3)
{
    minigametransition_timer++;
    if (minigametransition_timer == 1)
    {
        tenna_actor.vspeed = -18;
        tenna_actor.hspeed = 10.5;
        tenna_actor.gravity = 2;
        tenna_actor.sprite_index = spr_tenna_attack;
        tenna_actor.image_xscale = -2;
        snd_play(snd_jump);
    }
    if (tenna_actor.y > tenna_actor.ystart && tenna_actor.vspeed > 0)
    {
        tenna_actor.sprite_index = spr_tenna_point_up;
        tenna_actor.vspeed = 0;
        tenna_actor.hspeed = 0;
        tenna_actor.gravity = 0;
        tenna_actor.image_xscale = 2;
        tenna_actor.x = tenna_actor.xstart;
        tenna_actor.y = tenna_actor.ystart;
        snd_play(snd_impact);
        scr_shakescreen();
    }
}
