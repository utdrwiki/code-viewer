function scr_rhythmgame_init(arg0, arg1, arg2 = false)
{
    instrument = arg0;
    note_color[0] = #01EA9E;
    note_color[1] = #17EEFF;
    note_color[2] = c_orange;
    if (instrument == 0)
    {
        scr_rhythmgame_notechart_lead(arg1);
        if (!arg2)
            exit;
        performer = instance_create(280, 316, obj_rhythmgame_performer);
        performer.sprite_index = spr_kris_rock_2;
        performer.image_speed = 0.5;
        performer.name = "kris";
        performer.loop = false;
    }
    else if (instrument == 1)
    {
        note_color[0] = #D1176A;
        note_color[1] = #EA79C8;
        scr_rhythmgame_notechart_drums(arg1);
        if (!arg2)
            exit;
        performer = instance_create(56, 281, obj_rhythmgame_performer);
        performer.sprite_index = spr_susie_drum;
        performer.image_speed = 0.5;
        performer.loop = false;
        performer.name = "susie";
        performer.animspeed = 3;
    }
    else if (instrument == 2)
    {
        note_color[0] = c_green;
        note_color[1] = #B5E61D;
        note_color[2] = c_lime;
        scr_rhythmgame_notechart_vocals(arg1);
        if (!arg2)
            exit;
        performer = instance_create(486, 304, obj_rhythmgame_performer);
        performer.sprite_index = spr_ralsei_rock_1;
        performer.image_speed = 0;
        performer.loop = true;
        performer.name = "ralsei";
        performer.animspeed = 0.5;
        performer.mid = spr_ralsei_sing_polite;
        performer.idle = spr_ralsei_sing_polite_closed;
    }
    performer.image_xscale = 2;
    performer.image_yscale = 2;
    performer.depth = depth - 10;
    performer.rhythmer = id;
}
