timer += 1
if (timer == 1)
    snd_free_all_ch1()
if (timer == 30)
{
    with (bg)
        instance_destroy()
    visible = true
    x = global.heartx
    y = global.hearty
}
if (timer == 31)
    sprite_delete(global.screenshot)
if (timer == 50)
{
    snd_play_ch1(snd_break1_ch1)
    sprite_index = spr_heartbreak_ch1
    x -= 2
}
if (timer == 90)
{
    snd_play_ch1(snd_break2_ch1)
    visible = false
    sh[0] = instance_create_ch1((x - 2), y, obj_marker_ch1)
    sh[1] = instance_create_ch1(x, (y + 3), obj_marker_ch1)
    sh[2] = instance_create_ch1((x + 2), (y + 6), obj_marker_ch1)
    sh[3] = instance_create_ch1((x + 8), y, obj_marker_ch1)
    sh[4] = instance_create_ch1((x + 10), (y + 3), obj_marker_ch1)
    sh[5] = instance_create_ch1((x + 12), (y + 6), obj_marker_ch1)
    for (i = 0; i < 6; i += 1)
    {
        with (sh[i])
        {
            direction = random(360)
            speed = 7
            gravity_direction = 270
            gravity = 0.2
            sprite_index = spr_heartshards_ch1
            image_speed = 0.2
        }
    }
    if (global.tempflag[3] >= 1)
        timer += 15
}
if (timer == 140)
    instance_create_ch1(0, 0, obj_fadeout_ch1)
if (timer >= 80 && timer < 150)
{
    if button1_p_ch1()
        Z_COUNT += 1
    if (Z_COUNT >= 4)
        scr_tempload_ch1()
}
if (timer == 150)
    room_goto(PLACE_FAILURE_ch1)
