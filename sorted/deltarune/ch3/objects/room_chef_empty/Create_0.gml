con = -1;
customcon = 0;
blackall = scr_dark_marker(-10, -10, spr_pixel_white);
blackall.image_xscale = 999;
blackall.image_yscale = 999;
blackall.depth = 100;
blackall.image_blend = c_black;
blackall.visible = 1;
pipe_left = scr_dark_marker(camerax() - 80, 380, spr_dw_chef_pipe);
with (pipe_left)
    depth = 93000;
pipe_right = scr_dark_marker(camerax() + view_wport[0] + 80, 380, spr_dw_chef_pipe);
with (pipe_right)
{
    depth = 93000;
    image_xscale = -2;
}
game_active = false;
game_finish = false;
icee_travel = false;
icee_travel_timer = 0;
icee = [];
show_arrows = false;
hide_arrows = false;
arrow_timer = 0;
arrow_siner = 0;
arrow_markers = [];
for (var i = 0; i < 2; i++)
{
    arrow_markers[i] = scr_dark_marker(14 + (i * 560), 300, spr_morearrow);
    arrow_markers[i].image_blend = c_yellow;
    arrow_markers[i].image_alpha = 0;
    arrow_markers[i].image_xscale = 4;
    arrow_markers[i].image_yscale = 4;
}
bgm = -4;
bgm_track[0] = -4;
bgm_track[1] = -4;
bgm_timer = 0;
bgm_pitch = 0;
screen = instance_find(obj_dw_chef_screen_empty, 0);
timer_max = 0;
timer = 0;
if (global.plot >= 230)
{
    con = 0;
    with (obj_mainchara)
    {
        y = -100;
        cutscene = 1;
        fun = 1;
        visible = 0;
    }
    with (obj_caterpillarchara)
    {
        y = -100;
        follow = 0;
        fun = 1;
        visible = 0;
    }
}

game_start = function()
{
    game_active = true;
    scr_var_delay("game_finish", true, 660);
};
