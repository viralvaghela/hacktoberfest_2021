/*
    Description: Contains code for memory game
    Version: 0.2
    Author: Parwinder Bhagat
 */

//Added shuffle method to Array
Array.prototype.shuffle = function() {
    for (var i = this.length - 1; i > 0; i--) {
        var j = Math.floor(Math.random() * (i + 1));
        var temp = this[i];
        this[i] = this[j];
        this[j] = temp;
    }
    return this;
}

//Declaring initial array
var cardsArray = ['JS', 'PHP', 'Mongo', 'Ember', 'Grunt', 'Gulp', 'HTML', 'CSS', 'Basic', 'C++', 'VIM', 'Unix'],
    cardsFlipped = 0,
    cardId = [],
    cardValue = [],
    totalClicks = 0,
    app = new Object(),
    gameBoard = document.querySelector('#game-board');

//Duplicating and concatinating the array declared
cardsArray = cardsArray.concat(cardsArray);

app.init = function() {
    var domElement = ''
    cardsArray.shuffle();
    for (let i = 0; i < cardsArray.length; i++) {
        domElement += '<div class="card" onclick="app.flipCard(this, ' + i + ')" id="card-' + i + '"></div>'
    }
    gameBoard.innerHTML = domElement;
}

app.completeGame = function() {
    gameBoard.innerHTML = '<p>You have finished the game. <a onclick="app.init()">Click here to start a new game</a></p><p>You used '+ totalClicks +' clicks (lower is better!)';
    cardsFlipped = 0;
    cardId = [];
    cardValue = [];
}

app.takeAction = function(index, value) {
    cardId.push(index);
    cardValue.push(value);
    if (cardValue.length === 2) {
        if (cardValue[0] === cardValue[1]) {
            cardsFlipped += 2;
            cardId = [];
            cardValue = [];
        }
    }
    if (cardsFlipped === cardsArray.length) {
        app.completeGame();
    }
}

//Handles flipping of card on the board
app.flipCard = function(element, index) {
    totalClicks += 1;
    var currentValue = cardsArray[index];
    if (element.innerHTML === '' && cardValue.length < 2) {
        element.style.background = '#FFF';
        element.innerHTML = currentValue;
        app.takeAction(index, currentValue);
    } else {
        for (let i = 0; i < 2; i++) {
            var resetElement = document.querySelector('#card-' + cardId[i]);
            resetElement.style.background = '#FF383F';
            resetElement.innerHTML = '';
        }
        cardId = [];
        cardValue = [];
    }
}

app.init();
