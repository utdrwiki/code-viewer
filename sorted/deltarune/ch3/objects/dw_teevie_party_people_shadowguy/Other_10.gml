var _sprite_pool = [spr_shadowman_spare, spr_shadowman_sax_a, spr_shadowman_sneak];
sprite_index = _sprite_pool[irandom(array_length(_sprite_pool) - 1)];
if (irandom(100) < 5)
    sprite_index = (irandom(100) < 50) ? spr_shadowman_sax_bunny : spr_shadowman_hurt;
if (sprite_index == spr_shadowman_sneak)
    x_pos += 50;
