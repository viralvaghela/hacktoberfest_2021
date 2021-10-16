const rows = 10;
const cols = 10;
let $board;
let weapons = [];
let cantMove = [];
let playerOneX,
  playerOneY,
  playerTwoX,
  playerTwoY,
  playerOnePosition,
  playerTwoPosition,
  addBoxClass,
  playerOnePowerDOM,
  playerTwoPowerDOM,
  playerOneWeaponDOM,
  playerTwoWeaponDOM,
  playerOneDamageDOM,
  playerTwoDamageDOM,
  playerOneFightButtons,
  playerTwoFightButtons,
  playerOneAttackButton,
  playerOneDefendButton,
  playerTwoAttackButton,
  playerTwoDefendButton;

class Grid {
  constructor(selector, rows, cols) {
    this.rows = rows;
    this.cols = cols;
    this.selector = selector;
    this.createGrid();
    this.setupEventListeners();
  }

  createGrid() {
    $board = $(this.selector);
    for (let row = 0; row < this.rows; row++) {
      const $row = $('<div>').addClass('row');
      for (let col = 0; col < this.cols; col++) {
        const $col = $('<div>')
          .addClass('col box vacant')
          .attr('data-col', col)
          .attr('data-row', row)
          .attr('id', col + '_' + row);
        $row.append($col);
      }
      $board.append($row);
    }
  }

  // Event listener for the board
  setupEventListeners() {
    const $board = $(this.selector);

    $board.on('mouseenter', '.col.vacant', function() {
      $(this).addClass('onHover');
      if ($(this).hasClass('canMove')) {
        $(this).addClass(activePlayer.hoverBox);
      }
      $(this).off('mouseenter');
    });

    $board.on('mouseleave', '.col.vacant', function() {
      $(this).removeClass('onHover');
      if ($(this).hasClass('canMove')) {
        $(this).removeClass(activePlayer.hoverBox);
      }
      $(this).off('mouseleave');
    });

    // Limit the player movement
    $board.on('click', '.canMove', movement);
  }
}

function drawBoard() {
  // Create the grid
  const grid = new Grid('#board', rows, cols);

  // Add box class for each col class
  for (let i = 0; i < addBoxClass.length; i++) {
    addBoxClass[i].addClass('box');
  }
}

class Weapon {
  constructor(name, src, damage, cssClass) {
    this.name = name;
    this.src = src;
    this.damage = damage;
    this.cssClass = cssClass;
    weapons.push(this);
  }
}

// Instantiate four weapons objects
let pipe = new Weapon('Pipe', 'img/w1_pipe.png', 15, 'pipe');
let antenna = new Weapon('Antenna', 'img/w2_antenna.png', 20, 'antenna');
let metal = new Weapon('Metal', 'img/w3_metal.png', 25, 'metal');
let barrel = new Weapon('Barrel', 'img/w4_barrel.png', 30, 'barrel');

// Player movement
function movement() {
  let oldPosition, newPosition;

  oldPosition = activePlayer.getCurrentPosition();
  newPosition = $(this).index('.col');

  // Remove the player active class when the player move to another box
  $(activePlayer.positionID).removeClass(activePlayer.activeBox);

  // Remove the player allowed class when the player move to another box
  $(this).removeClass(activePlayer.hoverBox);

  // Show the player on the new box that was clicked
  $(this).addClass(activePlayer.activeBox);

  // Remove onHover, canMove, and adjacent class when the player switch
  $('div').removeClass('onHover canMove adjacent');

  // Switch active class
  $(activePlayer.positionID).removeClass('playerTurn');
  $(passivePlayer.positionID).addClass('playerTurn');
  activePlayer.position.x = $(this).data('col');
  activePlayer.position.y = $(this).data('row');

  activePlayer.positionID = `#${activePlayer.position.x}_${activePlayer.position.y}`;

  playerOnePosition = `#${playerOne.position.x}_${playerOne.position.y}`;
  playerTwoPosition = `#${playerTwo.position.x}_${playerTwo.position.y}`;

  switchPlayer();

  currentColumn = activePlayer.position.x;
  currentRow = activePlayer.position.y;

  allowedtoMove();
  adjacent();
  disableMove();

  // Check weapon position
  if (newPosition - oldPosition < 4 && newPosition - oldPosition > 0) {
    // Right
    for (i = 1; i <= newPosition - oldPosition; i++) {
      checkWeapons(passivePlayer, oldPosition + i);
    }
  } else if (newPosition - oldPosition < 0 && newPosition - oldPosition > -4) {
    // Left
    for (i = -1; i >= newPosition - oldPosition; i--) {
      checkWeapons(passivePlayer, oldPosition + i);
    }
  } else if (newPosition - oldPosition >= cols) {
    // Down
    for (i = cols; i <= newPosition - oldPosition; i += cols) {
      checkWeapons(passivePlayer, oldPosition + i);
    }
  } else {
    // Up
    for (i = -cols; i >= newPosition - oldPosition; i -= cols) {
      checkWeapons(passivePlayer, oldPosition + i);
    }
  }

  $(`${playerOnePosition}`).removeClass('canMove');
  $(`${playerTwoPosition}`).removeClass('canMove');

  // Fight if the players position are adjacent
  if ($(this).hasClass('adjacent')) {
    switchPlayerForFight();
    fight();
  }
}

