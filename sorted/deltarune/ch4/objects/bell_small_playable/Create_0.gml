con = 0;
timer = 0;
image_speed = 0;
rung = false;
tileslayer = -1;
tileslayer = layer_get_id("TILES");
bellcordlength = 50;
bellcordfadelength = 2;
sndtoplay = 117;
canring = true;
depth = 35000;
dodraw = true;
if (i_ex(obj_rotating_tower_controller_new))
{
    dodraw = false;
    bellcordlength = 150;
}
