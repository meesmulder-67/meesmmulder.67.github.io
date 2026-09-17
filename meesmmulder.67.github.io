<!DOCTYPE html>
<html lang="nl">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Blackjack Royale — Demo</title>

<style>
:root{
  --gold:#f4c95d;
  --felt:#075b45;
  --felt2:#0b795c;
  --dark:#07130f;
}

*{box-sizing:border-box}

body{
  margin:0;
  font-family:Arial, sans-serif;
  background:#050a08;
  color:white;
  overflow:hidden;
}

button{
  font:inherit;
}

.hidden{
  display:none!important;
}

/* =========================
   BEGIN SCHERM
========================= */

#home{
  height:100vh;
  display:grid;
  place-items:center;
  position:relative;
  background:
    radial-gradient(circle at 50% 45%,#163c31 0,#07120e 45%,#020403 100%);
}

.home-card{
  position:relative;
  text-align:center;
  width:min(720px,92vw);
  padding:50px 30px;
}

.logo{
  font-size:clamp(58px,10vw,110px);
  font-weight:1000;
  letter-spacing:-5px;
  text-shadow:0 5px 30px #000;
}

.logo span{
  color:var(--gold);
}

.tag{
  color:#c9d5d1;
  letter-spacing:4px;
  text-transform:uppercase;
  font-size:12px;
  margin:5px 0 28px;
}

