////exitstate()
if image_alpha > 0 {
    image_alpha -= 0.25;
}else{
    if room != room_last {
        room_goto_next ();
    }else{
        ///caculate score
        score = oPlayerStats.sapphires
        
        ///open highscores & besttime
        ini_open ("Settings.ini");
        oPlayerStats.highscore = ini_read_real ("score", "highscore", 0)
        oPlayerStats.besttime = ini_read_real ("score", "besttime", 0)
                
        //a new highscore case
        if score > oPlayerStats.highscore {
             oPlayerStats.highscore = score;
             ini_write_real ("score", "highscore", oPlayerStats.highscore)
        }
        //if new besttime case
        if oPlayerStats.time / room_speed < oPlayerStats.besttime {
            oPlayerStats.besttime = oPlayerStats.time;
            ini_write_real ("score", "besttime", oPlayerStats.besttime);
        }
        
        
        //close the ini file
        ini_close ()
        //goto highscore room
        room_goto (rHighScore);
        
    }
}
