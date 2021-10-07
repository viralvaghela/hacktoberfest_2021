const details = {
    api:"a945078cafe3fda0f32b29589ecfc2e0",
    baseurl:"https://api.openweathermap.org/data/2.5/weather"
}
const searchbox=document.getElementById('search')
searchbox.addEventListener("keypress",(event)=>{
        if(event.keyCode==13){
        console.log(searchbox.value);
        getweatherreport(searchbox.value);
        }

    
})

function getweatherreport(city){
    fetch(`${details.baseurl}?q=${city}&appid=${details.api}&units=metric`)
    .then(weather=>{
        return weather.json();
    }).then(showreport);
}

function showreport(weather){
    console.log(weather);
    let city=document.getElementById('city')
    let temp=document.getElementById('temp')
    let range=document.getElementById('min-max')
    let type=document.getElementById('type')

    city.innerText=`${weather.name},${weather.sys.country}`;
    temp.innerHTML=`${Math.round(weather.main.temp)}&deg;C`;
    range.innerHTML=`${Math.floor(weather.main.temp_min)}&deg;C (min)/${Math.ceil(weather.main.temp_max)}&deg;C (max)`
    type.innerHTML=`${weather.weather[0].main}`

    
    
}

