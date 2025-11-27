if (!(collision_circle(x - 1, y, sprite_width / 2, obj_gh_bouncebarrier, true, true) || collision_circle(x - 1, y, sprite_width / 2, obj_battlesolid, true, true)))
{
    if (collision_circle((x + hspeed) - 1, y, sprite_width / 2, obj_gh_bouncebarrier, true, true) || collision_circle((x + hspeed) - 1, y, sprite_width / 2, obj_battlesolid, true, true))
        hspeed *= -1;
    if (collision_circle(x - 1, y + vspeed, sprite_width / 2, obj_gh_bouncebarrier, true, true) || collision_circle(x - 1, y + vspeed, sprite_width / 2, obj_battlesolid, true, true))
        vspeed *= -1;
    if (collision_circle((x - 1) + hspeed, y + vspeed, sprite_width / 2, obj_gh_bouncebarrier, true, true) || collision_circle((x - 1) + hspeed, y + vspeed, sprite_width / 2, obj_battlesolid, true, true))
        hspeed *= -1;
}
if (sprite_index == spr_ghost_house_pumpkin_horizontal)
    image_index = scr_approach(image_index, 2 - (2 * sign(hspeed)), 0.2);
else if (sprite_index == spr_ghost_house_pumpkin_vertical)
    image_index = scr_approach(image_index, 2 - (2 * sign(vspeed)), 0.2);
if (iris)
    iris_dir += (angle_difference(direction, iris_dir) / 5);
