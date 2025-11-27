timer++;
siner++;
if (con == 0)
{
    if (timer == 1)
        scr_lerpvar("image_alpha", 0, 1, 15, 2, "out");
    if (timer == 18)
    {
        fgalpha = 1;
        scr_lerpvar("ralseialpha", 0, 1, 8, 2, "in");
    }
    if (timer == 318)
        scr_lerpvar("ralseialpha", 1, 0, 8, 2, "out");
    if (timer == 327)
    {
        fgalpha = 0;
        scr_lerpvar("image_alpha", 1, 0, 25, 2, "out");
    }
    if (timer >= 352)
        instance_destroy();
    if (obj_board_camera.shift != "none")
    {
        con = 1;
        with (obj_lerpvar)
        {
            if (target == id)
            {
                show_debug_message_concat("kild");
                instance_destroy();
            }
        }
        fgalpha = 0;
        scr_lerpvar("ralseialpha", ralseialpha, 0, 5, 2, "out");
        scr_lerpvar("image_alpha", image_alpha, 0, 15, 2, "out");
        scr_doom(id, 15);
    }
}
var ralseisin = sin(siner / 15) * 6;
var ralseisin2 = sin(siner / 60) * 4;
if (global.flag[1079] == 1)
{
    ralseisin = -6 + (siner / 14);
    ralseisin2 = 0;
}
draw_sprite_ext(bg, 0, x, y, 1, 1, 0, image_blend, image_alpha);
draw_sprite_ext(spr_gameshow_drowningRalsei_ralsei, 0, x + 97 + ralseisin2, y + 20 + ralseisin, 1, 1, 0, image_blend, image_alpha * ralseialpha);
draw_sprite_ext(fg, 0, x, y, 1, 1, 0, image_blend, image_alpha * fgalpha);
