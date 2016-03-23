///bosschasestate()
image_index = 0;

var imagea = sprite_index;
if keyboard_check (vk_down) {
    show_message (string (imagea))
}    
var dis =  point_distance(x, y, oPlayer.x, y);
if (dis <= sprite_width / 2 - 16 || place_meeting (x - 1,  y, oSolid) || place_meeting (x + 1,  y, oSolid)) {
    vspd = 0; 
    hspd = 0;
    state = bosssmashstate;
    audio_play_sound (aJump, 6, false);
    
}else{
    hspd = (oPlayer.x - x) * .05;
}
move(oSolid);

