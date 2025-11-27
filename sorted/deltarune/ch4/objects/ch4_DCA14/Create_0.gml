con = -1;
customcon = 0;
if (global.plot >= 210)
{
    var letter_readable = instance_create(110, 132, obj_readable_room1);
    with (letter_readable)
    {
        image_yscale = 0.5;
        extflag = "susie_letter";
    }
    if (global.plot < 220)
    {
        con = 0;
        if (array_length(global.currentsong) <= 2 || !snd_is_playing(global.currentsong[3]))
        {
            global.currentsong[2] = snd_init("raining_in_church2.ogg");
            global.currentsong[3] = mus_loop(global.currentsong[2]);
            mus_volume(global.currentsong[3], 0, 0);
        }
        mus_volume(global.currentsong[1], 0, 30);
        mus_volume(global.currentsong[3], 0, 30);
        music_track[0] = -4;
        music_track[1] = -4;
        blackall = scr_dark_marker(-10, -10, spr_pixel_white);
        blackall.image_xscale = 999;
        blackall.image_yscale = 999;
        blackall.depth = 100;
        blackall.image_blend = c_black;
        anim_timestamps = [330, 200, 1000, 200, 200, 100, 100, 100, 100, 100, 660, 660];
        anim_player = instance_create(0, 0, obj_anim_custom);
        case_marker = scr_marker(0, 0, spr_church_glass_case);
        case_marker.visible = 0;
        letter_marker = scr_marker(112, 118, spr_church_letter_alvin);
        letter_marker.depth = 98550;
        letter_marker.visible = 0;
        
        continue_cutscene = function()
        {
            con = 5;
            case_marker.x = su_actor.x;
            case_marker.y = su_actor.y;
            case_marker.depth = su_actor.depth;
            case_marker.visible = 1;
        };
    }
    else
    {
        case_marker = scr_marker(132, 77, spr_church_glass_case);
        case_marker.depth = 98550;
        var case_readable = instance_create(136, 118, obj_readable_room1);
        with (case_readable)
        {
            extflag = "case";
            image_yscale = 0.5;
        }
        letter_marker = scr_marker(112, 118, spr_church_letter_alvin);
        letter_marker.depth = 98550;
    }
}
else
{
    instance_destroy();
}
