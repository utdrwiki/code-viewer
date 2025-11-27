if (i_ex(shadow) || !airborne)
    exit;
shadow = instance_create(x, y, obj_marker);
shadow.image_blend = c_black;
shadow.sprite_index = sprite_index;
shadow.depth = maxDepth + 1;
shadow.image_xscale = 2;
shadow.image_yscale = 2;
