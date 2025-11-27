if (!is_init)
    exit;
depth = character.depth - 200;
draw_sprite_ext(character.sprite_index, character.image_index, character.x, ((character.y + (character.sprite_height * 2)) - 4) + shadow_offset, 2, -2, 0, c_black, 0.8);
draw_sprite_ext(character.sprite_index, character.image_index, character.x, character.y, 2, 2, 0, c_white, 1);
scr_draw_set_mask(true);
draw_sprite_ext(character.sprite_index, character.image_index, character.x, character.y, 2, 2, 0, c_white, max_opacity);
scr_draw_in_mask_begin();
draw_sprite_ext(character.sprite_index, character.image_index, character.x, character.y + 4, 2, 2, 0, c_black, 1);
scr_draw_in_mask_end();
