if (con == 1)
{
    drawamount = 0;
    scr_lerpvar("drawamount", 0, 128, 60);
    safe_delete(mysolid);
    con = 2;
}
var top = scr_even((sprite_height / 2) - drawamount);
draw_sprite_part_ext(sprite_index, image_index, 0, top, sprite_width, sprite_height, x, y + (top * 2), 2, 2, c_white, 1);
if (drawamount >= 126)
{
    alphaer++;
    alpha = (round(abs(sin(alphaer / 30) * 4)) / 4) - 0.5;
    gpu_set_fog(true, #CA2D2D, 0, 0);
    draw_sprite_ext(sprite_index, image_index, x, y, 2, 2, 0, c_white, alpha);
    gpu_set_fog(false, c_white, 0, 0);
}
