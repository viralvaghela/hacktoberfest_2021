const form = document.getElementById("form");
const prev = document.getElementById("prev");
const next = document.getElementById("next");
const circles = document.querySelectorAll(".circle");
const formSteps = document.querySelectorAll(".formss");
const submitBtn = document.querySelector(".submit");

let currentActive = 1;

next.addEventListener("click", () => {
    currentActive++;
    
    if (currentActive > circles.length){
        currentActive = circles.length;
    }
    
update();
updateFormSteps();
});

prev.addEventListener("click", () => {
    currentActive--;
    
    if (currentActive< 1){
        currentActive=1;
    }
update();
updateFormSteps();
});

submitBtn.addEventListener("click",()=>{
    formSteps[currentActive - 1].classList.add("active");
    currentActive += 1;
    setTimeout(function(){
      alert("Your Form Successfully Signed up");
      location.reload();
    },400);
    
});

function updateFormSteps() {
    formSteps.forEach((formss) => {
        formss.classList.contains("form-step-active") &&
        formss.classList.remove("form-step-active");
    });
  
    formSteps[currentActive - 1].classList.add("form-step-active");
  }

function update() {
    circles.forEach((circle, idx) => {
        if(idx < currentActive){
            circle.classList.add("active");
        }
        else{
            circle.classList.remove("active");
        }
    });
const actives = document.querySelectorAll(".active");

form.style.width = ((actives.length - 1)/(circles.length - 1)) * 100 + "%";

if (currentActive === 1) {
    prev.disabled = true;
}
else if (currentActive === circles.length){
    next.disabled = true;
}
else{
    prev.disabled = false;
    next.disabled = false;
}
}

