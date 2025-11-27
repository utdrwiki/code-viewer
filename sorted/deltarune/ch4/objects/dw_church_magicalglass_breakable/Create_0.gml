con = 0;
delay = 20;
timer = 0;
destroy = 0;
depth = 700000;
nosound = false;
idlealpha = 0.2;
clientlist = [];
array_push(clientlist, 1049);
array_push(clientlist, 1235);
array_push(clientlist, 1409);
clientlist_length = array_length(clientlist);
if (i_ex(obj_dw_churchc_dodge) && global.entrance != 12)
    idlealpha = 0;
image_alpha = idlealpha;
