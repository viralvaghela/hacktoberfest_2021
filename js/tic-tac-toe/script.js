// dom element for the game
const gameButtons = document.querySelectorAll(".button");
const gameSection = document.querySelector(".game");
const gameOverSection = document.querySelector(".game-over");
const restartButton = document.querySelector(".restart");
const gameWinner = document.querySelector(".winner");
let gameModeButtons = document.querySelectorAll(".neuButton");
let gameModeSection = document.querySelector(".game-mode");
// variables for the game
let winCombs =  [
	[0, 1, 2],
	[3, 4, 5],
	[6, 7, 8],
	[0, 3, 6],
	[1, 4, 7],
	[2, 5, 8],
	[0, 4, 8],
	[6, 4, 2]
];
let gameMoves = gameMode = gameBoard = 0;
let gameState = true;
// funtions for the game 
//setting the changes in the game console variable
const setGameConsole = (address , type) =>{
    gameBoard[address]= type;
    if (type == "o")document.querySelector(`#column${address}`).style.color = "white";
    document.querySelector(`#column${address}`).innerHTML = type;
    document.querySelector(`#column${address}`).removeEventListener("click",setUserOption);
    gameMoves++;
    checkGameOver(gameBoard,type)?gameOver(type):gameMoves >= 9 ?gameOver("tie"):null;
}
//getting the computer moves
const getComputerOption = () =>{
    let mode = {
        easy:{
            fun:getEasyOption
        },
        medium:{
            fun:getMediumOption,
            gameConsole:gameBoard
        },
        hard:{
            fun:getImpossibleOption,
            gameConsole:gameBoard,
            player:"o"
        }
    };
    let optionLevel = mode[gameMode];
    let option = optionLevel.fun(optionLevel.gameConsole,optionLevel.player);
    // console.log(option)
    if (gameState)setGameConsole(option.index,"o");

}
//for setting user changes to the front-end and back-end
const setUserOption = (e) =>{
    // console.log(e);
    let item = e.target;
    let userSelection = item.id;
    userSelection = Number(userSelection[userSelection.length - 1]);
    setGameConsole(userSelection,"x");
    getComputerOption()
}
//set the gameover changes
const gameOver = (winner) =>{
    gameState = false;
    if (winner == "o"){
        // console.log(gameBoard);
        gameWinner.innerHTML = "lose";
        gameWinner.style.color = "red";
    }else if (winner == "tie"){
        gameWinner.innerHTML = "tie";
        gameWinner.style.color = "blue";
    }
    let empty = emptySpot();
    empty.forEach((button) =>{
        document.querySelector(`#column${button}`).removeEventListener("click",setUserOption);
    })
    gameSection.style.opacity = .4;
    gameOverSection.style.display = "flex";
}
//to check wheather is over or not
const checkGameOver = (board,type) => {
    let plays = board.reduce((a, e, i) =>
        (e === type) ? a.concat(i) : a, []);
    for (let [index, win] of winCombs.entries()) {
        if (win.every(elem => plays.indexOf(elem) > -1)) {
            return true;
        }
    }
    return false;
}
//To find the empty spots in gameBoard
const emptySpot =() =>{
    return gameBoard.filter(s => typeof s == 'number');
}
//easy level bot
const getEasyOption = ()=>{
    let emptySpace = emptySpot();
    let option = Math.floor(Math.random()*emptySpace.length-1);
    return {index:emptySpace[option]}

}
//medium level bot
const getMediumOption = (gameConsole) =>{
    let emptySpace = emptySpot();
    let spots = [];
    for (let i = 0 ; i <emptySpace.length; ++i){
        let spotContent = gameConsole[emptySpace[i]];
        let move = {};
        move.index = gameConsole[emptySpace[i]];
        gameConsole[emptySpace[i]] = "o";
        if (checkGameOver(gameConsole,"o")){
            move.score = 10;
        }
        gameConsole[emptySpace[i]] = "x";
        if (!move.score && checkGameOver(gameConsole,"x")){
            move.score = -10;
        }
        gameConsole[emptySpace[i]] = spotContent;
        if (!move.score){
            move.score = -20;
        }
        spots.push(move);
    }
    // console.log(spots)
    let bestScore = bestMove =-30;
    for (let j = 0; j < spots.length; ++j){
        if (spots[j].score >bestScore){
            bestScore = spots[j].score;
            bestMove = j;
        }
    }
    // console.log(spots[bestMove])
    return spots[bestMove];

}
//unbeatable bot
const getImpossibleOption = (gameGround,player) =>{
    let liveEmptySpot = emptySpot();
    if(checkGameOver(gameGround,"o")){
        return {score : 20};
    }else if(checkGameOver(gameGround,"x")){
        return {score : -20};
    }if(liveEmptySpot.length === 0){
        return {score : 0};
    }
    let moves = [];
    for (let i = 0 ; i < liveEmptySpot.length; ++i){
        let move = {};
        move.index = gameGround[liveEmptySpot[i]];
        gameGround[liveEmptySpot[i]] = player;
        if (player == "o"){
            let result = getImpossibleOption(gameGround,"x");
            move.score = result.score;
        }else{
            let result = getImpossibleOption(gameGround,"o");
            move.score = result.score;
        }
        gameGround[liveEmptySpot[i]] = move.index;
        moves.push(move);
    }
    let bestMove ;
    if (player == "o"){
        let bestScore = -1000;
        for (let i =0 ; i < moves.length ; ++i ){
            if (moves[i].score > bestScore){
                bestScore = moves[i].score;
                bestMove = i;
            }
        }
    }else{
        let bestScore = 1000;
        for (let i =0 ; i < moves.length ; ++i){
            if (moves[i].score < bestScore){
                bestScore = moves[i].score;
                bestMove = i;
            }
        }
    }
    return moves[bestMove];
}
const resetConsole = () =>{
    gameMoves = 0;
    gameModeSection.style.display = "flex";
    gameOverSection.style.display = "none";
    gameState = true;

}
//for initializing the game
const setGame = (e) =>{
    let eventStyle = e.target.style;
    eventStyle.transform = "scale(90)";
    setTimeout(() => {
        gameModeSection.style.display = "none";
        eventStyle.transform = "scale(1)";
    },200);
    gameMode = e.target.innerHTML;
    gameBoard = Array.from(Array(9).keys());
    gameButtons.forEach((button) =>{
        button.innerHTML = "";
        button.addEventListener("click" ,setUserOption);
    })
    gameSection.style.opacity = 1;
}
const gameStarter =(event) =>{
    document.querySelector(".startContent").style.letterSpacing = "1.5rem";
    // document.querySelector(".startContent").style.letterSpacing = "2rem";
    setTimeout(()=>{
        gameModeSection.style.display = "flex";
        event.target.style.display = "none";
    },300)
    
}
//adding event listner for each button
gameButtons.forEach((button) =>{
    button.addEventListener("click" , setUserOption )
})
//adding click event for the restart button
restartButton.addEventListener("click",()=>{resetConsole()})
//mode selection button event listener
gameModeButtons.forEach((button) =>{
    button.addEventListener("click",setGame);
})


