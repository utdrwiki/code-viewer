if (i_ex(obj_battlecontroller))
    depth = obj_battlecontroller.depth;
else if (i_ex(obj_shutta_enemy))
    depth = obj_shutta_enemy.depth;
x = camerax() + (camerawidth() / 2);
y = cameray() + 160;
enemy = -4;
timer = 0;
timer_duration = 180;
state = "intro";
subact = "nothing";
subact_state = "init";
tookaphoto = true;
slide_time = 0;
slide_duration = 15;
siner = 0;
flash_alpha = 0;
image_alpha = 0;
image_speed = 0;
targetid = -4;
message_default = stringsetloc("* You missed! Try to take a real photo next time!", "obj_shutta_photo_controller_slash_Create_0_gml_31_0");
message_nicephoto = stringsetloc("* Good, good, EYE approve!", "obj_shutta_photo_controller_slash_Create_0_gml_33_0");
message_splendidphoto = stringsetloc("* Photo-GENIC, it's in your GENETICS!", "obj_shutta_photo_controller_slash_Create_0_gml_34_0");
message_badphoto = stringsetloc("* That's okay, baby! Give it another SSSHOT!", "obj_shutta_photo_controller_slash_Create_0_gml_35_0");
if (choose(0, 1) == 1)
    message_nicephoto = stringsetloc("* Confidence, baby, CONFIDENCE!", "obj_shutta_photo_controller_slash_Create_0_gml_37_0");
if (choose(0, 1) == 1)
    message_splendidphoto = stringsetloc("* Fabulous! Eye-hand it to you guys!", "obj_shutta_photo_controller_slash_Create_0_gml_38_0");
message_nicephoto2 = stringsetloc("* A PERFECT SHOT!! DON'T KNOW WHO WANTS IT, BUT STILL!", "obj_shutta_photo_controller_slash_Create_0_gml_41_0_b");
message_unposed = stringsetloc("* Photo at the right moment for extra power!", "obj_shutta_photo_controller_slash_Create_0_gml_41_0");
message_notcentered = stringsetloc("* Rule of thirds? No! Try to center your target, folks!", "obj_shutta_photo_controller_slash_Create_0_gml_42_0");
comment_center = stringsetloc("Great shot!", "obj_shutta_photo_controller_slash_Create_0_gml_50_0");
comment_offcenter = "";
comment_offside = "";
comment_nicepose = "";
if (obj_shutta_enemy.amiabossfight == true)
    message_default = stringsetloc("* Nothing!? You shot nothing!? Shows why you keep me off!", "obj_shutta_photo_controller_slash_Create_0_gml_52_0");
message_kris = stringsetloc("* Nice! That one's going in my Kris compilation!", "obj_shutta_photo_controller_slash_Create_0_gml_55_0");
message_susie = stringsetloc("* Oh! A wild Susie photo! ... Arms inside the ride, folks!", "obj_shutta_photo_controller_slash_Create_0_gml_56_0");
message_ralsei = stringsetloc("* Ralsei photo!? We can sell that! Here's 100PTs!", "obj_shutta_photo_controller_slash_Create_0_gml_57_0");
message_kris2 = stringsetloc("* Stop! My Kris compilation is full!", "obj_shutta_photo_controller_slash_Create_0_gml_59_0");
message_susie2 = stringsetloc("* What is this, a Susie safari?", "obj_shutta_photo_controller_slash_Create_0_gml_60_0");
message_ralsei2 = stringsetloc("* More Ralsei!? No, we need the scarcity!!", "obj_shutta_photo_controller_slash_Create_0_gml_61_0");
message_toilet = stringsetloc("* Photo of toilet!?! Are we still TV-Y7!?", "obj_shutta_photo_controller_slash_Create_0_gml_63_0");
message_toilet2 = stringsetloc("* A perfect shot!! But are we still TV-Y7!?", "obj_shutta_photo_controller_slash_Create_0_gml_64_0");
endmessage = message_default;
mercygained = 0;
min_width = 64;
min_height = 64;
max_width = 164;
max_height = 128;
width = min_width;
height = min_height;
photo_surface = -1;
photo_width = max_width;
photo_height = max_height;
angle = 0;
global.surface_buffer = -1;
subjects = [];
uncentered_subject = false;
offside_subject = false;
have_subject = false;
centered_distance = 40;
reticle_size = 9;
got_kris = false;
got_susie = false;
got_ralsei = false;
closest_hero = "none";
fastphoto = false;
powerphoto = false;
timerb = 0;
posemax = 60 + irandom(30);
posesiner = 0;
savex = x;
rotatingvar = false;
pipetimer = 0;
palmtimer = 0;
type3alreadyused = false;
difficulty = 0;
count = 0;
fun = 0;
endminigame = 0;
filter1 = instance_create(-9999, -9999, obj_marker);
filter1.sprite_index = spr_shutta_filter1;
filter1.image_xscale = 1.5;
filter1.image_yscale = 1.5;
filter2 = instance_create(-9999, -9999, obj_marker);
filter2.sprite_index = spr_shutta_filter1;
filter2.image_xscale = 1.5;
filter2.image_yscale = 1.5;
filter3 = instance_create(-9999, -9999, obj_marker);
filter3.sprite_index = spr_shutta_filter2;
filter4 = instance_create(-9999, -9999, obj_marker);
filter4.sprite_index = spr_shutta_filter2;
with (obj_herokris)
    mask_index = spr_kris_peace;
with (obj_herosusie)
    mask_index = spr_susie_hand_hips;
with (obj_heroralsei)
    mask_index = spr_ralsei_funnyface;
screenshot = -1;
reticle_over_good_shot = false;
reticle_over_good_shot_prev = false;
disablemovement = false;
ralseicon = 0;
introtimer = 0;
bullettarget = -1;
secrettargetx = 0;
secrettargety = 0;
krisstate = -1;
krisfaceaction = -1;
susiestate = -1;
susiefaceaction = -1;
ralseistate = -1;
ralseifaceaction = -1;
if (i_ex(obj_herokris))
{
    krisstate = obj_herokris.state;
    krisfaceaction = global.faceaction[obj_herokris.myself];
}
if (i_ex(obj_herosusie))
{
    susiestate = obj_herosusie.state;
    susiefaceaction = global.faceaction[obj_herosusie.myself];
}
if (i_ex(obj_heroralsei))
{
    ralseistate = obj_heroralsei.state;
    ralseifaceaction = global.faceaction[obj_heroralsei.myself];
}