.play{
  border:1px solid #ffe9a0;
  background:linear-gradient(180deg,#ffe68a,#d9a92f);
  color:#1c1605;
  font-weight:900;
  border-radius:14px;
  padding:16px 70px;
  font-size:20px;
  cursor:pointer;
  box-shadow:0 12px 40px rgba(244,201,93,.2);
  transition:.2s;
}

.play:hover{
  transform:translateY(-2px);
}

.multiplayer-home{
  margin-top:12px;
  background:#14251f;
  color:#fff;
  border:1px solid #34574b;
  border-radius:10px;
  padding:11px 28px;
  cursor:pointer;
}

.how{
  margin:20px auto 0;
  color:#9caea8;
  font-size:11px;
  line-height:1.55;
  max-width:500px;
}

/* =========================
   GAME
========================= */

#game{
  height:100vh;
  background:linear-gradient(#06100d,#020604);
  position:relative;
}

.topbar{
  height:66px;
  display:flex;
  align-items:center;
  justify-content:space-between;
  padding:0 20px;
  background:rgba(5,12,9,.9);
  border-bottom:1px solid rgba(255,255,255,.06);
  position:relative;
  z-index:5;
}

.brand{
  font-weight:950;
  letter-spacing:1px;
}

.brand b{
  color:var(--gold);
}

.bank{
  display:flex;
  gap:12px;
  align-items:center;
}

.fake-balance{
  background:#101e19;
  border:1px solid #28433a;
  padding:8px 13px;
  border-radius:10px;
  color:#e9f0ed;
  font-weight:800;
}

.topbtn{
  background:#14251f;
  color:#dbe5e1;
  border:1px solid #2b473d;
  border-radius:9px;
  padding:8px 12px;
  cursor:pointer;
}

.table-area{
  height:calc(100vh - 66px);
  display:grid;
  place-items:center;
  padding:18px;
}

.table{
  width:min(1180px,96vw);
  height:min(720px,calc(100vh - 100px));
  min-height:570px;
  border-radius:50% 50% 22px 22px/30% 30% 18% 18%;
  background:
    radial-gradient(
      ellipse at 50% 42%,
      rgba(255,255,255,.07),
      transparent 52%
    ),
    linear-gradient(135deg,#07513f,#087054 48%,#064b3a);
  border:14px solid #20180d;
  box-shadow:
    inset 0 0 0 2px #80621d,
    inset 0 0 70px #012c20,
    0 25px 80px #000;
  position:relative;
  overflow:hidden;
}

.table:after{
  content:"";
  position:absolute;
  inset:18px;
  border:1px solid rgba(244,201,93,.25);
  border-radius:50% 50% 20px 20px/30% 30% 15% 15%;
  pointer-events:none;
}

.rules{
  position:absolute;
  top:38px;
  left:50%;
  transform:translateX(-50%);
  font-size:10px;
  color:#b9d2c8;
  letter-spacing:2px;
  text-transform:uppercase;
  text-align:center;
}

.dealer{
  position:absolute;
  top:82px;
  left:50%;
  transform:translateX(-50%);
  text-align:center;
  z-index:2;
}

.label{
  font-size:11px;
  color:#b8c9c3;
  text-transform:uppercase;
  letter-spacing:2px;
  margin-bottom:8px;
}

.cards{
  display:flex;
  justify-content:center;
  min-height:92px;
}

.card{
  width:60px;
  height:86px;
  background:#faf8f1;
  color:#101515;
  border-radius:7px;
  margin-left:-8px;
  border:1px solid #d8d3c7;
  box-shadow:0 6px 14px #001b12;
  font-weight:950;
  display:flex;
  flex-direction:column;
  justify-content:space-between;
  padding:6px;
  font-size:18px;
  text-align:left;
}

.card:first-child{
  margin-left:0;
}

.card.red{
  color:#c53030;
}

.card .suit{
  font-size:25px;
  text-align:center;
  align-self:center;
}

.card .bottom{
  transform:rotate(180deg);
  align-self:flex-end;
}

.card.back{
  background:
    repeating-linear-gradient(
      45deg,
      #172b67 0 5px,
      #d6dff9 5px 7px
    );
  color:transparent;
  border:3px solid #f6f3e9;
}

.player{
  position:absolute;
  bottom:105px;
  left:50%;
  transform:translateX(-50%);
  text-align:center;
  z-index:2;
  width:100%;
}

.hand-wrap{
  display:flex;
  justify-content:center;
  gap:25px;
}

.hand{
  min-width:180px;
}

.hand.active{
  filter:drop-shadow(0 0 12px rgba(244,201,93,.55));
}

.hand-title{
  font-size:10px;
  color:#b8c9c3;
  margin-bottom:6px;
  text-transform:uppercase;
  letter-spacing:1.5px;
}

.total{
  font-size:12px;
  font-weight:900;
  margin-top:5px;
  color:#e9f0ed;
}

.message{
  position:absolute;
  top:50%;
  left:50%;
  transform:translate(-50%,-50%);
  z-index:4;
  padding:10px 18px;
  border-radius:999px;
  background:rgba(4,13,10,.82);
  border:1px solid rgba(244,201,93,.3);
  font-weight:900;
  font-size:15px;
  box-shadow:0 8px 30px #0008;
  white-space:nowrap;
}

.controls{
  position:absolute;
  bottom:14px;
  left:50%;
  transform:translateX(-50%);
  z-index:4;
  display:flex;
  gap:7px;
  align-items:center;
  justify-content:center;
  flex-wrap:wrap;
  width:94%;
}

.action{
  border:1px solid #34574b;
  background:#10251e;
  color:#fff;
  border-radius:10px;
  padding:10px 17px;
  font-weight:850;
  cursor:pointer;
  min-width:80px;
  box-shadow:0 4px 12px #0005;
}

.action:hover:not(:disabled){
  background:#18392e;
  transform:translateY(-1px);
}

.action.gold{
  background:linear-gradient(180deg,#ffe58a,#c99628);
  color:#211805;
  border-color:#ffeca6;
}

.action.red{
  background:#542322;
  border-color:#87403d;
}

.action:disabled{
  opacity:.35;
  cursor:not-allowed;
}

.chips{
  position:absolute;
  bottom:63px;
  left:50%;
  transform:translateX(-50%);
  display:flex;
  gap:8px;
  z-index:4;
}

.chip{
  width:45px;
  height:45px;
  border-radius:50%;
  border:4px dashed #fff;
  box-shadow:0 4px 10px #0008;
  cursor:pointer;
  font-size:11px;
  font-weight:1000;
  color:#fff;
  transition:.15s;
}

.chip:hover{
  transform:translateY(-4px) scale(1.05);
}

.c5{background:#dc4a4a}
.c10{background:#3c76d8}
.c25{background:#35a45d}
.c50{background:#8c51c4}
.c100{background:#20262a}
.c500{background:#d08b28}

.bet-info{
  position:absolute;
  bottom:55px;
  left:22px;
  z-index:4;
  font-size:11px;
  color:#aec0ba;
  line-height:1.5;
}

.bet-info b{
  color:#fff;
}

.shoe{
  position:absolute;
  right:22px;
  bottom:55px;
  z-index:4;
  color:#aec0ba;
  font-size:10px;
  text-align:right;
}

/* =========================
   MODAL
========================= */

.modal{
  position:fixed;
  inset:0;
  background:#000b;
  display:grid;
  place-items:center;
  z-index:20;
}

.modal-box{
  width:min(520px,90vw);
  background:#0d1c17;
  border:1px solid #355248;
  border-radius:18px;
  padding:25px;
  box-shadow:0 25px 80px #000;
}

.modal-box h2{
  margin:0 0 8px;
}

.modal-box p{
  color:#b7c8c2;
  font-size:13px;
  line-height:1.6;
}

.close{
  float:right;
  background:none;
  border:0;
  color:#9eb0aa;
  font-size:22px;
  cursor:pointer;
}

.code{
  display:flex;
  gap:8px;
  margin-top:16px;
}

.code input{
  flex:1;
  background:#07110d;
  border:1px solid #345247;
  color:#fff;
  border-radius:9px;
  padding:12px;
}

@media(max-height:680px){
  .table{
    min-height:500px;
  }

  .dealer{
    top:55px;
  }

  .player{
    bottom:90px;
  }

  .chips{
    bottom:50px;
  }

  .bet-info,
  .shoe{
    display:none;
  }
}
</style>
</head>

<body>

<!-- =========================
     BEGIN SCHERM
========================= -->

<section id="home">

  <div class="home-card">

    <div class="logo">
      BLACK<span>JACK</span>
    </div>

    <div class="tag">
      ROYAL TABLE • PLAY MONEY ONLY
    </div>

    <button class="play" id="playBtn">
      PLAY
    </button>

    <!-- SAMENSPELEN STAAT HIER OP HET BEGINSCHERM -->
    <div>
      <button class="multiplayer-home" id="homeMultiBtn">
        👥 Samenspelen
      </button>
    </div>

    <div class="how">

      <b>Hoe werkt blackjack?</b>

      Probeer dichter bij 21 te komen dan de dealer,
      zonder boven 21 uit te komen.

      Kies <b>Hit</b> voor een kaart,
      <b>Stand</b> om te stoppen en
      <b>Double</b> om je inzet te verdubbelen
      en precies één kaart te krijgen.

      Bij twee gelijke kaarten kun je
      <b>Split</b> kiezen.

      Alles op deze pagina gebruikt uitsluitend nepchips.

    </div>

  </div>

</section>


<!-- =========================
     GAME
========================= -->

<section id="game" class="hidden">

  <header class="topbar">

    <div class="brand">
      BLACK<b>JACK</b> ROYALE
    </div>

    <div class="bank">

      <!-- GEEN SAMENSPELEN BUTTON HIER -->

      <div class="fake-balance">
        🪙 <span id="balance">1000</span> credits
      </div>

      <button class="topbtn" id="rulesBtn">
        Regels
      </button>

    </div>

  </header>


  <main class="table-area">

    <div class="table">

      <div class="rules">
        Dealer must stand on 17 • Blackjack pays 3:2 • Play money
      </div>


      <!-- DEALER -->

      <div class="dealer">

        <div class="label">
          Dealer <span id="dealerTotal"></span>
        </div>

        <div class="cards" id="dealerCards"></div>

      </div>


      <!-- BELANGRIJK:
           HIER STAAT "KIES JE INZET"
           EN NIET "KIES JE NEP-INZET"
      -->

      <div class="message" id="message">
        Kies je inzet
      </div>


      <!-- PLAYER -->

      <div class="player">

        <div class="hand-wrap" id="playerHands"></div>

      </div>


      <div class="bet-info">
        INZET:
        <b>🪙 <span id="bet">0</span></b>
        <br>
        FAKE CREDITS ONLY
      </div>


      <div class="shoe">
        DEMO SHOE
        <br>
        <span id="cardsLeft">52</span> kaarten
      </div>


      <!-- CHIPS -->

      <div class="chips">

        <button class="chip c5" data-value="5">
          5
        </button>

        <button class="chip c10" data-value="10">
          10
        </button>

        <button class="chip c25" data-value="25">
          25
        </button>

        <button class="chip c50" data-value="50">
          50
        </button>

        <button class="chip c100" data-value="100">
          100
        </button>

        <button class="chip c500" data-value="500">
          500
        </button>

      </div>


      <!-- CONTROLS -->

      <div class="controls">

        <button class="action" id="clearBtn">
          Clear
        </button>

        <button class="action gold" id="dealBtn">
          Deal
        </button>

        <button class="action" id="hitBtn" disabled>
          Hit
        </button>

        <button class="action" id="standBtn" disabled>
          Stand
        </button>

        <button class="action" id="doubleBtn" disabled>
          Double
        </button>

        <button class="action" id="splitBtn" disabled>
          Split
        </button>

        <button class="action red" id="newBtn">
          Nieuwe ronde
        </button>

      </div>

    </div>

  </main>

</section>


<!-- =========================
     MODAL
========================= -->

<div class="modal hidden" id="modal">

  <div class="modal-box">

    <button class="close" id="closeModal">
      ×
    </button>

    <h2 id="modalTitle">
      Blackjack regels
    </h2>

    <p id="modalText">

      Je start met 1000 gratis demo-credits.

      Blackjack is een kaartspel waarin je normaal
      gesproken tegen de dealer speelt.

      Aas telt als 1 of 11,
      plaatjes als 10 en de overige kaarten
      als hun waarde.

      Boven 21 is bust.

      De dealer krijgt één open en één gesloten kaart
      en moet bij 16 of lager een kaart nemen
      en bij 17 of hoger blijven.

      Blackjack is een aas + kaart van waarde 10
      met je eerste twee kaarten.

      In deze demo krijgt blackjack 3:2.

      Bij twee kaarten van dezelfde waarde kun je
      splitten; elke hand krijgt daarna een extra kaart.

      Bij double wordt de inzet verdubbeld
      en krijg je nog precies één kaart.

      Er is geen echt geld en er kan niets worden
      gestort of opgenomen.

    </p>


    <div class="code hidden" id="codeBox">

      <input
        id="roomCode"
        value="BJ-DEMO-2026"
        readonly
      >

      <button class="action gold" id="copyCode">
        Kopieer
      </button>

    </div>

  </div>

</div>


<script>

/* =========================
   BASIS
========================= */

const $ = selector =>
  document.querySelector(selector);

const home = $('#home');
const game = $('#game');

let balance = 1000;
let bet = 0;

let deck = [];
let dealer = [];
let hands = [];

let active = 0;
let roundOver = true;


/* =========================
   DECK
========================= */

const suits = [
  '♠',
  '♥',
  '♦',
  '♣'
];

const ranks = [

  ['A',11],
  ['2',2],
  ['3',3],
  ['4',4],
  ['5',5],
  ['6',6],
  ['7',7],
  ['8',8],
  ['9',9],
  ['10',10],
  ['J',10],
  ['Q',10],
  ['K',10]

];


function buildDeck(){

  deck = [];

  for(let s of suits){

    for(let r of ranks){

      deck.push({

        rank:r[0],
        value:r[1],
        suit:s

      });

    }

  }


  /* shuffle */

  for(
    let i = deck.length - 1;
    i > 0;
    i--
  ){

    let j =
      Math.floor(
        Math.random() * (i + 1)
      );

    [
      deck[i],
      deck[j]
    ] =
    [
      deck[j],
      deck[i]
    ];

  }

}


function draw(){

  if(!deck.length){

    buildDeck();

  }

  return deck.pop();

}


/* =========================
   HAND VALUE
========================= */

function handValue(hand){

  let total =
    hand.reduce(
      (sum,card) =>
        sum + card.value,
      0
    );

  let aces =
    hand.filter(
      card => card.rank === 'A'
    ).length;


  while(
    total > 21 &&
    aces--
  ){

    total -= 10;

  }

  return total;

}


function blackjack(hand){

  return(
    hand.length === 2 &&
    handValue(hand) === 21
  );

}


/* =========================
   KAART HTML
========================= */

function cardHTML(card,back=false){

  if(back){

    return `
      <div class="card back">
        ?
      </div>
    `;

  }


  let red =
    card.suit === '♥' ||
    card.suit === '♦'
      ? ' red'
      : '';


  return `

    <div class="card${red}">

      <span>
        ${card.rank}
      </span>

      <span class="suit">
        ${card.suit}
      </span>

      <span class="bottom">
        ${card.rank}
      </span>

    </div>

  `;

}


/* =========================
   RENDER
========================= */

function render(){

  $('#balance').textContent =
    balance;

  $('#bet').textContent =
    bet;


  $('#dealerCards').innerHTML =
    dealer
      .map(
        (card,index) =>
          cardHTML(
            card,
            !roundOver &&
            index === 1
          )
      )
      .join('');


  $('#dealerTotal').textContent =
    dealer.length
      ? (
          roundOver
            ? handValue(dealer)
            : handValue([dealer[0]]) + ' + ?'
        )
      : '';


  $('#playerHands').innerHTML =
    hands
      .map(
        (hand,index) => `

          <div class="hand ${
            index === active &&
            !roundOver
              ? 'active'
              : ''
          }">

            <div class="hand-title">

              Hand ${index + 1}

              ${
                hand.bet
                  ? ` • 🪙 ${hand.bet}`
                  : ''
              }

            </div>

            <div class="cards">

              ${
                hand.cards
                  .map(cardHTML)
                  .join('')
              }

            </div>

            <div class="total">

              ${handValue(hand.cards)}

              ${
                handValue(hand.cards) > 21
                  ? ' • BUST'
                  : ''
              }

            </div>

          </div>

        `
      )
      .join('');


  const inPlay =
    !roundOver &&
    hands.length &&
    active < hands.length;


  $('#hitBtn').disabled =
    !inPlay;


  $('#standBtn').disabled =
    !inPlay;


  $('#doubleBtn').disabled =
    !inPlay ||
    hands[active].cards.length !== 2 ||
    balance < hands[active].bet;


  $('#splitBtn').disabled =
    !inPlay ||
    hands[active].cards.length !== 2 ||
    hands[active].cards[0].value !==
      hands[active].cards[1].value ||
    balance < hands[active].bet;


  $('#dealBtn').disabled =
    !roundOver ||
    bet <= 0 ||
    bet > balance;


  $('#clearBtn').disabled =
    !roundOver ||
    bet === 0;


  $('#cardsLeft').textContent =
    deck.length;

}


/* =========================
   MESSAGE
========================= */

function msg(text){

  $('#message').textContent =
    text;

}


/* =========================
   START ROUND
========================= */

function startRound(){

  if(
    bet <= 0 ||
    bet > balance
  ){
    return;
  }


  balance -= bet;

  roundOver = false;

  active = 0;


  dealer = [
    draw(),
    draw()
  ];


  hands = [

    {
      cards:[
        draw(),
        draw()
      ],

      bet:bet,

      done:false,

      doubled:false
    }

  ];


  if(
    blackjack(hands[0])
  ){

    finishRound(true);

    return;

  }


  msg(
    'Jouw beurt — Hit, Stand, Double of Split'
  );


  render();

}


/* =========================
   FINISH ROUND
========================= */

function finishRound(){

  roundOver = true;


  while(
    handValue(dealer) < 17
  ){

    dealer.push(
      draw()
    );

  }


  const dealerValue =
    handValue(dealer);

  const dealerBJ =
    blackjack(dealer);


  let results = [];


  hands.forEach(hand => {

    const playerValue =
      handValue(hand.cards);


    if(
      playerValue > 21
    ){

      results.push('bust');

      return;

    }


    if(
      dealerBJ &&
      !blackjack(hand.cards)
    ){

      results.push('lose');

      return;

    }


    if(
      blackjack(hand.cards) &&
      !dealerBJ
    ){

      balance +=
        Math.floor(
          hand.bet * 2.5
        );

      results.push('blackjack');

      return;

    }


    if(
      dealerValue > 21 ||
      playerValue > dealerValue
    ){

      balance +=
        hand.bet * 2;

      results.push('win');

    }

    else if(
      playerValue === dealerValue
    ){

      balance +=
        hand.bet;

      results.push('push');

    }

    else{

      results.push('lose');

    }

  });


  let text =
    'Dealer wint.';


  if(
    results.includes('blackjack')
  ){

    text =
      'BLACKJACK! 🥳';

  }

  else if(
    results.includes('win')
  ){

    text =
      'Je wint! 🔥';

  }

  else if(
    results.includes('push')
  ){

    text =
      'Push — gelijkspel.';

  }


  msg(text);

  render();

}


/* =========================
   NEXT HAND
========================= */

function nextHand(){

  active++;


  if(
    active >= hands.length
  ){

    finishRound();

  }

  else{

    msg(
      `Hand ${active + 1}: jouw beurt`
    );

    render();

  }

}


/* =========================
   HIT
========================= */

function hit(){

  let hand =
    hands[active];


  hand.cards.push(
    draw()
  );


  if(
    handValue(hand.cards) > 21
  ){

    hand.done = true;

    msg(
      `Hand ${active + 1} is bust 😵`
    );


    setTimeout(
      nextHand,
      650
    );

  }

  else{

    msg(
      'Nog een kaart of Stand?'
    );

    render();

  }

}


/* =========================
   STAND
========================= */

function stand(){

  hands[active].done = true;

  nextHand();

}


/* =========================
   DOUBLE
========================= */

function double(){

  let hand =
    hands[active];


  if(
    balance < hand.bet ||
    hand.cards.length !== 2
  ){

    return;

  }


  balance -=
    hand.bet;


  hand.bet *= 2;


  hand.cards.push(
    draw()
  );


  hand.doubled = true;


  if(
    handValue(hand.cards) > 21
  ){

    msg(
      'Double — bust 😵'
    );

    setTimeout(
      nextHand,
      650
    );

  }

  else{

    msg(
      'Double — precies één kaart.'
    );

    setTimeout(
      nextHand,
      500
    );

  }


  render();

}


/* =========================
   SPLIT
========================= */

function split(){

  let hand =
    hands[active];


  if(
    balance < hand.bet
  ){

    return;

  }


  balance -=
    hand.bet;


  const firstCard =
    hand.cards[0];

  const secondCard =
    hand.cards[1];


  hands.splice(

    active,

    1,

    {
      cards:[
        firstCard,
        draw()
      ],

      bet:hand.bet,

      done:false
    },

    {
      cards:[
        secondCard,
        draw()
      ],

      bet:hand.bet,

      done:false
    }

  );


  msg(
    'Gesplitst! Speel eerst Hand 1.'
  );


  render();

}


/* =========================
   NIEUWE RONDE
========================= */

function newRound(){

  bet = 0;

  hands = [];

  dealer = [];

  active = 0;

  roundOver = true;


  msg(
    'Kies je inzet'
  );


  render();

}


/* =========================
   CHIPS
========================= */

document
  .querySelectorAll('.chip')
  .forEach(button => {

    button.onclick = () => {

      if(!roundOver){
        return;
      }


      let value =
        Number(
          button.dataset.value
        );


      if(
        bet + value <= balance
      ){

        bet += value;

      }


      render();

    };

  });


/* =========================
   CLEAR
========================= */

$('#clearBtn').onclick = () => {

  if(roundOver){

    balance += bet;

    bet = 0;

    render();

  }

};


/* =========================
   BUTTONS
========================= */

$('#dealBtn').onclick =
  startRound;

$('#hitBtn').onclick =
  hit;

$('#standBtn').onclick =
  stand;

$('#doubleBtn').onclick =
  double;

$('#splitBtn').onclick =
  split;

$('#newBtn').onclick =
  newRound;


/* =========================
   PLAY
========================= */

$('#playBtn').onclick = () => {

  home.classList.add(
    'hidden'
  );

  game.classList.remove(
    'hidden'
  );

  buildDeck();

  render();

};


/* =========================
   REGELS
========================= */

$('#rulesBtn').onclick = () => {

  $('#modalTitle').textContent =
    'Blackjack regels';


  $('#modalText').classList.remove(
    'hidden'
  );


  $('#codeBox').classList.add(
    'hidden'
  );


  $('#modal').classList.remove(
    'hidden'
  );

};


/* =========================
   SAMENSPELEN
   ALLEEN OP BEGINSCHERM
========================= */

$('#homeMultiBtn').onclick = () => {

  $('#modalTitle').textContent =
    'Samenspelen';


  $('#modalText').innerHTML = `

    Dit is een lokale demo.

    Gebruik de kamer-ID om dezelfde
    demo-opzet met iemand te delen.

    Er is geen online inzet, account
    of echt geld gekoppeld aan deze pagina.

  `;


  $('#codeBox').classList.remove(
    'hidden'
  );


  $('#modal').classList.remove(
    'hidden'
  );

};


/* =========================
   MODAL SLUITEN
========================= */

$('#closeModal').onclick = () => {

  $('#modal').classList.add(
    'hidden'
  );

};


/* =========================
   KAMERCODE KOPIËREN
========================= */

$('#copyCode').onclick =
  async () => {

    await navigator.clipboard?.writeText(
      $('#roomCode').value
    );


    $('#copyCode').textContent =
      'Gekopieerd ✓';


    setTimeout(
      () =>
        $('#copyCode').textContent =
          'Kopieer',
      1000
    );

  };


/* =========================
   START
========================= */

newRound();

</script>

</body>
</html>