const p1btn = document.querySelector('.p1');
const p2btn = document.querySelector('.p2');
const resetbtn = document.querySelector('.reset')
const p1display = document.querySelector('#p1Display');
const p2display = document.querySelector('#p2Display');
const select = document.querySelector('#dropdown');

let p1score = 0;
let p2score = 0;
let winscore = 5;

let isgameover = false;

select.addEventListener('change',function(){
    winscore = parseInt(this.value);
    reset();
})

p2btn.addEventListener("click", function (){
    if(!isgameover){
        p2score +=1;
        if(p2score === winscore){
            isgameover=true;
            p2display.classList.add("winner")
            p1display.classList.add('loser')
            p1btn.disabled = true
            p2btn.disabled = true
        }
        p2display.textContent = p2score
    }
})

p1btn.addEventListener("click", function (){
    if(!isgameover){
        p1score +=1;
        if(p1score === winscore){
            isgameover=true;
            p1display.classList.add("winner")
            p2display.classList.add('loser')
            p1btn.disabled = true
            p2btn.disabled = true
        }
        p1display.textContent = p1score
    }
})

resetbtn.addEventListener('click', reset )

function reset(){
    isgameover = false
    p1score = 0;
    p2score = 0;
    p1display.textContent = p1score
    p2display.textContent = p2score
    p1display.classList.remove('winner','loser')
    p2display.classList.remove('winner','loser')
    p1btn.disabled = false
    p2btn.disabled = false
}
