if (myinteract == 0)
    facing = dfacing
scr_npcdir_ch1()
if (instance_exists(obj_face_ch1) && global.fc == 1)
    image_index = obj_face_ch1.face_index
else
    image_index = 0
