con = -1;
hand_sprite = spr_titan_climb_hand;
finger_sprite = 1547;
arm_sprite = 4314;
finger_anim = 0;
anim_timer = 0;
base_rot = -10;
target_x = x + 8;
pull_start = false;
pull_timer = 0;
shake_active = false;
speed_modifier = 0.5;
depth = 100300;
floor_index = 0;
floor_marker = -4;
floor_markers = [];
for (var i = 0; i < 8; i++)
{
    floor_markers[i] = scr_marker(80 + (i * 240), 720, spr_titan_climb_ground);
    floor_markers[i].depth = depth + 10;
    floor_markers[i].image_index = i;
}
