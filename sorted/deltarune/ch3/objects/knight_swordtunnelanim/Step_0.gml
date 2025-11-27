if (con == 0)
{
    if (timer < 60)
    {
        if ((timer % 3) == 0)
        {
            var snd = 226;
            snd_play_x(snd, 0.8 * fadeaudio, 1 + random(0.2));
            snd_play_x(snd, 0.8 * fadeaudio, 1 + random(0.2));
        }
    }
    timer++;
    if (timer == 1)
    {
        scr_lerpvar("image_index", 0, 4, 10);
        scr_lerpvar("dir", 4, -18, 40, 2, "in");
    }
    if (timer == 15)
        scr_lerpvar("fadeaudio", 0, 1, 5);
    if (timer == 20)
    {
        scr_lerpvar("fadeaudio", fadeaudio, 0, 20);
        scr_lerpvar("image_alpha", 1, 0, 10);
        hspeed = -4;
    }
    if (timer == 26)
        drawtrail = 0;
    if (timer == 60)
    {
        timer = 0;
        con = 1;
    }
}
if (con == 1)
{
    timer++;
    if (timer == 1)
    {
        var leafpitchtime = 120;
        var shinkafadeintime = 20;
        scr_lerpvar("shinkafade", 0, 1, shinkafadeintime);
        scr_lerpvar("leafpitch", 0.4, 1, leafpitchtime);
    }
    if ((timer % 3) == 0)
    {
        var snd = 226;
        snd_play_x(snd, (0.4 * shinkafade) + (leafpitch / 10), leafpitch + random_range(0, 0.2));
        snd_play_x(snd, (0.4 * shinkafade) + (leafpitch / 10), leafpitch + random_range(0, 0.2));
    }
    if ((timer % 11) == 0)
        snd_play_x(snd_shinka_ambience, 1 * shinkafade, 1);
    var endtime = 120;
    if (timer == endtime)
        scr_lerpvar("shinkafade", 1, 0, 5);
}
if (global.turntimer < 10)
{
    endtimer++;
    image_alpha = 1;
    x = obj_knight_enemy.x;
    if (endtimer == 1)
    {
        sprite_index = spr_roaringknight_ball_transition_sword;
        image_index = 5;
        image_speed = 0.5;
    }
    if (endtimer == 8)
        instance_destroy();
}
siner++;
y = ystart + (sin(siner / 16) * 8);
if (drawtrail)
{
    shadowtimer++;
    if ((shadowtimer % 2) == 0)
    {
        with (scr_afterimage())
        {
            image_alpha = 1;
            hspeed = other.dir;
            if (i_ex(obj_growtangle))
                depth = obj_growtangle.depth - 1000;
            depth += other.shadowtimer;
        }
    }
}
