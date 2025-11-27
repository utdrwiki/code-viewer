xstart = 0;
ystart = 0;
image_alpha = 0;
autoxinc1 = 0;
autoyinc1 = 0;
autoxinc2 = 0;
autoyinc2 = 0;
autoxinc3 = 0;
autoyinc3 = 0;
autoxinc4 = 0;
autoyinc4 = 0;
ss1 = 0.5;
ssy1 = 0.1;
ss2 = 0.6;
ssy2 = 0.15;
ss3 = 0.7;
ssy3 = 0.18;
ss4 = 0.8;
ssy4 = 0.2;
autox1 = 0;
autoy1 = 0;
autox2 = 0;
autoy2 = 0;
autox3 = 0;
autoy3 = 0;
autox4 = 0;
autoy4 = 0;
layer1 = layer_get_id("PARALLAX_1");
if (layer1 == -1)
    layer1 = layer_get_id("PARALLAX");
layer2 = layer_get_id("PARALLAX_2");
layer3 = layer_get_id("PARALLAX_3");
layer4 = layer_get_id("PARALLAX_4");
if (layer1 == -1)
{
    instance_destroy();
    debug_message("The layer \"PARALLAX_1\" couldn't be found, so parallax won't work. -obj_churchParallaxer");
}
if (room == room_dw_church_intro_guei)
    ssy1 = 0.05;
if (room == room_dw_churchc_superprophecies)
{
    ss1 = 0.2;
    ssy1 = 0.2;
    ss2 = 0.4;
    ssy2 = 0.4;
    ss3 = 0.7;
    ssy3 = 0.7;
    ss4 = 0.8;
    ssy4 = 0.2;
}
