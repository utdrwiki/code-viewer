var cx = camerax();
var cy = cameray();
depth = 150000;
siner++;
var shakex = 0;
var shakey = 0;
if (i_ex(obj_shake))
{
    shakex = obj_shake.shakex * obj_shake.shakesign;
    shakey = obj_shake.shakey * obj_shake.shakesign;
}
if (i_ex(obj_knight_enemy))
    battleprog = 1 - (((global.monsterhp[obj_knight_enemy.myself] - (global.monstermaxhp[obj_knight_enemy.myself] * 0.8)) / global.monstermaxhp[obj_knight_enemy.myself]) * 5);
oceanspeed = 1;
if (battleprog > 0.65)
    oceanspeed = 2;
desicolor = make_color_hsv(127.5 + ((sin(siner / 90) * 255) / 2), 255, 255);
draw_sprite_tiled_ext(spr_bg_fountain1, 0, (shakex + cx) - (siner * oceanspeed), shakey + cy + (siner * oceanspeed), 2, 2, c_purple, 0.5 * alphafactor * (battleprog + 0.3));
draw_sprite_tiled_ext(spr_bg_fountain1, 0, (shakex + cx) - ((siner * oceanspeed) / 2), (shakey + cy) - ((siner * oceanspeed) / 2), 2, 2, c_purple, 0.35 * alphafactor * (battleprog + 0.2));
if (i_ex(obj_knight_enemy))
    draw_sprite_ext(spr_bg_knight_gradient, 0, shakex + camerax() + camerawidth() + 640, shakey + cameray() + 90, -2, 2, 0, c_black, alphafactor);
draw_sprite_ext(spr_bg_knight_gradient, 0, shakex + camerax(), shakey + cameray() + 90, 2, 2.05, 0, c_black, alphafactor);
draw_sprite_ext(spr_pxwhite, 0, (shakex + cx) - 40, shakey + cy + 0, 720, 90, 0, c_black, 1);
image_blend = merge_color(#27293F, desicolor, battleprog / 2);
draw_sprite_ext(spr_pxwhite, 0, shakex + cx + 138 + 50, shakey + cy + 0, 240, 90, 0, merge_color(image_blend, c_black, 0.8), 1 * alphafactor);
for (var i = 1; i < 3; i++)
{
    draw_sprite_ext(spr_cc_fountainbg_white, siner / 10, (shakex + cx + 138) - (sin(siner / 20) * (i * 12)), shakey + cy + 0, 2, 2, 0, image_blend, (i / 12) * alphafactor);
    draw_sprite_ext(spr_cc_fountainbg_white, siner / 10, shakex + cx + 138 + (sin(siner / 13) * (i * 6)), shakey + cy + 0, 2, 2, 0, image_blend, (i / 12) * alphafactor);
}
draw_sprite_ext(spr_cc_fountainbg_white, siner / 10, shakex + cx + 138, shakey + cy + 0, 2, 2, 0, image_blend, 1);
if (i_ex(obj_knight_enemy))
    draw_sprite_ext(spr_pxwhite, 0, (shakex + cx) - 40, shakey + cy + 0, 40, 480, 0, c_black, 1);
if (i_ex(obj_knight_enemy))
    draw_sprite_ext(spr_pxwhite, 0, (shakex + cx) - 40, (shakey + cy) - 20, 720, 20, 0, c_black, 1);
if (death == 0)
{
    if (!i_ex(obj_battlecontroller))
    {
        death = 1;
        scr_lerpvar("alphafactor", alphafactor, 0, 30);
        scr_doom(id, 31);
    }
}
