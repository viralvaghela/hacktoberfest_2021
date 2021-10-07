const time= document.querySelector('.time');
const start= document.querySelector('#start');
const stop= document.querySelector('#stop');
const clear= document.querySelector('#clear');

let msec=0,sec=0;min=0,t;

function addtime() {
    msec= Date.now()-timenow;
    let sec= (Math.floor(msec/1000));
    let min= (Math.floor(sec/60));
    let milli= msec.toString().length <= 2 ?
    `${format(msec.toString().split('')[msec.toString().length-2])}` : `${format(msec.toString().split('')[msec.toString().length-3])}
    ${format(msec.toString().split('')[msec.toString().length-2])}`;
    console.log(milli);
    time.innerHTML=format(min) + " : " +format(sec) + " . " + milli;
}

function format(data) {
    return (data ? (data <= 9 ? "0" + data:data): "00");
}

function calltimer() {
    timenow = Date.now()
    t= setInterval(addtime,33);
}

function stoptimer() {
    clearTimeout(t);
    console.log(msec);
    start.disabled = false;
}

function cleartimer() {
    time.textContent= "00 : 00.0";
    sec=0;min=0;
}