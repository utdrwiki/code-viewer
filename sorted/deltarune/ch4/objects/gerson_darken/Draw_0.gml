depth = 800;
if (i_ex(obj_growtangle) && con == 0)
{
    if (image_alpha < 1)
        image_alpha += 0.05;
}
else
{
    if (image_alpha > 0)
        image_alpha -= 0.05;
    if (image_alpha <= 0)
    {
        instance_destroy();
        obj_tensionbar.depth = savetensiondepth;
        obj_heroparent.depth = savesusiedepth;
        obj_hammer_of_justice_enemy.depth = savegersondepth;
    }
}
draw_sprite_ext(spr_whitepixel, 0, camerax(), cameray(), 999, 999, 0, c_black, image_alpha);
