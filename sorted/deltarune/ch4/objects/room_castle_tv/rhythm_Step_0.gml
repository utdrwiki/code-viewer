if (con < 0)
    exit;
if (con == 0 && !d_ex() && global.interact == 0)
{
    con = 1;
    global.interact = 1;
    shadow_anim = shadow_npc.normalanim;
    with (shadow_npc)
    {
        image_speed = 0.4;
        normalanim = -1;
    }
}
if (con == 1)
{
    shadow_timer++;
    if ((shadow_timer % 16) == 1)
    {
        var sound = choose(511, 167, 567);
        snd_play(sound);
    }
    if (shadow_timer >= 32)
    {
        shadow_timer = 0;
        con = 2;
        alarm[0] = 20;
        with (shadow_npc)
            image_speed = 0;
        shadow_npc.normalanim = shadow_anim;
    }
}
if (con == 3)
{
    con = -1;
    global.interact = 0;
}
if (con == 10 && !d_ex() && global.interact == 0)
{
    con = -1;
    global.interact = 1;
    enter_door();
}
