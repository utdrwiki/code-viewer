if (!instance_exists(obj_growtangle))
    exit;
gpu_set_blendenable(false);
gpu_set_colorwriteenable(false, false, false, true);
draw_set_alpha(0);
ossafe_fill_rectangle(camerax(), cameray(), camerax() + 640, cameray() + 480, false);
draw_set_alpha(image_alpha);
if (i_ex(obj_gerson_growtangle))
    ossafe_fill_rectangle(obj_gerson_growtangle.x1 + 3, obj_gerson_growtangle.y1 + 3, obj_gerson_growtangle.x2 - 3, obj_gerson_growtangle.y2 - 3, false);
else if (obj_growtangle.image_xscale == 2)
    ossafe_fill_rectangle(gt_minx() + 5, gt_miny() + 5, gt_maxx() - 4, gt_maxy() - 4, false);
else
    ossafe_fill_rectangle(gt_minx() + 3, gt_miny() + 3, gt_maxx() - 3, gt_maxy() - 3, false);
gpu_set_blendenable(true);
gpu_set_colorwriteenable(true, true, true, true);
gpu_set_blendmode_ext(bm_dest_alpha, bm_inv_dest_alpha);
gpu_set_alphatestenable(true);
gpu_set_alphatestref(1);
draw_self();
scr_draw_in_box_end();
draw_set_alpha(1);
