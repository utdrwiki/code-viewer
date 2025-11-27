con = -1;
customcon = 0;
starting_y_pos = 0;
stepcon = 0;
steptimer = 0;
roomglow = instance_create(0, 0, obj_roomglow);
roomglow.active = false;
roomglow.actind = 0;
roomglow.glow = 0;
for (var i = 0; i < 5; i++)
{
    with (scr_dark_marker(290, 1270 - (256 * i), (i == 0) ? spr_dw_fountain_tall : spr_dw_fountain_tall_looping))
    {
        depth = 999990;
        image_speed = 0.1;
        image_index = i;
    }
}
var fence_marker = scr_dark_marker(90, 1654, bg_dw_titan_intro_fence);
with (fence_marker)
    scr_depth();
if (global.plot >= 240 && global.plot < 250)
{
    con = 0;
    starting_y_pos = 1950;
    scr_setparty(1, 1, 0);
    if (!audio_is_playing(global.currentsong[1]))
    {
        global.currentsong[0] = snd_init("titan_pre.ogg");
        global.currentsong[1] = mus_loop_ext(global.currentsong[0], 1, 1);
    }
    fountain = instance_create(0, 0, obj_ch4_DCC01_fountain);
    fence_marker.depth = fountain.depth - 2000;
    roaring_knight = instance_create(200, starting_y_pos - 500, obj_ch4_DCC01_roaringknight);
    with (roaring_knight)
    {
        state = 2;
        timer = 0;
        scr_depth();
    }
    laugh_audio = -4;
    blackall = scr_dark_marker(-10, -10, spr_pixel_white);
    blackall.image_xscale = 999;
    blackall.image_yscale = 999;
    blackall.depth = 100;
    blackall.image_blend = c_black;
    blackall.visible = 1;
    blackall.image_alpha = 0;
    if (scr_debug())
    {
        if (global.tempflag[90] == 1)
        {
            con = 8;
            global.interact = 1;
            global.facing = 0;
            cutscene_master = scr_cutscene_make();
            scr_maincharacters_actors();
            c_sel(su);
            c_setxy(295, starting_y_pos - 286 - 16);
            c_facing("u");
            c_sel(ra);
            c_setxy(247, starting_y_pos - 270 - 31);
            c_facing("u");
            c_sel(kr);
            c_setxy(350, starting_y_pos - 258);
            c_facing("u");
            c_pannable(1);
            c_pan_wait(camerax(), starting_y_pos - 660, 1);
            c_waitcustom();
        }
        if (global.tempflag[90] == 2)
        {
            con = 21;
            global.interact = 1;
            global.facing = 0;
            cutscene_master = scr_cutscene_make();
            scr_maincharacters_actors();
            c_sel(su);
            c_setxy(295, starting_y_pos - 286 - 16);
            c_facing("u");
            c_sel(ra);
            c_setxy(247, starting_y_pos - 270 - 31);
            c_facing("u");
            c_sel(kr);
            c_setxy(350, starting_y_pos - 258);
            c_facing("u");
            c_pannable(1);
            c_pan_wait(camerax(), starting_y_pos - 660, 1);
            c_waitcustom();
        }
        with (obj_border_controller)
            hide_border();
    }
}
else
{
    instance_destroy();
}

continue_cutscene = function()
{
    if (con >= 20)
        con = 21;
    else
        con = 20;
};
