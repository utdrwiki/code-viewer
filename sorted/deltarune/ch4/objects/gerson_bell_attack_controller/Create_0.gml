timer = 0;
con = 0;
bell = instance_create(obj_growtangle.x - 175 - 60, obj_growtangle.y - 60, obj_gerson_bell);
bell = instance_create(obj_growtangle.x + 130 + 30, obj_growtangle.y - 60, obj_gerson_bell);
leftgerson = instance_create(obj_growtangle.x - 280 - 60, obj_growtangle.y, obj_gerson_teleport);
leftgerson.type = 3;
leftgerson.depth = obj_gerson_bell.depth - 2;
rightgerson = instance_create(obj_growtangle.x + 280 + 30, obj_growtangle.y, obj_gerson_teleport);
rightgerson.type = 3;
rightgerson.image_xscale = -2;
rightgerson.depth = obj_gerson_bell.depth - 2;
with (obj_hammer_of_justice_enemy)
    visible = false;
