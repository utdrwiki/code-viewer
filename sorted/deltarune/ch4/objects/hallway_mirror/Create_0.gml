sx = 0;
sy = 0;
alpha = 0.1;
shadow = scr_marker(200, 70, spr_krisd);
shadow.depth = depth - 100;
shadow_susie = -4;
if (global.chapter == 4)
{
    if (scr_havechar(2))
    {
        shadow_susie = scr_marker(200, 70, spr_susied);
        shadow_susie.depth = shadow.depth + 10;
    }
}
