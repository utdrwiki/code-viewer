snd_stop(snd_item);
snd_play_pitch(snd_item, 1.2);
var pointsDisplay = instance_create(centerx(), centery(), obj_board_pointsGetDisplay);
pointsDisplay.amount = amount;
instance_destroy();
