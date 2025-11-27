if (con == -1 && queen_drink_convo && global.interact == 0)
{
    con = 0;
    show_text = true;
    global.interact = 1;
}
if (show_text && !d_ex())
{
    show_text = false;
    alarm[0] = 5;
    var speaker = (queen_drink_index == 6) ? "susie" : "queen";
    scr_speaker(speaker);
    if (queen_drink_index == 0 || queen_drink_index == 2 || queen_drink_index == 4)
        global.typer = 36;
    msgset(0, queen_drink_text[queen_drink_index]);
    var d = d_make();
    if (queen_drink_index == 0 || queen_drink_index == 2 || queen_drink_index == 4)
    {
        var sound_id = 529;
        if (queen_drink_index == 2)
            sound_id = 555;
        if (queen_drink_index == 4)
            sound_id = 543;
        snd_play(sound_id);
        d.skippable = 0;
        with (obj_writer)
            skippable = 0;
    }
    queen_drink_index++;
    if (queen_drink_index < array_length_1d(queen_drink_text))
    {
        d.stay = 5;
    }
    else
    {
        con = 10;
        show_text = false;
    }
}
if (con == 10 && !d_ex())
{
    con = 99;
    global.interact = 0;
}
if (car_active)
{
    if (car_shadow != -4)
    {
        if (!car_pause)
        {
            car_shadow_timer++;
            if (car_shadow_timer == 1)
            {
                car_shadow_alt++;
                car_shadow_target_temp = ((car_shadow_alt % 2) == 1) ? car_shadow.xstart : (car_shadow.xstart + 194);
            }
            car_shadow_target = lerp_ease_in(car_shadow_target, car_shadow_target_temp, car_shadow_timer / 20, 3);
            car_shadow.x = car_shadow_target;
            if (car_shadow_timer == 17)
            {
                snd_play_x(snd_impact, 0.5, 1.5);
                with (car_shadow)
                    scr_shakeobj();
            }
            if (car_shadow_timer == 60)
                car_shadow_timer = 0;
        }
        car_shadow_readable.x = car_shadow.x - 80;
    }
    if (car_rabbick != -4)
    {
        if (car_rabbick.x == car_rabbick_target)
        {
            car_rabbick_alt++;
            car_rabbick_target = ((car_rabbick_alt % 2) == 1) ? car_rabbick.xstart : 1035;
            car_rabbick.image_xscale = -car_rabbick.image_xscale;
        }
        if (!car_pause)
            car_rabbick.x = scr_movetowards(car_rabbick.x, car_rabbick_target, 1);
        car_rabbick_readable.x = car_rabbick.x - 20;
    }
    if (car_pause_toggle)
    {
        car_pause_toggle = false;
        car_pause = !car_pause;
        traffic_light.image_index = car_pause ? 1 : 0;
    }
}
if (computer_look)
{
    computer_look_timer++;
    if (computer_look_timer == 30)
    {
        with (head_hathy_npc)
            image_index = 1;
    }
    if (computer_look_timer == 60)
    {
        with (head_hathy_npc)
            image_index = 0;
    }
    if (computer_look_timer == 90)
    {
        with (werewerewire_npc)
            image_index = 1;
    }
    if (computer_look_timer == 120)
    {
        with (werewerewire_npc)
            image_index = 0;
        computer_look_timer = 0;
    }
}
