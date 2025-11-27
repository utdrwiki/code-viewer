con = 0;
timer = 0;
targetx = -1;
targety = -1;
last_frame = -1;
if (i_ex(obj_rotating_tower_controller_new))
    x -= 40;

advance_frame = function(arg0)
{
    var tw = obj_rotating_tower_controller_new.tile_width;
    var th = obj_rotating_tower_controller_new.tile_height;
    var yoffset = arg0 * image_yscale * th;
    for (i = 0; i < image_yscale; i++)
    {
        for (ii = 0; ii < image_xscale; ii++)
        {
            var xx = targetx + (ii * tw);
            var yy = targety + (i * th);
            var xxx = x + (ii * tw);
            var yyy = y + (i * th) + yoffset;
            with (obj_rotating_tower_controller_new)
            {
                var changed = copy_tilemap_image_index(xxx, yyy, xx, yy);
                if (changed > 0)
                {
                    for (j = 0; j < 2; j++)
                    {
                        for (jj = 0; jj < 2; jj++)
                        {
                            if (random_range(0, 1) > 0.25 && changed & ((j + 1 + (jj * 4)) > 0))
                            {
                                var tilex = (xx / tile_width_fine) + j;
                                var tiley = (yy / tile_height_fine) + jj;
                                if (tile_vis[tilex] == 1)
                                {
                                    var marker = instance_create(tower_x + tile_x[tilex] + random_range(0, tile_xscale[tilex]), (tiley * tile_height_fine) + random_range(0, tile_height_fine), obj_marker);
                                    marker.depth = 1000099;
                                    marker.sprite_index = spr_dw_fountain_broken_particle;
                                    marker.image_index = irandom_range(0, 8);
                                    marker.image_speed = 0;
                                    marker.image_blend = tile_color[tilex];
                                    marker.hspeed = random_range(-0.5, 0.5);
                                    marker.vspeed = random_range(0.5, 1.5);
                                    scr_lerpvar_instance(marker, "image_alpha", 1, 0, irandom_range(8, 15));
                                    scr_doom(marker, 15);
                                }
                            }
                        }
                    }
                }
            }
            if (copy_collision)
            {
                var old_collision = instance_position(xx - (0.5 * tw), yy + (0.5 * th), obj_climb_climbable);
                var new_collision = tilemap_get_at_pixel(obj_rotating_tower_controller_new.tm_collision, xxx + tw, yyy);
                if (old_collision != -4 && new_collision <= 0)
                {
                    with (old_collision)
                    {
                        if (place_meeting(x, y, obj_climb_kris))
                        {
                            with (obj_climb_kris)
                                fallingcon = 1;
                        }
                        instance_destroy();
                    }
                }
                else if (new_collision > 0 && old_collision == -4)
                {
                    instance_create(xx - tw, yy, obj_climb_climbable);
                }
            }
        }
    }
};
