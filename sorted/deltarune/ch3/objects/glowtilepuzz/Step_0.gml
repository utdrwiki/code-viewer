curtotal = 0;
funbuffer -= 1;
for (i = 0; i < tiletotal; i += 1)
{
    if (tileid[i].stepped == 1)
        curtotal += 1;
}
if (curtotal == funtotal && funbuffer < -1)
{
    with (block[wonamt])
        instance_destroy();
    with (spike1[wonamt])
        image_index = 1;
    with (spike2[wonamt])
        image_index = 1;
    wonamt += 1;
    snd_play(snd_break1);
    funbuffer = 7;
    if (wonamt == wonmax)
    {
        snd_play_x(snd_crowd_cheer_single, 0.25, 1);
        snd_play(snd_break2);
        if (global.plot < plotamt)
            global.plot = plotamt;
        active = 2;
        sprite_index = spr_hourglass_switch_off;
        funbuffer = -1;
        with (obj_glowtile)
        {
            active = 0;
            stepped = 0;
            stepbuffer = -1;
            sprite_index = spr_glowtile_off;
        }
    }
}
if (funbuffer == 4)
{
    with (obj_glowtile)
    {
        active = 0;
        stepped = 0;
        stepbuffer = -1;
        sprite_index = spr_glowtile_off;
    }
}
if (funbuffer == 1)
    event_user(2);
if (stepnoise == 1)
{
    snd_play(snd_step1);
    stepnoise = 0;
}
if (active == 1)
{
    failtimer += 1;
    image_index = failtimer / (failmax / 8);
    if (obj_mainchara.run == 1)
        run_count++;
    if (failtimer >= failmax)
    {
        run_check = scr_flag_get(1259) == 0;
        active = 0;
        sprite_index = spr_hourglass_switch_off;
        snd_play(snd_noise);
        failamt += 1;
        with (obj_glowtile)
        {
            active = 0;
            stepped = 0;
            stepbuffer = -1;
            sprite_index = spr_glowtile_off;
        }
    }
}
if (delayfacing == 1)
{
    delayfacing = 0;
    global.facing = 0;
}
if (run_check)
{
    if (run_count <= 5 && global.interact == 0)
    {
        run_con = 1;
        global.interact = 1;
        scr_delay_var("run_con", 2, 30);
    }
    if (run_con == 2)
    {
        run_con = 3;
        scr_speaker("ralsei");
        msgsetsubloc(0, "\\E2* (Remember you can hold ~1 to run^1, Kris...!)/%", scr_get_input_name(5), "obj_glowtilepuzz_slash_Step_0_gml_112_0");
        var d = d_make();
    }
    if (run_con == 3 && !d_ex())
    {
        run_con = -1;
        global.interact = 0;
        run_check = false;
        scr_flag_set(1259, 1);
    }
}
