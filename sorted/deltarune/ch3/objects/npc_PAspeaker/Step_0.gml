if (scr_debug && keyboard_check(ord("W")))
{
    if (keyboard_check_pressed(ord("A")))
    {
        if (talkmode)
        {
            scr_debug_print("talkmode off");
            sprite_index = spr_PAspeaker_off_TEMP;
            drawtype = 1;
            bounce = 1;
            talkmode = false;
        }
        else
        {
            scr_debug_print("talkmode on");
            sprite_index = spr_PAspeaker_on_TEMP;
            image_speed = 0;
            drawtype = 0;
            bounce = 1;
            talkmode = true;
        }
    }
    if (keyboard_check_pressed(ord("D")))
    {
        if (!debugbox)
        {
            scr_debug_print("debugbox on");
            debugbox = true;
        }
        else
        {
            scr_debug_print("debugbox off");
            debugbox = false;
        }
    }
    if (keyboard_check_pressed(ord("F")))
    {
        if (drawtype == 0)
        {
            scr_debug_print("get funny!");
            maxfunny = 12;
            image_index += 1;
            add1 = random_range(-maxfunny, maxfunny);
            add2 = random_range(-maxfunny, maxfunny);
            add3 = random_range(-maxfunny, maxfunny);
            add4 = random_range(-maxfunny, maxfunny);
            botpinch = random_range(10, 0);
            soundid = irandom(9);
            if (soundid == prevsound)
            {
                soundid += 1;
                if (soundid > 9)
                    soundid = 0;
            }
            snd_play(sounds[soundid]);
            prevsound = soundid;
            drawtype = 0;
        }
        else
        {
            scr_debug_print("you didenen'tt turn on funny crazy mode...");
        }
    }
}
if (keyboard_check_pressed(ord("A")) && scr_debug())
{
    active = !active;
    scr_lerpvar("baralpha", 0, 1, 15);
}
if (play == 1)
{
    play = 0;
    image_xscale = -2;
    sprite_index = spr_PAspeaker_on_TEMP;
    image_speed = 0;
    maxfunny = 12;
    image_index++;
    scr_lerpvar("add1", add1, random_range(-maxfunny, maxfunny), rate - 1, 1, "out");
    scr_lerpvar("add2", add2, random_range(-maxfunny, maxfunny), rate - 1, 1, "out");
    scr_lerpvar("add3", add3, random_range(-maxfunny, maxfunny), rate - 1, 1, "out");
    scr_lerpvar("add4", add4, random_range(-maxfunny, maxfunny), rate - 1, 1, "out");
    botpinch = random_range(10, 0);
    soundid = irandom(9);
    if (soundid == prevsound)
    {
        soundid += 1;
        if (soundid > 9)
            soundid = 0;
    }
    if (snd_vol > 0)
    {
        snd_count--;
        if (snd_count <= 0)
            snd_vol -= 0.1;
        snd_play_x(sounds[soundid], snd_vol, random_range(1.1, 1.4));
    }
    prevsound = soundid;
    drawtype = 0;
}
if (con == 0)
{
    timer++;
    if (timer == 1)
    {
        ypos = -20;
        y = cameray() + ypos;
        scr_lerpvar("ypos", ypos, 80, 15, -1, "out");
    }
    if (timer == 20)
    {
        scr_lerpvar("baralpha", 0, 1, 15);
        active = 1;
    }
    if (timer > 20 && !active)
    {
        con = 1;
        timer = 0;
    }
}
if (con == 1)
{
    timer++;
    if (timer == 1)
        scr_lerpvar("ypos", ypos, -120, 30, 2, "out");
}
x = camerax() + 580;
y = cameray() + ypos;
