//Formatting the number to English standards (i.e. 3500 => 3,500)
function getFormattedNumber(num) {
    return Number(num).toLocaleString("en");
}

//Get the current value in the input field
function getCurrVal() {
    return document.getElementById("result_val").innerText;
}

//Enter numbers from keyboard
document.addEventListener('keypress', (event) => {
    var result = Number(getCurrVal().replace(/,/g, ''));
    if (event.key === '1' || event.key === '2' || event.key === '3' || event.key === '4' || event.key === '5' || event.key === '6' || event.key === '7' || event.key === '8' || event.key === '9' || event.key === '0') {
        result = result + event.key;
        if (result === "") {
            document.getElementById('result_val').innerText = result;
        } else {
            document.getElementById('result_val').innerText = getFormattedNumber(result);
        }
    }
}, false);

//Enter numbers using buttons on the website
const num = document.getElementsByClassName("num");
for (let i = 0; i < num.length; i++) {
    num[i].addEventListener('click', function () {
        var result = Number(getCurrVal().replace(/,/g, ''));
        if (!isNaN(result)) {
            result = result + this.id;
            if (result === "") {
                document.getElementById('result_val').innerText = result;
            } else {
                document.getElementById('result_val').innerText = getFormattedNumber(result);
            }
        }
    });
}

//Enter operators from keyboard
document.addEventListener('keyup', (event) => {
    let res;
    //Clear & remove handle
    if (event.code === "Delete") {
        console.log(event.code);
        document.getElementById('result_val').innerText = "";
        document.getElementById('history_val').innerText = "";
        document.getElementById('result_val').innerText = "";
    } else if (event.code === "Backspace") {
        res = Number(getCurrVal().replace(/,/g, '')).toString();
        if (res) {
            res = res.substr(0, res.length - 1);
            if (res === "") {
                document.getElementById('result_val').innerText = res;
            } else {
                document.getElementById('result_val').innerText = getFormattedNumber(res);
            }
        }
//         //other operators handle
//     } else if (event.code === "Equal" || event.code === "NumpadAdd" || event.code === "NumpadSubtract" || event.code === "NumpadMultiply" || event.code === "NumpadDivide" || event.code === "NumpadEnter" || event.code === "Enter") {
//         res = document.getElementById('result_val').innerText;
//         let hist = document.getElementById("history_val").innerText;
//         if (hist !== "" && res === "") {
//             if (isNaN(hist[hist.length - 1])) {
//                 hist = hist.substr(0, hist.length - 1);
//             }
//         }
//         if (res !== "" || hist !== "") {
//             res = res === "" ? res : Number(res.replace(/,/g, ''));
//             hist = hist + res;
//             if (event.code === "Equal" || event.code === "NumpadEnter" || event.code === "Enter") {
//                 console.log(event.code);
//                 const result = eval(hist);
//                 document.getElementById("result_val").innerText = getFormattedNumber(result);
//                 document.getElementById("history_val").innerText = "";
//             } else {
//                 console.log(event.key, typeof event.key)
//                 hist = hist + event.key;
//                 document.getElementById("history_val").innerText = hist;
//                 document.getElementById("result_val").innerText = "";
//             }
//         }
    }
}, false);

//Handle operators click using buttons on the website
const operators = document.getElementsByClassName("operator");
for (let i = 0; i < operators.length; i++) {
    operators[i].addEventListener('click', function () {
        let res;
        //Clear & remove handle
        if (this.id === "clear") {
            document.getElementById('result_val').innerText = "";
            document.getElementById('result_val').innerText = "";
            document.getElementById('history_val').innerText = "";
            document.getElementById('result_val').innerText = "";
        } else if (this.id === "remove") {
            res = Number(getCurrVal().replace(/,/g, '')).toString();
            if (res) {
                res = res.substr(0, res.length - 1);
                if (res === "") {
                    document.getElementById('result_val').innerText = res;
                } else {
                    document.getElementById('result_val').innerText = getFormattedNumber(res);
                }
            }
            //other operators handle
        } else {
            res = document.getElementById('result_val').innerText;
            let hist = document.getElementById("history_val").innerText;
            if (hist !== "" && res === "") {
                if (isNaN(hist[hist.length - 1])) {
                    hist = hist.substr(0, hist.length - 1);
                }
            }
            if (res !== "" || hist !== "") {
                res = res === "" ? res : Number(res.replace(/,/g, ''));
                hist = hist + res;
                if (this.id === "=") {
                    const result = eval(hist);
                    document.getElementById("result_val").innerText = getFormattedNumber(result);
                    document.getElementById("history_val").innerText = "";
                } else {
                    hist = hist + this.id;
                    console.log(typeof this.id);
                    document.getElementById("history_val").innerText = hist;
                    document.getElementById("result_val").innerText = "";
                }
            }
        }
    });
}