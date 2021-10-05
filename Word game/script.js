var animals=["lion","tiger","panda","fox","elephant","chimpanzee","hippopotamus","buffalo","camel","turtle","cockroach","penguin","butterfly","scorpion","squirrel","goldfish","dolphin","crocodile","gorilla","kangaroo","whale","shark","bear","monkey","snake","donkey","giraffe","anteater"];
var checked=[];
// alert(animals.length);
var lost=false;
var word;

// $("#sample").submit(function(){
//     alert("ready")
//     $(".main").empty();
//     var s= "<div class =\"heading\"><h1>Word game</h1><p>Unscramble the word and find the correct word</p></div><form id=\"game\"><label for=\"\"><span id=\"scrambled\">Word</span><br><br><input type=\"text\" size=\"20\" ></label><button type=\"submit\" id=\"check\">Check</button><span ><br> <br>Score : <span id=\"score\">0</span></span><span id=\"msg\"></span></form>;  ";
//     $(".main").html(s);
//     // repeat();
//     console.log("func called")
// });
repeat();
$("#game").submit(function(event){
    event.preventDefault();
    var inp=$("input").val().toLowerCase();
    // var sc=$("#scrambled").text().toLowerCase();
    // console.log(inp);
// console.log(word);
    // console.log(sc);
    if (inp == word.toLowerCase()){
        var sc= parseInt($("#score").text());
        // console.log("success");
        // console.log(sc)
        // setTimeout(function(){},5000);
        sc+=1
        $("#score").text(sc);
        $("#green").css("background-color","greenyellow");
        $("#msg").text("Great ! you are doing a good job");
        setTimeout(function(){
            $("#green").css("background-color","#bbb");
        },500);
        $("input").val("");
        repeat();
    }
    else
    {
        // alert("error");
        $("#red").css("background-color","red");
        // setTimeout(function(){
        //     $("#green").css("background-color","#bbb");
        // },2000)
        // $("#score").text("0");
        $("input").val("");
        $("#scrambled").text(" It is : "+ word);
        $("#msg").text("Better luck next time !!");
        $("#below").append("<button onClick=\"window.location.reload();\" id=\"reload\">Restart game</button>");
        lost=true;
        // gotostart();
    }
});

// $("#reload").on("click",function(){
//     lost=false;
//     location.reload(true);
//     repeat();
//     // $("#reload").empty()
// })


function generateword(){
    var rd=genratenumber();
    // console.log(rd);
    
     word=animals[rd];
   
    // if(animals.indexOf(word)==-1)
    
        var scrmb = scrambled(word);
    // console.log(scrmb);
    $("#scrambled").text(scrmb);
   
}



function genratenumber(){
    var r= Math.floor(Math.random() * animals.length);
    // if(checked.indexOf(r)!=-1 && checked.length!=0 && checked.length!=animals.length)
    // {
    //     var r= genratenumber(); 
    //     return r;
    // }
    // else if(checked.length === animals.length){
    //     console.log(animals.length,checked.length);
    //     checked=[];
    //     console.log(checked);
        
    // }
    // else{
        while(checked.length != animals.length){

        if(checked.indexOf(r)!=-1)
        {
            r= Math.floor(Math.random() * animals.length);
        }
        else{
            break;
        }
        }
            if(checked.length == animals.length)
            {
                checked=[];
            }
    // else{
    //     checked=[];
    // }
        checked.push(r);
        return r;
    // }
   
}

// $(document).ready(function(){
//     if(!lost){
        
//     }
   
// });

function repeat(){
    if(!lost){
        generateword();
    }
}


function scrambled(word){
    var a = word.split(""),
        n = a.length;

    for(var i = n - 1; i > 0; i--) {
        var j = Math.floor(Math.random() * (i + 1));
        var tmp = a[i];
        a[i] = a[j];
        a[j] = tmp;
    }
    if (a.join("")==word){
        generateword();
    }
    else{
        return a.join("");
    }
    
}



