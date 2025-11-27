timer++;
if (con == 0)
{
    if (obj_mainchara.y < 3660)
    {
        with (obj_church_wind_effect)
            con = 1;
    }
    else
    {
        with (obj_church_wind_effect)
            con = 0;
        with (obj_dw_windy_char)
            top_anim_speed = 0;
    }
    timer++;
    if (timer >= timermax && obj_mainchara.y < 3660)
    {
        if (timermax < 11 && patterncount >= 15)
        {
            if (irandom(100) < 50)
            {
                inst = instance_create((camerax() + 320) - 70, cameray() + 90, obj_overworld_knight_sword1);
                inst.ypos = 90;
                inst = instance_create((camerax() + 320) - 30, cameray() + 90, obj_overworld_knight_sword1);
                inst.ypos = 90;
                inst = instance_create(camerax() + 320 + 10, cameray() + 90, obj_overworld_knight_sword1);
                inst.ypos = 90;
            }
            else
            {
                inst = instance_create(camerax() + 320 + 70, cameray() + 90, obj_overworld_knight_sword1);
                inst.ypos = 90;
                inst = instance_create(camerax() + 320 + 30, cameray() + 90, obj_overworld_knight_sword1);
                inst.ypos = 90;
                inst = instance_create((camerax() + 320) - 10, cameray() + 90, obj_overworld_knight_sword1);
                inst.ypos = 90;
            }
            patterncount = 0;
            timer = -18;
        }
        else
        {
            inst = instance_create(((camerax() + 320) - 80) + irandom(160), cameray() + 90, obj_overworld_knight_sword1);
            inst.ypos = 90;
            swordcount++;
            patterncount += (1 + random(1));
            if (swordcount == 3 || irandom(100) < 50)
            {
                inst.x = obj_mainchara.x + 20;
                swordcount = 0;
            }
            timer = 0;
            if (timermax > 25)
                timermax -= 5;
            else if (timermax > 10)
                timermax -= 1;
            if (patterncount >= 15 && timermax < 11)
                timer = -20;
        }
    }
}
if (room == room_dw_church_staircase)
{
    with (obj_mainchara)
    {
        if (alarm[1] > 0 && !place_meeting(x, y + 1, obj_solidblock))
            y += 3;
    }
}
