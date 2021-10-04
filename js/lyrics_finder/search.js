const { exec } = require("child_process");
const fs = require('fs')
var singers = 'Riton, Kah-lo'; //artist here
var songname = 'Fake ID'; //songname here

function get_lyrics (singers, songname){
    var split_artists = singers.split(", "); // Separate differents artists : for Riton, Kah-Lo it will search for Riton, Kah-Lo - Riton - Kah-Lo
split_artists.splice(2, 0, singers);
for (let i = 0; i < split_artists.length; i++) {
    exec("python3 searcher.py '"+split_artists[i]+"' '"+songname+"' '"+singers+"'", (error, stdout, stderr) => {
    if (error) {
        console.log(`error: ${error.message}`);
        return;
    }
    if (stderr) {
        console.log(`stderr: ${stderr}`);
        return;
    }
    if (`${stdout}` == 'LYRICS NOT FOUND\n'){
        return;
    }
    if (`${stdout}` == 'OK\n'){
        console.log('LYRICS FOUNDS : ')
        console.log(__dirname+'/lyrics/'+singers + ' - ' + songname + '.lrc')
        process.exit();

    }
    else{
        console.log('Some error came')
    }
    console.log('LYRICS NOT FOUND')

});
}
}
get_lyrics(singers, songname)