// Switch the player
function switchPlayer() {
  if (activePlayer === playerOne) {
    activePlayer = playerTwo;
    passivePlayer = playerOne;
  } else {
    activePlayer = playerOne;
    passivePlayer = playerTwo;
  }
}

// Switch the player for fight
function switchPlayerForFight() {
  if (passivePlayer === playerOne) {
    activePlayer = playerOne;
    passivePlayer = playerTwo;
  } else {
    activePlayer = playerTwo;
    passivePlayer = playerOne;
  }
}

// Add a weapon when the player moved over to a new box with a weapon class
function checkWeapons(player, position) {
  $.each(weapons, function(index, weapon) {
    if ($('.col:eq(' + position + ')').hasClass(weapon.cssClass)) {
      $('.col:eq(' + position + ')')
        .removeClass(weapon.cssClass)
        .removeClass('weapon')
        .css('background', '');

      // If there is a current weapon, it becomes old weapon
      player.oldWeapon = player.currentWeapon;

      // Get the second or the next weapon, leaving old weapon on the box
      if (player.oldWeapon !== '') {
        $('.col:eq(' + position + ')')
          .addClass('weapon')
          .addClass(player.oldWeapon.cssClass);
      }

      // Update the player data to match the new weapon
      if (player === playerOne) {
        playerOne.currentWeapon = weapon;
        playerOne.weaponDamage = weapon.damage;
        playerOneDamageDOM.text(weapon.damage);
        playerOneWeaponDOM.text(playerOne.currentWeapon.name);
      } else {
        playerTwo.currentWeapon = weapon;
        playerTwo.weaponDamage = weapon.damage;
        playerTwoWeaponDOM.text(playerTwo.currentWeapon.name);
        playerTwoDamageDOM.text(weapon.damage);
      }

      return false;
    }
  });
}

// Limit the player movement
function allowedtoMove() {
  /* 
  Limit movement to 3 columns and 3 rows 
  Horizontal and vertical
   */
  let allowedBoxes = [
    $(`#${currentColumn - 1}_${currentRow}`),
    $(`#${currentColumn - 2}_${currentRow}`),
    $(`#${currentColumn - 3}_${currentRow}`),
    $(`#${currentColumn + 1}_${currentRow}`),
    $(`#${currentColumn + 2}_${currentRow}`),
    $(`#${currentColumn + 3}_${currentRow}`),
    $(`#${currentColumn}_${currentRow - 1}`),
    $(`#${currentColumn}_${currentRow - 2}`),
    $(`#${currentColumn}_${currentRow - 3}`),
    $(`#${currentColumn}_${currentRow + 1}`),
    $(`#${currentColumn}_${currentRow + 2}`),
    $(`#${currentColumn}_${currentRow + 3}`)
  ];

  // Check if the player move over a box that contain a weapon
  allowedBoxes.forEach(function(box) {
    if (
      !box.hasClass('obstacles') &&
      !box.hasClass('playerOneActive') &&
      !box.hasClass('playerTwoActive')
    ) {
      box.addClass('canMove');
    }
  });
}

