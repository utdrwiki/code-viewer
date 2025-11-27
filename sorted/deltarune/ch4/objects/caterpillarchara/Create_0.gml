scr_depth();
image_speed = 0;
if (global.darkzone)
    scr_darksize(id);
walk = 0;
fun = 0;
follow = 1;
runmove = 0;
dir = 0;
walkbuffer = 0;
walktimer = 0;
slided = 0;
specialed = 0;
init_clothes = false;
blushtimer = 0;
shadow_force_off = false;
name = "susie";
target = 12;
sprite_init = false;
target = 12;
usprite = spr_susieu_dark;
dsprite = spr_susied_dark;
rsprite = spr_susier_dark;
lsprite = spr_susiel_dark;
slidesprite = spr_susie_slide;
climbsprite = 2649;
if (global.chapter >= 2)
{
    usprite = spr_susie_walk_up_dw;
    rsprite = spr_susie_walk_right_dw;
    lsprite = spr_susie_walk_left_dw;
    dsprite = spr_susie_walk_down_dw;
    if (global.darkzone == 0)
    {
        usprite = spr_susie_walk_up_lw;
        rsprite = spr_susie_walk_right_lw;
        lsprite = spr_susie_walk_left_lw;
        dsprite = spr_susie_walk_down_lw;
        if (global.chapter == 4)
        {
            init_clothes = false;
            if (global.darkzone == 0)
            {
                if (global.plot >= 11 && global.plot < 35)
                {
                    init_clothes = true;
                    dsprite = spr_susie_walk_down_church;
                    rsprite = spr_susie_walk_right_church;
                    lsprite = spr_susie_walk_left_church;
                    usprite = spr_susie_walk_up_church;
                }
                if (global.plot >= 220)
                {
                    init_clothes = true;
                    rsprite = spr_susie_walk_right_lw_unhappy;
                    dsprite = spr_susie_walk_down_lw_unhappy;
                    lsprite = spr_susie_walk_left_lw_unhappy;
                }
                if (room == room_town_shelter)
                {
                    init_clothes = true;
                    rsprite = spr_susie_walk_right_lw_unhappy;
                    dsprite = spr_susie_walk_down_lw_unhappy;
                    lsprite = spr_susie_walk_left_lw_unhappy;
                }
            }
            else if (room == room_dw_castle_town)
            {
                if (scr_flag_get(793) == 1)
                {
                    init_clothes = true;
                    dsprite = spr_susie_lancer_carry_walk_down;
                    rsprite = spr_susie_lancer_carry_walk_right;
                    lsprite = spr_susie_lancer_carry_walk_left;
                    usprite = spr_susie_lancer_carry_walk_up;
                }
            }
        }
    }
}
usprite_blush = spr_ralseiu;
dsprite_blush = spr_ralseid;
rsprite_blush = spr_ralseir_blush;
lsprite_blush = spr_ralseil_blush;
if (global.chapter >= 2)
{
    usprite_blush = spr_ralsei_walk_up;
    dsprite_blush = spr_ralsei_walk_down_blush;
    rsprite_blush = spr_ralsei_walk_right_blush;
    lsprite_blush = spr_ralsei_walk_left_blush;
}
parent = obj_mainchara;
pd = parent.dsprite;
pr = parent.rsprite;
pl = parent.lsprite;
pu = parent.usprite;
for (i = 0; i < 75; i += 1)
{
    remx[i] = parent.x;
    remy[i] = parent.y;
    facing[i] = global.facing;
    sliding[i] = 0;
    special[i] = 0;
    if (global.chapter == 4 && room == room_dw_rotating_tower)
    {
        tower_angle[i] = 0;
        tower_yoffset[i] = 480;
    }
}
depth = parent.depth + 5;
mywidth = sprite_width;
myheight = sprite_height;
xoffset = 0;
yoffset = 0;
init = 0;
forget = 0;
ignoredepth = 0;
halign = 6;
valign = 16;
