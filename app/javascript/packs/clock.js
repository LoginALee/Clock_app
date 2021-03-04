// Convert time to a format of hours, minutes, seconds, and milliseconds

function timeToString(time) {
  let diffInHrs = time / 3600000;
  let hh = Math.floor(diffInHrs);

  let diffInMin = (diffInHrs - hh) * 60;
  let mm = Math.floor(diffInMin);

  let diffInSec = (diffInMin - mm) * 60;
  let ss = Math.floor(diffInSec);

  let diffInMs = (diffInSec - ss) * 100;
  let ms = Math.floor(diffInMs);

  let formattedMM = mm.toString().padStart(2, "0");
  let formattedSS = ss.toString().padStart(2, "0");
  let formattedMS = ms.toString().padStart(2, "0");

  return `${formattedMM}:${formattedSS}:${formattedMS}`;
}

// Declare variables to use in our functions below

let startTime;
let elapsedTime = 0;
let lastLapTime = 0;
let timerInterval;

// Create function to modify innerHTML

function print(time) {
  document.getElementById("display").innerHTML = time;
  document.getElementById("display-input").value = time;
}

function printLap(time) {
  let lap = `<p>${time}</p`;
  document.getElementById("laps").innerHTML += lap;
  let field = genereteInputLap(time);
  document.getElementById("form-fields").append(field);
}

function clearLaps() {
  document.getElementById("laps").innerHTML = "";
}

function genereteInputLap(value) {
  field = document.createElement("input");
  field.type = "hidden";
  field.name = "stopwatch[laps][]";
  field.value = value
  return field;
}

// Create "start", "pause" and "reset" functions

function start() {
  startTime = Date.now() - elapsedTime;
  timerInterval = setInterval(function printTime() {
    elapsedTime = Date.now() - startTime;
    print(timeToString(elapsedTime));
  }, 10);
  showButton("PAUSE");
}

function pause() {
  clearInterval(timerInterval);
  showButton("PLAY");
}

function reset() {
  clearInterval(timerInterval);
  print("00:00:00");
  elapsedTime = 0;
  lastLapTime = 0;
  clearLaps();
  showButton("PLAY");
  showButton("LAP");
}

function lap() {
  let lapTime = elapsedTime - lastLapTime;
  lastLapTime = elapsedTime;
  printLap(timeToString(lapTime));
}

// Create function to display buttons

function showButton(buttonKey) {
  if (buttonKey === "PLAY") {
    playButton.classList.remove("d-none");
    pauseButton.classList.remove("d-block");
    pauseButton.classList.add("d-none");
  }
  else if (buttonKey === "PAUSE") {
    pauseButton.classList.toggle("d-none");
    playButton.classList.toggle("d-none");
    lapButton.classList.remove("d-none");
    lapButton.classList.add("d-block");
  }
  else {
    lapButton.classList.remove("d-block");
    lapButton.classList.add("d-none");
  }
}
// Create event listeners

let playButton = document.getElementById("playButton");
let pauseButton = document.getElementById("pauseButton");
let resetButton = document.getElementById("resetButton");
let lapButton = document.getElementById("lapButton");

playButton.addEventListener("click", start);
pauseButton.addEventListener("click", pause);
resetButton.addEventListener("click", reset);
lapButton.addEventListener("click", lap);
