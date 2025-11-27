if (con < 0)
    exit;
if (mode == 2)
{
    if (con == 0)
    {
        con = 2;
        default_palette_index = 2;
        target_characters = [statue_target, susie_target, ralsei_target, kris_target];
        outline_colors = [4155948, 13138410, 1959605, 15245824];
        for (var i = 0; i < instance_number(obj_ch4_DCB02_lightning); i++)
            lightning_areas[i] = instance_find(obj_ch4_DCB02_lightning, i);
        for (var i = 0; i < instance_number(obj_ch4_DCB02_lightning_mask); i++)
            lightning_mask_areas[i] = instance_find(obj_ch4_DCB02_lightning_mask, i);
        default_surface = surface_create(camera_get_view_width(0), camera_get_view_height(0));
        window_surface = surface_create(camera_get_view_width(0), camera_get_view_height(0));
        layer_set_visible(layer_get_id("FLOORTILES"), 0);
    }
    if (con == 10)
    {
        con = 11;
        snd_play(snd_thunder_instant);
        default_palette_index = 4;
        window_palette_index = 3;
        silhouette_alpha = 1;
        chara_palette_index = 0;
        shadow_alpha = 1;
        if (lightning_mode == 1)
        {
            silhouette_alpha = 0;
            chara_palette_index = 0;
        }
        scr_delay_var("con", 12, 31);
    }
    if (con == 12)
    {
        con = 13;
        if (lightning_mode == 1)
        {
            scr_lerpvar("silhouette_alpha", 0, 1, 50);
            scr_lerpvar("chara_palette_index", 0, 1, 50);
        }
        else
        {
            scr_lerpvar("chara_palette_index", 0, 1, 50);
            scr_lerpvar("shadow_alpha", 1, 0, 50);
            scr_lerpvar("window_palette_index", 3, 2, 50);
            scr_lerpvar("default_palette_index", 4, 5, 50);
        }
    }
}
