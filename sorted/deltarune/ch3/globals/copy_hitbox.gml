function scr_hitbox_copy(arg0, arg1)
{
    var __ww = arg0.bbox_right - arg0.bbox_left;
    var __hh = arg0.bbox_bottom - arg0.bbox_top;
    arg1.image_xscale = __ww / sprite_get_width(arg1.sprite_index);
    arg1.image_yscale = __hh / sprite_get_height(arg1.sprite_index);
    arg1.x = arg0.bbox_left + arg1.sprite_xoffset;
    arg1.y = arg0.bbox_top + arg1.sprite_yoffset;
}

function scr_hitbox_copyto(arg0)
{
    scr_hitbox_copy(self, arg0);
}

function scr_hitbox_copyfrom(arg0)
{
    scr_hitbox_copy(arg0, self);
}

function scr_copy_hitbox(arg0)
{
    arg0.x = x;
    arg0.y = y;
    arg0.sprite_index = sprite_index;
    arg0.visible = false;
    arg0.image_xscale = image_xscale;
    arg0.image_yscale = image_yscale;
    arg0.image_angle = image_angle;
}
