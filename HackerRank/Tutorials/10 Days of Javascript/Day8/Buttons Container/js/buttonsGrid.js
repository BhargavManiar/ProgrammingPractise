var last = "4";
var btnRotate = ["1", "2", "3", "6", "9", "8", "7", "4"];
var btnID = ["1", "2", "3", "6", "9", "8", "7", "4"];

var rotate = function() {
    for (var i = 7; i > 0; i--) {
        btnRotate[i] = btnRotate[i - 1];
    }
    
    btnRotate[0] = last;
    last = btnRotate[7];
    
    for (var i = 0; i < 8; i++) {
        document.getElementById("btn" + btnID[i]).innerText = btnRotate[i];
    }
}