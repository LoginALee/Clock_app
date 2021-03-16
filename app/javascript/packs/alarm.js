var alarmSound = new Audio();
alarmSound.src = "http://localhost:3000/assets/alarm.mp3"

const BASE_URL = "http://localhost:3000/"
var options = {
  method: 'GET',
  headers: {
    'Content-Type': 'application/json'
  },
}
var alarmTimer;

window.onload = function setup() {
  getalarms();
}

async function getalarms() {
  const url = BASE_URL + "alarms.json";
  const response = await fetch(url, options);
  const data = await response.json();
  evaluateAlarms(data);
}

function evaluateAlarms(alarms) {
  alarms.forEach(evaluateAlarm);
}

function evaluateAlarm(alarm) {
  var today = new Date();
  let dayToday = getDayName(today);

  if (alarm.days.includes(dayToday)) {
    setAlarm(alarm)
  }
}

function setAlarm(alarm_data) {
  var date = new Date(alarm_data.time); // some mock date
  var milliseconds = date.getTime();

  var alarm = new Date(milliseconds);
  var alarmTime = new Date(alarm.getFullYear(), alarm.getMonth(), alarm.getDate(), alarm.getHours(), alarm.getMinutes(), alarm.getSeconds());

  var differenceInMs = alarmTime.getTime() - (new Date()).getTime();

  console.log(differenceInMs);

  if (differenceInMs > 0) {
    alarmTimer = setTimeout(() => { showToastAlarm(alarm_data.time) }, differenceInMs);
  }
}

function setToast(time) {
  let toastBody = document.getElementById('toastBody');
  let snooze = document.getElementById('toastSnooze');
  toastBody.innerHTML = time;
  snooze.setAttribute('alarm-time', time);
  snooze.addEventListener('click', snooze_alarm);
}

function showToastAlarm(time) {
  setToast(time);
  $('#liveToast').toast('show');
  //alarmSound.play();
}

function getDayName(today) {
  return today.toLocaleDateString('en-us', { weekday: 'long' });
}

function snooze_alarm() {
  $('#liveToast').toast('hide');
  let time = document.getElementById('toastSnooze').getAttribute("alarm-time");
  alarmTimer = setTimeout(() => { showToastAlarm(time) }, 60000); // 5 * 60 * 1000 = 5 Minutes
};