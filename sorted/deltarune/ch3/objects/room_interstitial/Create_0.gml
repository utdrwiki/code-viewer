con = -1;
customcon = 0;
prompt_id = 0;
door_marker = instance_create(228, 40, obj_dw_interstitial_door);
with (door_marker)
    depth = 999990;
var _door_readable = instance_create(door_marker.x + 10, door_marker.y + 140, obj_readable_room1);
with (_door_readable)
{
    extflag = "door";
    image_xscale = 8;
    image_yscale = 2;
}
var _poster_green = scr_dark_marker(room_width - (sprite_get_width(spr_dw_interstitial_poster_green) * 2) - 50, 130, scr_84_get_sprite("spr_dw_interstitial_poster_green"));
with (_poster_green)
    depth = 999990;
_blackall = scr_dark_marker(-10, -10, spr_pixel_white);
_blackall.image_xscale = 999;
_blackall.image_yscale = 999;
_blackall.depth = 100;
_blackall.image_blend = c_black;
_blackall.visible = 0;
if (global.plot >= 120 && global.plot < 122)
{
    var visited_tenna = scr_flag_get(1199) == 1;
    con = visited_tenna ? 50 : 45;
    if (visited_tenna)
    {
        _blackall.visible = 1;
        global.interact = 1;
    }
}
if (global.plot >= 122 && global.plot < 150)
{
    con = 1;
    with (door_marker)
        turn_on();
}
if (global.plot >= 150)
{
    con = 130;
    if (scr_flag_get(1208) == 0)
    {
        prompt_id = 1373;
        _door_readable.extflag = "door_no_tenna";
    }
    else
    {
        _door_readable.extflag = "door_after_tenna";
        if (scr_flag_get(1208) == 1)
        {
            con = 150;
            prompt_id = 1375;
            _blackall.visible = 1;
        }
        else if (scr_flag_get(1056) == 0)
        {
            prompt_id = 1375;
        }
        else
        {
            scr_setparty(1, 1, 0);
            con = -1;
            instance_destroy();
        }
    }
}

see_susie = function()
{
    con = 55;
};

lets_chill = function()
{
    con = 60;
};

eyes_open = function()
{
    con = 65;
};

ralsei_face = function()
{
    con = 70;
};

seen_before = function()
{
    con = 75;
    scr_flag_set(1200, 1);
};

ralsei_unique = function()
{
    con = 80;
    scr_flag_set(1200, 2);
};

ralsei_cute = function()
{
    con = 85;
    scr_flag_set(1200, 3);
};

end_sequence = function()
{
    con = 90;
};

susie_question = function()
{
    con = 95;
};

enter_stage = function()
{
    con = (global.choice == 0) ? 135 : 140;
};

count = 0;
bouncesnd = 0;
