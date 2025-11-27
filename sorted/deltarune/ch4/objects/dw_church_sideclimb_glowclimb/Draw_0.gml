if (view_current == 0)
    siner++;
var ind = 1;
with (obj_dw_church_sideclimb)
{
    if (timber > 250)
        ind = 1;
    else
        ind = timber / 250;
}
var colind = ease_out_quart(ind, 0, 1, 1);
var col = merge_color(#4E4E73, c_red, 1 - colind);
draw_set_blend_mode(bm_add);
for (var i = 0; i < (image_xscale / 2); i++)
{
    for (var j = 0; j < (image_yscale / 2); j++)
    {
        var amt = abs(sin((siner + (-j * 60)) / 40)) + 0.5;
        draw_sprite_ext(sprite_index, image_index, x + (i * 40) + (sin((siner + (i * 40)) / 5) * 2), y + (j * 40) + (cos((siner + (j * 40)) / 5) * 2), 2, 2, 0, col, image_alpha * amt * 0.125);
        draw_sprite_ext(sprite_index, image_index, (x + (i * 40)) - (cos((siner + (i * 40)) / 5) * 2), (y + (j * 40)) - (sin((siner + (j * 40)) / 5) * 2), 2, 2, 0, col, image_alpha * amt * 0.125);
        draw_sprite_ext(sprite_index, image_index, x + (i * 40), y + (j * 40), 2, 2, 0, col, image_alpha * amt);
    }
}
draw_set_blend_mode(bm_normal);
