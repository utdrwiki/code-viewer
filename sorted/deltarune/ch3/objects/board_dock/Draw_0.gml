draw_self();
var boatactive = 0;
with (obj_mainchara_board)
{
    if (boat == true)
        boatactive++;
}
if (!boatactive)
{
    siner = -40;
}
else
{
    siner++;
    var sinamout = (round(sin(siner / 15) * 4) / 4) + 0.2;
    gpu_set_fog(1, #FFE167, 0, 0);
    draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, sinamout / 2);
    gpu_set_fog(0, c_white, 0, 0);
}