// Get the adjacent position
function adjacent() {
  let adjacentBoxes = [
    $(`#${currentColumn}_${currentRow - 1}`), // top
    $(`#${currentColumn - 1}_${currentRow}`), // left
    $(`#${currentColumn}_${currentRow + 1}`), // bottom
    $(`#${currentColumn + 1}_${currentRow}`) // right
  ];

  adjacentBoxes.forEach(function(box) {
    box.addClass('adjacent');
  });
}

// Disable player movement after an obstacle
function disableMove() {
  if (cantMove.includes(currentColumn + '_' + (currentRow - 1))) {
    $(`#${currentColumn}_${currentRow - 2}`).removeClass('canMove');
    $(`#${currentColumn}_${currentRow - 3}`).removeClass('canMove');
  }

  if (cantMove.includes(currentColumn + '_' + (currentRow - 2))) {
    $(`#${currentColumn}_${currentRow - 3}`).removeClass('canMove');
  }

  if (
    cantMove.includes(currentColumn + '_' + (currentRow - 1)) &&
    cantMove.includes(currentColumn + 1 + '_' + (currentRow - 1))
  ) {
    $(`#${currentColumn}_${currentRow - 2}`).removeClass('canMove');
    $(`#${currentColumn + 1}_${currentRow - 2}`).removeClass('canMove');
    $(`#${currentColumn + 2}_${currentRow - 2}`).removeClass('canMove');
  }

  if (cantMove.includes(currentColumn + 1 + '_' + (currentRow - 1))) {
    $(`#${currentColumn + 2}_${currentRow - 2}`).removeClass('canMove');
  }

  if (
    cantMove.includes(currentColumn + 1 + '_' + (currentRow - 1)) &&
    cantMove.includes(currentColumn + 1 + '_' + currentRow)
  ) {
    $(`#${currentColumn + 2}_${currentRow - 2}`).removeClass('canMove');
    $(`#${currentColumn + 2}_${currentRow}`).removeClass('canMove');
    $(`#${currentColumn + 2}_${currentRow - 1}`).removeClass('canMove');
  }

  if (cantMove.includes(currentColumn + 1 + '_' + currentRow)) {
    $(`#${currentColumn + 2}_${currentRow}`).removeClass('canMove');
    $(`#${currentColumn + 3}_${currentRow}`).removeClass('canMove');
  }

  if (cantMove.includes(currentColumn + 2 + '_' + currentRow)) {
    $(`#${currentColumn + 3}_${currentRow}`).removeClass('canMove');
  }

  if (
    cantMove.includes(currentColumn + 1 + '_' + currentRow) &&
    cantMove.includes(currentColumn + 1 + '_' + (currentRow + 1))
  ) {
    $(`#${currentColumn + 2}_${currentRow}`).removeClass('canMove');
    $(`#${currentColumn + 2}_${currentRow + 2}`).removeClass('canMove');
    $(`#${currentColumn + 2}_${currentRow + 1}`).removeClass('canMove');
  }

  if (cantMove.includes(currentColumn + 1 + '_' + (currentRow + 1))) {
    $(`#${currentColumn + 2}_${currentRow + 2}`).removeClass('canMove');
  }

  if (
    cantMove.includes(currentColumn + '_' + (currentRow + 1)) &&
    cantMove.includes(currentColumn + 1 + '_' + (currentRow + 1))
  ) {
    $(`#${currentColumn + 1}_${currentRow + 2}`).removeClass('canMove');
    $(`#${currentColumn + 2}_${currentRow + 2}`).removeClass('canMove');
    $(`#${currentColumn}_${currentRow + 2}`).removeClass('canMove');
  }

  if (cantMove.includes(currentColumn + '_' + (currentRow + 1))) {
    $(`#${currentColumn}_${currentRow + 2}`).removeClass('canMove');
    $(`#${currentColumn}_${currentRow + 3}`).removeClass('canMove');
  }

  if (cantMove.includes(currentColumn + '_' + (currentRow + 2))) {
    $(`#${currentColumn}_${currentRow + 3}`).removeClass('canMove');
  }

  if (
    cantMove.includes(currentColumn + '_' + (currentRow + 1)) &&
    cantMove.includes(currentColumn - 1 + '_' + (currentRow + 1))
  ) {
    $(`#${currentColumn - 1}_${currentRow + 2}`).removeClass('canMove');
    $(`#${currentColumn}_${currentRow + 2}`).removeClass('canMove');
    $(`#${currentColumn - 2}_${currentRow + 2}`).removeClass('canMove');
  }

  if (cantMove.includes(currentColumn - 1 + '_' + (currentRow + 1))) {
    $(`#${currentColumn - 2}_${currentRow + 2}`).removeClass('canMove');
  }

  if (
    cantMove.includes(currentColumn - 1 + '_' + currentRow) &&
    cantMove.includes(currentColumn - 1 + '_' + (currentRow + 1))
  ) {
    $(`#${currentColumn - 2}_${currentRow}`).removeClass('canMove');
    $(`#${currentColumn - 2}_${currentRow + 1}`).removeClass('canMove');
    $(`#${currentColumn - 2}_${currentRow + 2}`).removeClass('canMove');
  }

  if (cantMove.includes(currentColumn - 1 + '_' + currentRow)) {
    $(`#${currentColumn - 2}_${currentRow}`).removeClass('canMove');
    $(`#${currentColumn - 3}_${currentRow}`).removeClass('canMove');
  }

  if (cantMove.includes(currentColumn - 2 + '_' + currentRow)) {
    $(`#${currentColumn - 3}_${currentRow}`).removeClass('canMove');
  }

  if (
    cantMove.includes(currentColumn - 1 + '_' + currentRow) &&
    cantMove.includes(currentColumn - 1 + '_' + (currentRow + 1))
  ) {
    $(`#${currentColumn - 2}_${currentRow}`).removeClass('canMove');
    $(`#${currentColumn - 2}_${currentRow - 1}`).removeClass('canMove');
    $(`#${currentColumn - 2}_${currentRow - 2}`).removeClass('canMove');
  }

  if (cantMove.includes(currentColumn - 1 + '_' + (currentRow - 1))) {
    $(`#${currentColumn - 2}_${currentRow - 2}`).removeClass('canMove');
  }

  if (
    cantMove.includes(currentColumn + '_' + (currentRow - 1)) &&
    cantMove.includes(currentColumn - 1 + '_' + (currentRow - 1))
  ) {
    $(`#${currentColumn}_${currentRow - 2}`).removeClass('canMove');
    $(`#${currentColumn - 1}_${currentRow - 2}`).removeClass('canMove');
    $(`#${currentColumn - 2}_${currentRow - 2}`).removeClass('canMove');
  }
}

