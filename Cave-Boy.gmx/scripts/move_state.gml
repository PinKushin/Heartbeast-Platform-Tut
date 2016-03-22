///move_state()
if !place_meeting (x, y+1, oSolid) {
    vspd += grav;
    
    //player is in the air
    sprite_index = sPlayerJump;
    image_speed = 0;
    image_index = (vspd > 0);
    
    //control jump height
    if up_release && vspd < -6 {
        vspd = -6;
    }
}else{
    vspd = 0;
    
    //Jump
    if up {
        vspd = -16;
        audio_play_sound (aJump, 5, false);
    }
    
    //player on the ground
    if hspd == 0 {
        sprite_index = sPlayerIdle;
    }else{
        sprite_index = sPlayerWalk;
        image_speed = .6
    }
}
if right || left {
    hspd += right - left * acc;
    hspd_dir = right - left;
    
    if hspd > spd { hspd = spd};
    if hspd < -spd {hspd = -spd};
} else {
    applyfriction (2)
}

if hspd !=0 {
    image_xscale = sign(hspd);
}

//play the landing sound
if place_meeting (x, y + vspd + 1, oSolid) && vspd > 0 {
    audio_emitter_pitch (audio_em, random_range (0.8, 1.2));
    audio_emitter_gain (audio_em, 0.2);
    audio_play_sound_on (audio_em, aStep, false, 6);
}

move(oSolid);

///Check for ledge grab state
var falling = y - yprevious > 0;
var wasnt_wall = !position_meeting (x + 17 * image_xscale, yprevious, oSolid);
var is_wall = position_meeting (x + 17 * image_xscale, y, oSolid);

if falling && wasnt_wall && is_wall {
    hspd = 0;
    vspd = 0;
    
    //move against the ledge
    while !place_meeting (x + image_xscale, y, oSolid) {
        x+= image_xscale;
    }
    //move to right height
    while position_meeting(x + 17 * image_xscale, y - 1, oSolid) {
        y -= 1;
    }
    
    sprite_index = sPlayerGrab;
    state = ledge_grab_state;
    
    ///Play ledge grab sound
    audio_emitter_pitch (audio_em, 1.5);
    audio_emitter_gain (audio_em, 0.1);
    audio_play_sound_on (audio_em, aStep, false, 6);
}
