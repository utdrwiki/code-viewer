if (con == 0)
{
    if (image_alpha > 0)
        image_alpha -= 0.02;
}
if (con == 1)
{
    if (image_alpha < 0.45)
        image_alpha += 0.05;
}
repeat (windspeed)
{
    wind_y += 2;
    if (wind_y > -416)
        wind_y -= 416;
}
gpu_set_blendmode(bm_add);
scr_draw_sprite_tiled_area(spr_church_wind, 0, camerax(), cameray() + wind_y, camerax(), cameray() + wind_y, camerax() + view_wport[0], cameray() + room_height, 4, 4, c_red, image_alpha);
gpu_set_blendmode(bm_normal);
