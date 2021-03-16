import "bootstrap";
import "jquery";

var timerInterval = [];
var count = 0;

// Convert time to a format of hours, minutes, seconds, and milliseconds

function timeToString(time) {
  let diffInHrs = time / 3600000;
  let hh = Math.floor(diffInHrs);

  let diffInMin = (diffInHrs - hh) * 60;
  let mm = Math.floor(diffInMin);

  let diffInSec = (diffInMin - mm) * 60;
  let ss = Math.floor(diffInSec);

  let formattedHH = hh.toString().padStart(2, "0");
  let formattedMM = mm.toString().padStart(2, "0");
  let formattedSS = ss.toString().padStart(2, "0");

  return `${formattedHH}:${formattedMM}:${formattedSS}`;
}

function getMS(time) {
  return time.getTime() - new Date("01/01/1970 ").getTime();
}

function getTimerTime(timerId) {
  let time = document.getElementById(timerId).textContent;
  let full_date = "01/01/1970 " + time;

  let timer = new Date(full_date);

  return timer;
}

function start(button) {
  let id = button.getAttribute("target").replace("timer", "");
  startTimer(button.getAttribute("target"));
  showButton("pause", id);
}

function pause(button) {
  let id = button.getAttribute("target").replace("timer", "");
  showButton("start", id);
  clearInterval(timerInterval[id]);
}

function deleteTimer(button) {
  let id = button.getAttribute("target").replace("timer", "");
  clearInterval(timerInterval[id]);
  let container = document.getElementById(`container${id}`);
  container.parentNode.removeChild(container);
}

function startTimer(timerId) {
  let timer = getTimerTime(timerId);
  let diff = getMS(timer);
  let total = new Date().getTime() + new Date(diff).getTime();
  let date = new Date(total);
  let id = timerId.replace("timer", "");

  countdown(date, timerId, id);
}

function createTimer() {
  let timers = document.getElementById("timersContainer");
  let name = document.getElementById("nameTimer").value;
  let time = document.getElementById("timeTimer").valueAsNumber;
  let timer = generateTimer(name, time);
  timers.append(timer);
}

function generateTimer(name, time) {
  let elements = generateTimerElements(name, time);
  let container = document.createElement("div");
  container.id = `container${count}`;
  container.className = "row mt-3";

  elements.forEach((element) => container.appendChild(element));

  count++;

  return container;
}

function generateTimerElements(name, time) {
  return [
    generateTimerName(name),
    generateTimerTime(time),
    generateButton("start"),
    generateButton("pause"),
    generateButton("delete"),
  ];
}

function generateTimerName(timerName) {
  let name = document.createElement("h5");
  name.className = "my-auto mr-5";
  name.innerHTML = timerName;
  return name;
}

function generateTimerTime(timerTime) {
  let time = document.createElement("p");
  time.className = "my-auto mr-2";
  time.id = `timer${count}`;
  time.setAttribute("time", `${timeToString(timerTime)}`);
  time.innerHTML = `${timeToString(timerTime)}`;
  return time;
}

function generateButton(btnType) {
  let btn = document.createElement("button");
  btn.type = "button";
  btn.setAttribute("target", `timer${count}`);

  if (btnType == "start") {
    btn.id = `btnStart${count}`;
    btn.innerHTML = "Start";
    btn.className = "btn btn-primary mr-1";
    btn.addEventListener("click", function () {
      start(this);
    });
  } else if (btnType == "pause") {
    btn.id = `btnPause${count}`;
    btn.innerHTML = "Pause";
    btn.className = "btn btn-success mr-1 d-none";
    btn.addEventListener("click", function () {
      pause(this);
    });
  } else {
    btn.id = `btnDelete${count}`;
    btn.innerHTML = "Delete";
    btn.className = "btn btn-danger mr-1";
    btn.addEventListener("click", function () {
      deleteTimer(this);
    });
  }
  return btn;
}

function showToastAlarm(idTimer) {
  setToast(idTimer);
  $("#liveToast").toast("show");
}

function setToast(idTimer) {
  let toastHeader = document.getElementById("toastHeader");
  let toastBody = document.getElementById("toastBody");
  let timer = document.getElementById(`timer${idTimer}`);
  toastHeader.innerHTML = "Timer";
  toastBody.innerHTML = `Timer: ${timer.getAttribute("time")}`;
}

const getRemainingTime = (deadline) => {
  let now = new Date(),
    remainTime = (new Date(deadline) - now + 1000) / 1000,
    remainSeconds = ("0" + Math.floor(remainTime % 60)).slice(-2),
    remainMinutes = ("0" + Math.floor((remainTime / 60) % 60)).slice(-2),
    remainHours = ("0" + Math.floor((remainTime / 3600) % 24)).slice(-2);

  return {
    remainSeconds,
    remainMinutes,
    remainHours,
    remainTime,
  };
};

const countdown = (deadline, elem, id) => {
  const el = document.getElementById(elem);

  timerInterval[id] = setInterval(() => {
    let t = getRemainingTime(deadline);
    el.innerHTML = `${t.remainHours}:${t.remainMinutes}:${t.remainSeconds}`;

    if (t.remainTime <= 1) {
      clearInterval(timerInterval[id]);
      showButton("Delete", id);
      showToastAlarm(id);
    }
  }, 1000);
};

function showButton(buttonKey, id) {
  let playButton = document.getElementById(`btnStart${id}`);
  let pauseButton = document.getElementById(`btnPause${id}`);

  if (buttonKey === "start") {
    playButton.classList.remove("d-none");
    pauseButton.classList.remove("d-block");
    pauseButton.classList.add("d-none");
  } else if (buttonKey === "pause") {
    pauseButton.classList.toggle("d-none");
    playButton.classList.toggle("d-none");
  } else {
    pauseButton.classList.remove("d-block");
    pauseButton.classList.add("d-none");
  }
}

let btnCreate = document.getElementById("btnCreate");

btnCreate.addEventListener("click", createTimer);