// Add obstacles and weapons
function obstaclesAndWeapons(obstacles, weapons) {
  // Add obstacles
  for (let i = 0; i < obstacles; i++) {
    let generateRandomNumber = Math.floor(Math.random() * boxes.length);

    let addObstacles = boxes[generateRandomNumber];

    addObstacles.classList.add('obstacles');
    addObstacles.classList.remove('box', 'vacant', 'canMove');

    cantMove.push(addObstacles.id);
  }

  let boxesWithoutObstacles = [...boxes];

  // Add weapons
  for (let i = 0; i < weapons.length; i++) {
    let generateRandomNumber = Math.floor(
      Math.random() * boxesWithoutObstacles.length
    );

    let addWeapons = boxesWithoutObstacles[generateRandomNumber];
    addWeapons.classList.add('weapon');
    addWeapons.classList.add(weapons[i].cssClass);

    boxesWithoutObstacles.splice(generateRandomNumber, 1);
  }

  // Show the weapons image on the board
  $('.pipe').css('background-image', `url(${weapons[0].src})`);
  $('.antenna').css('background-image', `url(${weapons[1].src})`);
  $('.metal').css('background-image', `url(${weapons[2].src})`);
  $('.barrel').css('background-image', `url(${weapons[3].src})`);
}

function fight() {
  $('#board').css('display', 'none');
  $('#player_1_Img').css('display', 'none');
  $('#player_2_Img').css('display', 'none');
  $('#versus').css('display', 'block');
  $('#player_1_fight').css('display', 'block');
  $('#player_2_fight').css('display', 'block');

  playerOneAttack();
  playerOneDefend();
  playerTwoAttack();
  playerTwoDefend();
}

