// 

function loadScore() {
    fetch("rawscore")
        .then(function(response) {
            return response.json();
        })
        .then(function (data) { 
            fill_score_board(data);
        })
        .catch(function (err) {
            console.log('error: ' + err);
        });
}


function init_loading() {
    setInterval(loadScore, 1000)
}

function fill_score_board(data) {
    var i = data["GameTimeToGo"];
    document.getElementsByName("blueteamname").innerHTML = 'Blue Team = ' + data["BlueTeamName"];
    document.getElementsByName("redteamname").innerHTML = 'Red Team = ' + data["RedTeamName"];
    document.getElementById("timetogo").innerHTML = i;
} 