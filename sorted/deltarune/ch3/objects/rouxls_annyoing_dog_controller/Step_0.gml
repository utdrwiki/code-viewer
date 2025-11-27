var cy = cameray();
if (con == 0)
{
    timer++;
    if (timer == 1)
    {
        mus_volume(global.batmusic[1], 0, 60);
        with (obj_heroparent)
        {
            image_speed = 0;
            index = 0;
            state = 8;
        }
    }
    if (timer < 61)
    {
        var datime = timer;
        with (obj_battleback)
            bgspeed = lerp(1, 0, datime / 60);
    }
    if (timer == 71)
    {
        timer = 0;
        con = 1;
    }
}
if (con == 1)
{
    timer++;
    if (timer < 41)
        platform_y = lerp(platform_y, cy + 180, 0.05);
    if (timer == 71)
    {
        annoyingdog.vspeed = -12;
        annoyingdog.gravity = 1;
        annoyingdog.gravity_direction = 270;
        timer = 0;
        con = 2;
        snd_play(snd_wing);
    }
}
if (con == 2)
{
    timer++;
    if (timer == 10)
        annoyingdog.depth -= 2;
    if ((annoyingdog.y + annoyingdog.vspeed) > (cameray() + 260))
    {
        annoyingdog.y = cy + 260;
        annoyingdog.vspeed = 0;
        annoyingdog.gravity = 0;
        vfx = instance_create_depth(annoyingdog.x + 12, annoyingdog.y + 20, depth - 1, obj_annoyingdog_landing_dust);
        vfx.image_xscale = -2;
        vfx.image_yscale = 2;
        vfx.hspeed = 2;
        vfx.image_speed = 0.5;
        vfx = instance_create_depth(annoyingdog.x - 15, annoyingdog.y + 20, depth - 1, obj_annoyingdog_landing_dust);
        vfx.image_xscale = 2;
        vfx.image_yscale = 2;
        vfx.hspeed = -2;
        vfx.image_speed = 0.5;
        timer = 0;
        con = 3;
        snd_play(snd_bump);
    }
}
if (con == 3)
{
    timer++;
    if (timer == 60)
    {
        scr_lerpvar("dogspin", 0, 1, 80, 1, "out");
        snd_play(snd_smashreveal);
        whitealpha = 1;
    }
    if (timer > 60)
        whitealpha -= 0.2;
    if (timer == 132)
    {
        with (recoveryplatform)
            visible = false;
        with (glow)
            visible = false;
    }
    if (timer == 160)
    {
        annoyingdog.hspeed = -20;
        recoveryplatform.vspeed -= 20;
        glow.vspeed = 20;
        with (obj_battleback)
            bgspeed = 1;
        mus_volume(global.batmusic[1], 1, 0);
        with (obj_heroparent)
            state = 0;
        snd_play(snd_wallclaw);
        instance_destroy();
        with (obj_rouxls_ch3_enemy)
            dogtrigger = -1;
        with (obj_battlecontroller)
            dogcon = -1;
    }
}
recoveryplatform.y = platform_y;
glow.y = platform_y + 0;
if (con < 2)
    annoyingdog.y = platform_y - 18;
with (obj_shadowman_enemy)
    siner = 0;
siner++;
glow.image_yscale = 0.5 + (sin(siner / 4) * 0.04);
