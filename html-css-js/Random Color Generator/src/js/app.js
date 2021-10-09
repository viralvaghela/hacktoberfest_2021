const btn = document.getElementById("btn");
const btnCopy = document.getElementById("btn-copy");
const color = document.querySelector(".color");

btn.addEventListener("click", changeColor);
btnCopy.addEventListener("click", clipboardCopy);

document.body.onkeyup = function(e){
    if(e.keyCode == 32) changeColor();
}

function changeColor(){
    const hexColor ='#'+ Math.floor(Math.random()*16777215).toString(16);
    document.body.style.backgroundColor = hexColor;
    color.textContent = hexColor;
    color.style.color = hexColor;
}

async function clipboardCopy() {
    var copyText = document.getElementById("color").innerHTML;
    console.log(copyText);
    await navigator.clipboard.writeText(copyText);
}