// Reduce opponent power when fighting
function reducePower(activePlayer, passivePlayer) {
  if (activePlayer.currentWeapon === '') {
    if (passivePlayer.isDefending === true) {
      passivePlayer.power -= 5;
      passivePlayer.isDefending = false;
    } else {
      passivePlayer.power -= 10;
    }
  } else {
    if (passivePlayer.isDefending === true) {
      passivePlayer.power -= activePlayer.weaponDamage / 2;
      passivePlayer.isDefending = false;
    } else {
      passivePlayer.power -= activePlayer.weaponDamage;
    }
  }
}

function playerOneAttack() {
  if (activePlayer === playerOne) {
    playerOneFightButtons.css('visibility', 'visible');
    playerTwoFightButtons.css('visibility', 'hidden');
    playerOne.isDefending = false;

    function attackPlayerTwo() {
      reducePower(playerOne, playerTwo);
      playerTwoPowerDOM.text(playerTwo.power);

      // Animate the player image when the attack button is click
      $('#playerOneImg').animate({ marginLeft: '-20rem' }, 100, function() {
        $('#playerOneImg').css('margin-left', '0');
      });

      switchToPlayerTwo();
      offClick();
      fight();
    }

    playerOneAttackButton.on('click', attackPlayerTwo);
  }
}

function playerOneDefend() {
  if (activePlayer === playerOne) {
    function oneDefend() {
      playerOne.isDefending = true;
      switchToPlayerTwo();
      offClick();
      fight();
    }
  }
  playerOneDefendButton.on('click', oneDefend);
}

function switchToPlayerTwo() {
  checkWin();
  activePlayer = playerTwo;
  passivePlayer = playerOne;
  playerOneFightButtons.css('visibility', 'hidden');
  playerTwoFightButtons.css('visibility', 'visible');
}

function playerTwoAttack() {
  if (activePlayer === playerTwo) {
    playerTwoFightButtons.css('visibility', 'visible');
    playerOneFightButtons.css('visibility', 'hidden');
    playerTwo.isDefending = false;

    function attackPlayerOne() {
      reducePower(playerTwo, playerOne);
      playerOnePowerDOM.text(playerOne.power);

      // Animate the player image when the attack button click
      $('#playerTwoImg').animate({ marginRight: '-20rem' }, 100, function() {
        $('#playerTwoImg').css('margin-right', '0');
      });

      switchToPlayerOne();
      offClick();
      fight();
    }
    playerTwoAttackButton.on('click', attackPlayerOne);
  }
}

function playerTwoDefend() {
  if (activePlayer === playerTwo) {
    function twoDefend() {
      playerTwo.isDefending = true;
      switchToPlayerOne();
      offClick();
      fight();
    }
  }
  playerTwoDefendButton.on('click', twoDefend);
}

function switchToPlayerOne() {
  checkWin();
  activePlayer = playerOne;
  passivePlayer = playerTwo;
  playerTwoFightButtons.css('visibility', 'hidden');
  playerOneFightButtons.css('visibility', 'visible');
}

// Remove the fight button event listener
function offClick() {
  playerOneAttackButton.off('click');
  playerOneDefendButton.off('click');
  playerTwoAttackButton.off('click');
  playerTwoDefendButton.off('click');
}

function checkWin() {
  if (passivePlayer.power <= 0) {
    function showWinner() {
      // The winner has switched to a passivePlayer
      $('#winner').css('display', 'block');
      $('#winner').append(`<div id=winnerContainer></div>`);

      $('#winnerContainer').append(
        `<h1 id=message>And the winner is:</h1>
        <h2>${passivePlayer.name}</h2>`
      );

      $(
        '<section id=winnerImg><img src =' +
          passivePlayer.src +
          ' width=150px></section>'
      ).appendTo('#winnerContainer');

      $('#winnerContainer').append(
        '<section id=playAgain><button class=btn id=playAgainBtn>Play Again</button></section>'
      );
      playAgain();
    }
    setTimeout(showWinner, 500);
  }
}
