with (obj_susiezilla_gamecontroller)
{
    if (!gameover)
    {
        other.targy = 65 + ((obj_susiezilla_player.y - 220) / 8) + ((down_h() - up_h()) * 12);
        other.targx = (obj_susiezilla_player.x + (width * 0.5)) / 2;
        other.y = lerp(other.y, other.targy, 0.25);
        other.x = lerp(other.x, other.targx, 0.25);
        other.xspeed = other.x - other.xprevious;
        other.heave_to = lerp(other.heave_to, (right_h() - left_h()) * 12, 0.25);
    }
}
if (xspeed >= 7)
    image_index = 4;
else if (xspeed >= 4)
    image_index = 3;
else if (xspeed > -4)
    image_index = 2;
else if (xspeed > -7)
    image_index = 1;
else
    image_index = 0;
image_alpha = 1;
image_blend = c_gray;
with (obj_susiezilla_gamecontroller)
    draw_sprite_ext(spr_susiezilla_background_backstage, 0, xorig - bgxoffset, 0, 2, 2, 0, image_blend, image_alpha);
if (i_ex(obj_tenna_enemy))
    draw_sprite_ext(spr_pixel_white, 0, camerax(), cameray(), camerawidth(), 64, 0, c_black, 1);
var offs = 0;
if (image_index == 1)
    offs = -4;
if (image_index == 0)
    offs = -8;
if (image_index == 3)
    offs = 12;
if (image_index == 4)
    offs = 16;
if (sprite_index == spr_susiezilla_kris_tug && starwalker)
    draw_sprite_ext(spr_npc_originalstarwalker, 0, ((round((x + heave_to) / 2) * 2) - 56) + offs, (round(y / 2) * 2) - 24, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
draw_sprite_ext(sprite_index, image_index, round((x + heave_to) / 2) * 2, round(y / 2) * 2, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
