drawx = ((__view_get((0 << 0), 0) * -0.125) + xstart)
if (room == room_dw_mansion_acid_tunnel_exit)
    drawy = ((__view_get((1 << 0), 0) * -0.125) + ystart)
scr_draw_sprite_tiled_area(spr_mansion_ferris_wheel_bg, 0, (drawx + x_offset), (drawy + y_offset), (drawx + x_offset), drawy, room_width, ((drawy + y_offset) + view_hport[0]), 1, 1, c_white, true)
