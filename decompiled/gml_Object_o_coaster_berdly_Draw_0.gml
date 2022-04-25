if (instance_exists(obj_berdlyb_enemy) && sprite_index != spr_berdlyb_shocked_battle)
{
    sprite_index = obj_berdlyb_enemy.sprite_index
    image_index = (obj_berdlyb_enemy.image_index - 1)
}
if (obj_berdlyb_enemy.endcon == 1)
    sprite_index = spr_berdlyb_shocked_battle
var yy = 0
if (sprite_index == spr_berdlyb_shocked_battle)
{
    xx = 17
    yy = -18
}
else
    xx = -8
if (queenmode == false)
{
    draw_sprite_ext(spr_coaster_berdly_back, 0, (x + xshake), ((y + yshake) + 16), image_xscale, image_yscale, image_angle, image_blend, image_alpha)
    if ((!instance_exists(obj_berdlyb_spearblaster)) && obj_berdlyb_enemy.state != 3)
    {
        draw_sprite_ext(sprite_index, image_index, ((x + xshake) + xx), (((((y + yshake) - (sprite_get_height(sprite_index) * 2)) - 11) + 20) + yy), image_xscale, image_yscale, image_angle, image_blend, image_alpha)
        if (obj_berdlyb_enemy.flash == true)
            draw_sprite_ext_flash(sprite_index, image_index, ((x + xshake) + xx), ((((y + yshake) - (sprite_get_height(sprite_index) * 2)) - 11) + 20), image_xscale, image_yscale, image_angle, image_blend, (((-(cos((obj_berdlyb_enemy.fsiner / 5)))) * 0.4) + 0.6))
    }
    if (xshake == 0)
        draw_sprite_ext(spr_coaster_berdly, 0, (x + xshake), ((y + yshake) + 16), image_xscale, image_yscale, image_angle, image_blend, image_alpha)
    if (xshake != 0)
        draw_sprite_ext(spr_coaster_berdly, 1, (x + xshake), ((y + yshake) + 16), image_xscale, image_yscale, image_angle, image_blend, image_alpha)
}
indsprite = spr_coaster_queen_indicator
if (queenmode == true)
    indsprite = spr_coaster_queen_indicator
if (movetype == 0 && drawpremonition == true)
{
    for (i = 0; i < premonition; i++)
    {
        blendo = c_aqua
        if (i == 1)
            blendo = c_yellow
        if (i >= 2)
            blendo = c_orange
        if (forceypos == 0)
            draw_sprite_ext(indsprite, image_index, ((x + (i * 30)) + (40 * queenmode)), yspot[0], image_xscale, image_yscale, 0, blendo, ((0.4 + (sin((siner / 4)) * 0.1)) - (i * 0.1)))
        if (forceypos == 1)
            draw_sprite_ext(indsprite, image_index, ((x + (i * 30)) + (40 * queenmode)), yspot[1], image_xscale, image_yscale, 0, blendo, ((0.4 + (sin((siner / 4)) * 0.1)) - (i * 0.1)))
        if (forceypos == 2)
            draw_sprite_ext(indsprite, image_index, ((x + (i * 30)) + (40 * queenmode)), yspot[2], image_xscale, image_yscale, 0, blendo, ((0.4 + (sin((siner / 4)) * 0.1)) - (i * 0.1)))
        if (forceypos == -1)
            draw_sprite_ext(indsprite, image_index, ((x + (i * 30)) + (40 * queenmode)), yspot[nexty[(ycount + i)]], image_xscale, image_yscale, 0, blendo, ((0.4 + (sin((siner / 4)) * 0.1)) - (i * 0.1)))
    }
}
if (queenmode == true)
    draw_sprite_ext(sprite_index, image_index, (x + xshake), (y + yshake), image_xscale, image_yscale, image_angle, image_blend, image_alpha)
