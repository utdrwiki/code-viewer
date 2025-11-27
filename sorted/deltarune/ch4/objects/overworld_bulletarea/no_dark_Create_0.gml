showArea = scr_debug() ? 1 : 0;
image_alpha = 0;
depth = 777777;
keepHidden = 0;
active = 0;
cancel = 0;
onlyActiveIfBulletsExist = 0;
onlyActiveIfSpecialObjectExists = 0;
specialObject = 0;
checkid = id;
extflag = 0;
timer = 0;
ignorebuffer = 0;
if (showArea == 0)
    image_alpha = 0;
if (showArea == 1 && scr_debug())
    image_alpha = 0.1;
checkid = id;
