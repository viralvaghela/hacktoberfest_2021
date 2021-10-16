let button = document.getElementById('btn');

button.addEventListener('click', function(){
    let char = document.getElementById('str').value;
    let count = char.length;
    let total = document.getElementById('output');
    total.innerHTML = `<h1>Total characters count : ${count}</h1>`
});