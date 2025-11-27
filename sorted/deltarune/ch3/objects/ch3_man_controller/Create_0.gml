sound_free_all();
if (scr_debug())
    scr_setparty(0, 0, 0);
depth = -5;
tileLayer = layer_get_id("TILES");
originX = layer_get_x(tileLayer);
originY = layer_get_y(tileLayer);
roomStartingX = -640;
roomStartingY = -480;
var moveX = roomStartingX - originX;
var moveY = roomStartingY - originY;
obj_mainchara.cutscene = true;
with (obj_mainchara)
    setxy(x + moveX, y + moveY);
moveall[0] = 703;
moveall[1] = 282;
moveall[2] = 1024;
moveall[3] = 1212;
moveall[4] = 1078;
moveall[5] = 1655;
movealllength = array_length(moveall);
for (var i = 0; i < movealllength; i++)
{
    with (moveall[i].object_index)
        setxy(x + moveX, y + moveY);
}
layer_x(tileLayer, layer_get_x(tileLayer) + moveX);
layer_y(tileLayer, layer_get_y(tileLayer) + moveY);
movestep = 0;
shift = 0;
moving = 0;
warpx = 0;
warpy = 0;
playerx = 0;
playery = 0;
endfacing = 0;
camtimer = 0;
curtain1y = 0;
curtain2y = 480;
curtaincolor = hexcolor(#88CA97);
init = 0;
binocon = -1;
binobuff = 0;
rudinn4 = 0;
global.interact = 1;
faded = 0;
fadein = scr_marker_ext(0, 0, spr_pxwhite, room_width, room_height, undefined, undefined, c_black, -1);
with (fadein)
{
    scr_delay_var("image_blend", merge_color(c_black, #345038, 0.2), 5);
    scr_delay_var("image_blend", merge_color(c_black, #345038, 0.4), 10);
    scr_delay_var("image_blend", merge_color(c_black, #345038, 0.6), 15);
    scr_delay_var("image_blend", merge_color(c_black, #345038, 0.8), 20);
    scr_delay_var("image_blend", merge_color(c_black, #345038, 1), 25);
    scr_delay_var("image_alpha", 0.8, 5);
    scr_delay_var("image_alpha", 0.6, 10);
    scr_delay_var("image_alpha", 0.4, 15);
    scr_delay_var("image_alpha", 0.2, 20);
    scr_doom(id, 25);
}
endcon = 0;
stepped = 0;
fadeamt = 0;
cam_xx = 0;
cam_yy = 0;
