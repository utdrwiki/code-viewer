if (actor_target == -4 || mode == 0)
    exit;
var actor_sprite = actor_target.sprite_index;
if (sharpshoot == true)
{
    if (actor_target == 1409)
        actor_sprite = 147;
    if (actor_target == 1411)
        actor_sprite = 4259;
    if (actor_target == 1412)
        actor_sprite = 3910;
    for (var i = 0; i < instance_number(obj_marker); i++)
    {
        marker[i] = instance_find(obj_marker, i);
        if (marker[i].sprite_index == spr_kris_zoosuit || marker[i].sprite_index == spr_susie_zoosuit || marker[i].sprite_index == spr_ralsei_zoosuit)
            marker[i].x = -9999;
    }
}
var _xx = 0;
if (actor_target == 1409 && obj_herokris.hurt == 1)
{
    actor_sprite = obj_herokris.hurtsprite;
    _xx = -20 + (obj_herokris.hurtindex * 10);
}
if (actor_target == 1411 && obj_herosusie.hurt == 1)
{
    actor_sprite = obj_herosusie.hurtsprite;
    _xx = -30 + (obj_herosusie.hurtindex * 10);
}
if (actor_target == 1412 && obj_heroralsei.hurt == 1)
{
    actor_sprite = obj_heroralsei.hurtsprite;
    _xx = -20 + (obj_heroralsei.hurtindex * 10);
}
if (actor_target == 1412 && actor_target.thissprite == actor_target.actsprite)
{
    xx = lerp(xx, 22, 0.2);
    yy = lerp(yy, 22, 0.2);
    ball_angle = lerp(ball_angle, -120, 0.2);
}
else if (actor_target == 1411 && actor_target.thissprite == actor_target.actsprite)
{
    xx = lerp(xx, 16, 0.2);
    ball_angle = lerp(ball_angle, -110, 0.2);
}
else
{
    if (actor_target == 1412)
    {
        xx = lerp(xx, 0, 0.2);
        yy = lerp(yy, 0, 0.3);
        ball_angle = lerp(ball_angle, -100, 0.3);
    }
    if (actor_target == 1411)
    {
        xx = lerp(xx, 0, 1);
        ball_angle = lerp(ball_angle, -100, 0.3);
    }
}
var _scale = 1.55;
if (actor_target == 1411)
    _scale = 2.02;
draw_sprite_ext(spr_dw_tv_gachaball_transparent, 2, ball_bottom_pos_x + xx + _xx, ball_bottom_pos_y + 4 + yy, _scale, _scale, ball_angle, c_white, ball_alpha);
draw_sprite_ext(actor_sprite, actor_target.image_index, actor_target.x + _xx, actor_target.y, 2, 2, 0, c_white, 1);
draw_sprite_ext(spr_dw_tv_gachaball_transparent, 3, ball_bottom_pos_x + xx + _xx, ball_bottom_pos_y + 4 + yy, _scale, _scale, ball_angle, c_white, ball_alpha);
draw_sprite_ext(spr_dw_tv_gachaball_transparent, 1, ball_top_pos_x + xx + _xx, ball_top_pos_y + 4 + yy, _scale, _scale, ball_angle, c_white, ball_alpha);
