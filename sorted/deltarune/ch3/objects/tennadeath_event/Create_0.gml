con = 0;
timer = 0;
scr_darksize();
scr_depth();
fg_arm = scr_dark_marker(x, y, spr_tennadeath_arm_fg);
fg_arm.depth = depth - 5;
with (fg_arm)
    scr_doom(id, 150);
bg_arm = scr_dark_marker(x, y, spr_tennadeath_arm_bg);
bg_arm.depth = depth + 5;
with (bg_arm)
    scr_doom(id, 150);
armsparks = 0;
animindex = 0;
testbars = 0;
