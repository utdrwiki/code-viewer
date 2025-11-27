rotation += 12;
if (con == 0)
{
    scr_lerpvar("x", xstart, targx, 8);
    scr_lerpvar("y", ystart, targy, 8);
    scr_lerpvar("distance", distance, 0, transitiontime);
    scr_doom(id, transitiontime + 2);
    con = 1;
}
var mystarindex = image_index;
for (var i = 0; i < starcount; i++)
{
    if (randim)
    {
        randim += (1/30);
        mystarindex = i + randim;
    }
    draw_sprite_ext(sprite_index, mystarindex, round((x + lengthdir_x(distance, ((i * 360) / starcount) + rotation)) / 2) * 2, round((y + lengthdir_y(distance, ((i * 360) / starcount) + rotation)) / 2) * 2, 2, 2, image_angle, image_blend, image_alpha);
}
