siner = 0;
current_y_pos = y;
target_y_pos = y;
move_speed = 0.4;
top_pos = 0;
bottom_pos = 0;
hover_active = false;
x_offset = 20;

init_crowd = function()
{
    target_y_pos = y + 300;
    hover_active = false;
    top_pos = y - 60;
    bottom_pos = top_pos + 80;
};

show_crowd = function()
{
    target_y_pos = y - 60;
};

hide_crowd = function()
{
    var sinkamt = 80;
    if (room == room_dw_tv_curtain)
        sinkamt = 100;
    target_y_pos += sinkamt;
};

init = 0;
type = 0;
active = false;
wasactive = false;
anim_speed = 0;
siner_speed = 0;
if (room == room_dw_teevie_audiencepits || room == room_dw_teevie_lightmaze)
    type = 1;
if (type == 1)
{
    depth = 100000 - ((y + 280 + 40) * 10);
    depth = 0;
    depth = layer_get_depth("BGCOLOR") - 5000;
    image_xscale = ((image_xscale * 32) / 40) + 2;
}
neverwork = false;
if (scr_ch3_violencecheck() >= 5)
{
    neverwork = true;
    disable = true;
    type = 999;
}
init = 0;
