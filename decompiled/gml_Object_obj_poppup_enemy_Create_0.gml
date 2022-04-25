scr_enemy_object_init()
talkmax = 90
image_speed = 0.16666666666666666
idlesprite = spr_poppup_idle
hurtsprite = spr_poppup_hurt
sparedsprite = spr_poppup_spared
becameTired = 0
becameSpareable = 0
cloning = 0
cloneTimer = 0
staticOwner = 0
staticPoppup = 0
animspeed = 0.16666666666666666
clonedirection = 210
for (var i = 0; i < 3; i++)
{
    for (var j = 0; j < 6; j++)
    {
        staticX[i][j] = random_range(400, 600)
        staticY[i][j] = random_range(10, 280)
    }
}
blockTimer = 0
blockAds = 0
blocked = 0
mercytotal = 0
popupscreated = 0
poppupwait = 0
allblocked = 0
avoiding = 0
