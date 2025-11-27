siner = 0;
siner_speed = 0;
anim = 0;
anim_speed = 0.2;
y_base_pos = 0;
y_target_pos = 0;

init_crowd = function()
{
    y_base_pos = y + 500;
};

show_crowd = function()
{
    anim_speed = 0.2;
    siner_speed = 0.4;
    scr_lerpvar("y_base_pos", y + 500, y + 280, 15, -1, "out");
};

hide_crowd = function()
{
    anim_speed = 0;
    siner_speed = 0;
    scr_lerpvar("y_base_pos", y + 280, y + 500, 15);
};

init = 0;
type = 0;
active = false;
wasactive = false;
if (room == room_dw_teevie_audiencepits || room == room_dw_teevie_lightmaze || room == room_dw_teevie_shuttahmaze)
    type = 1;
if (type == 1)
{
    y -= 220;
    depth = 100000 - ((y + 280 + 40) * 10);
}
if (scr_ch3_violencecheck() >= 5)
{
    disable = true;
    type = 999;
}
