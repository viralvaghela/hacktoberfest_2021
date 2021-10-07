setInterval(() => {
    d = new Date();
    hr = d.getHours();
    mn = d.getMinutes();
    sc = d.getSeconds();
    hrr = 30*hr + mn/2; 
    mnr= mn*6;
    scr= sc*6;

    hour.style.transform = `rotate(${hrr}deg)`;
    min.style.transform = `rotate(${mnr}deg)`;
    sec.style.transform = `rotate(${scr}deg)`;



    
}, 1000);