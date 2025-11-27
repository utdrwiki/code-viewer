timer++;
if (timer == 1)
    snd_free_all();
if (timer == 30)
{
    image_alpha = 1;
    x = global.heartx;
    y = global.hearty;
    drawbg = true;
}
if (timer == 31)
    safe_delete(bg);
if (timer == 50)
{
    snd_play(snd_break1);
    sprite_index = spr_heartbreak;
    x -= 2;
}
if (timer == 90)
{
    snd_play(snd_break2);
    image_alpha = 0;
    sh[0] = instance_create(x - 2, y, obj_marker);
    sh[1] = instance_create(x, y + 3, obj_marker);
    sh[2] = instance_create(x + 2, y + 6, obj_marker);
    sh[3] = instance_create(x + 8, y, obj_marker);
    sh[4] = instance_create(x + 10, y + 3, obj_marker);
    sh[5] = instance_create(x + 12, y + 6, obj_marker);
    for (i = 0; i < 6; i += 1)
    {
        with (sh[i])
        {
            direction = random(360);
            speed = 7;
            gravity_direction = 270;
            gravity = 0.2;
            sprite_index = spr_heartshards;
            image_speed = 0.2;
            depth = other.depth - 10;
        }
    }
    if (global.tempflag[3] >= 1)
        timer += 15;
}
if (timer == 140)
    instance_create(0, 0, obj_fadeout);
if (timer >= 80)
{
    if (button1_p())
        timer += 18;
}
if (timer >= 150)
{
}
if (special == 1)
{
    if (timer >= 210)
    {
        room_goto(room_board_sword_intro);
        instance_create(0, 0, obj_persistentfadein);
    }
}
