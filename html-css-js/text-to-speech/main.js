// Initialising the speech API
const synth = window.speechSynthesis;

// Element initialization section
const form = document.querySelector("form");
const textarea = document.getElementById("maintext");
const voice_select = document.getElementById("voice-select");
const rate = document.getElementById("rate");
const pitch = document.getElementById("pitch");
const rateval = document.getElementById("rate-value");
const pitchval = document.getElementById("pitch-value");

// Retrieving the different voices and putting them as
// options in our speech selection section
let voices = [];
const getVoice = () => {
  // This method retrieves voices and is asynchronously loaded
  voices = synth.getVoices();
  var option_string = "";
  voices.forEach((value) => {
    var option = value.name + " (" + value.lang + ") ";
    var newOption =
      "<option data-name='" +
      value.name +
      "' data-lang='" +
      value.lang +
      "'>" +
      option +
      "</option>\n";
    option_string += newOption;
  });

  voice_select.innerHTML = option_string;
};

// Since synth.getVoices() is loaded asynchronously, this
// event gets fired when the return object of that
// function has changed
synth.onvoiceschanged = function () {
  getVoice();
};

const speak = () => {
  // If the speech mode is on we dont want to load
  // another speech
  if (synth.speaking) {
    alert("Already speaking....");
    return;
  }

  // If the text area is not empty that is if the input
  // is not empty
  if (textarea.value !== "") {
    // Creating an object of SpeechSynthesisUtterance with
    // the input value that represents a speech request
    const speakText = new SpeechSynthesisUtterance(textarea.value);

    // When the speaking is ended this method is fired
    speakText.onend = (e) => {
      console.log("Speaking is done!");
    };

    // When any error occurs this method is fired
    speakText.error = (e) => {
      console.error("Error occured...");
    };

    // Selecting the voice for the speech from the selection DOM
    const id = voice_select.selectedIndex;
    const selectedVoice =
      voice_select.selectedOptions[0].getAttribute("data-name");

    // Checking which voices has been chosen from the selection
    // and setting the voice to the chosen voice
    voices.forEach((voice) => {
      if (voice.name === selectedVoice) {
        speakText.voice = voice;
      }
    });

    // Setting the rate and pitch of the voice
    speakText.rate = rate.value;
    speakText.pitch = pitch.value;

    // Finally calling the speech function that enables speech
    synth.speak(speakText);
  }
};

// This function updates the rate and pitch value to the
// value to display
rate.addEventListener(
  "change",
  (evt) => (rateval.innerHTML = Number.parseFloat(rate.value) * 10 + "")
);

pitch.addEventListener(
  "change",
  (evt) => (pitchval.innerHTML = Number.parseFloat(pitch.value) * 10 + "")
);

// This is the section when we assign the speak button, the
// speech function
form.addEventListener("submit", (evt) => {
  evt.preventDefault();
  speak();
  textarea.blur();
});
