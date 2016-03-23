///bosssmashstate
image_index = 1;
if !place_meeting (x, y + 1, oSolid) {
    if vspd < 16 {
        vspd += 2;
    }
    move(oSolid)
}else{
    state = bossstallstate;
    alarm[0] = room_speed;
    audio_play_sound (aStep, 8, false);
    if position_meeting (x, y, oLava) {
        hp -= 1;
        audio_play_sound (aSnake, 9, false)
    }
        
}
