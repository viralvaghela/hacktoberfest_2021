addBoxClass = $('.col');
playerOnePowerDOM = $('#power_1');
playerTwoPowerDOM = $('#power_2');
playerOneWeaponDOM = $('#weapon_1');
playerTwoWeaponDOM = $('#weapon_2');
playerOneDamageDOM = $('#damage_1');
playerTwoDamageDOM = $('#damage_2');
playerOneFightButtons = $('#fight_buttons_1');
playerTwoFightButtons = $('#fight_buttons_2');
playerOneAttackButton = $('#attack_1');
playerOneDefendButton = $('#defend_1');
playerTwoAttackButton = $('#attack_2');
playerTwoDefendButton = $('#defend_2');

let playerOne, playerTwo;
let playerOneSrc = 'img/playerOneWin.png';
let playerTwoSrc = 'img/playerTwoWin.png';
let activePlayer, passivePlayer;
let obstacles = [];

// Random numbers for the players position
let randomPositionNumbers = [];

class Player {
  constructor(
    src,
    name,
    power,
    weapon,
    weaponDamage,
    activeBox,
    hoverBox,
    x,
    y,
    positionID
  ) {
    this.src = src;
    this.name = name;
    this.power = power;
    this.weapon = weapon;
    this.weaponDamage = weaponDamage;
    this.currentWeapon = '';
    this.oldWeapon = '';
    this.activeBox = activeBox;
    this.hoverBox = hoverBox;
    this.position = {
      x: x,
      y: y
    };
    this.positionID = positionID;
    this.isDefending = false;
  }

  getCurrentPosition() {
    return $('.' + this.activeBox).index('.col');
  }

  resetPlayerData() {
    this.currentWeapon = '';
    this.power = 100;
    this.weaponDamage = 10;
  }
}

function newNumber() {
  return Math.floor(Math.random() * rows);
}

let numberGenerator = function(arr) {
  if (arr.length > 3) return;

  if (arr.indexOf(newNumber()) < 0) {
    arr.push(newNumber());
  }
  numberGenerator(arr);
};

function createPlayers() {
  numberGenerator(randomPositionNumbers);

  // Players position
  playerOneX = randomPositionNumbers[0];
  playerOneY = randomPositionNumbers[1];
  playerTwoX = randomPositionNumbers[2];
  playerTwoY = randomPositionNumbers[3];

  playerOnePosition = `#${playerOneX}_${playerOneY}`;
  playerTwoPosition = `#${playerTwoX}_${playerTwoY}`;

  // Instantiate player one object
  playerOne = new Player(
    playerOneSrc,
    'Maverick',
    100,
    'laser',
    10,
    'playerOneActive',
    'playerOneAllowed',
    playerOneX,
    playerOneY,
    playerOnePosition
  );

  // Instantiate player two object
  playerTwo = new Player(
    playerTwoSrc,
    'Viper',
    100,
    'laser',
    10,
    'playerTwoActive',
    'playerTwoAllowed',
    playerTwoX,
    playerTwoY,
    playerTwoPosition
  );
}

let boxes = document.getElementsByClassName('box');

function playAgain() {
  offClick();
  $('#playAgainBtn').on('click', function() {
    $board.off('click');
    $('#winner').css('display', 'none');
    $('#winnerContainer').remove();
    $('.row').remove();
    randomPositionNumbers = [];
    drawBoard();
    createPlayers();
    init();
    allowedtoMove();
    adjacent();
    disableMove();
  });
}

function init() {
  // Reset the player data
  playerOne.resetPlayerData();
  playerTwo.resetPlayerData();

  cantMove = [];

  $('div').removeClass(
    'playerOneAllowed playerTwoAllowed canMove adjacent playerOneActive playerTwoActive playerTurn pipe antenna metal barrel'
  );

  playerOnePowerDOM.text(playerOne.power);
  playerTwoPowerDOM.text(playerTwo.power);
  playerOneWeaponDOM.text(playerOne.weapon);
  playerTwoWeaponDOM.text(playerTwo.weapon);
  playerOneDamageDOM.text(playerOne.weaponDamage);
  playerTwoDamageDOM.text(playerTwo.weaponDamage);

  // Set the active player
  activePlayer = playerOne;
  passivePlayer = playerTwo;

  // Set the current player position
  currentRow = playerOneY;
  currentColumn = playerOneX;

  $('div', '#board').addClass('vacant');

  $('#board').css('display', 'block');
  $('#player_1_Img').css('display', 'block');
  $('#player_2_Img').css('display', 'block');
  $('#versus').css('display', 'none');
  $('#player_1_fight').css('display', 'none');
  $('#player_2_fight').css('display', 'none');

  // Show player one image on the board
  $(playerOnePosition)
    .addClass('playerOneActive playerTurn')
    .removeClass('box');

  // Show player two image on the board
  $(playerTwoPosition)
    .addClass('playerTwoActive')
    .removeClass('box');

  obstaclesAndWeapons(10, weapons);
}

(function($, window, document) {
  $(function() {
    drawBoard();
    createPlayers();
    init();
    allowedtoMove();
    adjacent();
    disableMove();
  });
})(window.jQuery, window, document);
