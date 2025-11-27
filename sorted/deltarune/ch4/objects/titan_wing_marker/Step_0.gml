if (!init)
{
    init = true;
    if (wing_layer == 4)
        debug_print("wing is the same layer as the titan itself! you don't want that ok");
    depth = obj_titan_enemy.depth - ((wing_layer - 4) * depth_mul);
    if (wing_layer == 5)
        sprite_index = spr_cover_wings_defense_layer_5;
    else if (wing_layer == 6)
        sprite_index = spr_cover_wings_defense_layer_6;
    else if (wing_layer == 7)
        sprite_index = spr_cover_wings_defense_layer_7;
    if (wing_layer < 5 || wing_layer > 7)
        debug_print("wing_layer is WRONG baby");
}
