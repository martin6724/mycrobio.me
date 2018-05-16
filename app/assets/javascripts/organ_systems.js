
$(document).on('turbolinks:load', function () {

//
$('html, body').css({
      overflow: 'auto',
      height: 'auto'
  });

// Initialize API
var human = new HumanAPI("embedded-human");

// male 3d model
$("#nasopharynx").on("click", function(e) {
  e.preventDefault();
  human.send("camera.set", { objectId: "human_05_male_respiratory_system-pharynx_ID", animate: true });
});

$("#respiratory").on("click", function(e) {
  e.preventDefault();
  human.send("camera.set", { objectId: "human_05_male_respiratory_system-respiratory_system_ID", animate: true });
});

$("#stomach").on("click", function(e) {
  e.preventDefault();
  human.send("camera.set", { objectId: "human_05_male_digestive_system-stomach_ID", animate: true });
});

$("#smallintestine").on("click", function(e) {
  e.preventDefault();
  human.send("camera.set", { objectId: "human_05_male_digestive_system-small_intestines_ID", animate: true });
});

$("#largeintestine").on("click", function(e) {
  e.preventDefault();
  human.send("camera.set", { objectId: "human_05_male_digestive_system-colon_ID", animate: true });
});

$("#urinary").on("click", function(e) {
  e.preventDefault();
  human.send("camera.set", { objectId: "human_05_male_digestive_system-colon_ID", animate: true });
});

$("#urinary").on("click", function(e) {
  e.preventDefault();
  human.send("camera.set", { objectId: "human_05_male_digestive_system-colon_ID", animate: true });
});

$("#urinary").on("click", function(e) {
  e.preventDefault();
  human.send("camera.set", { objectId: "human_05_male_digestive_system-colon_ID", animate: true });
})




// female 3d model
var female = new HumanAPI("embedded-human");

$("#fnasopharynx").on("click", function(e) {
  e.preventDefault();
  female.send("camera.set", { objectId: "human_05_female_respiratory_system-pharynx_ID", animate: true });
});

$("#frespiratory").on("click", function(e) {
  e.preventDefault();
  female.send("camera.set", { objectId: "human_05_female_respiratory_system-respiratory_system_ID", animate: true });
});

$("#fstomach").on("click", function(e) {
  e.preventDefault();
  female.send("camera.set", { objectId: "human_05_female_digestive_system-stomach_ID", animate: true });
});

$("#fsmallintestine").on("click", function(e) {
  e.preventDefault();
  female.send("camera.set", { objectId: "human_05_female_digestive_system-small_intestines_ID", animate: true });
});

$("#flargeintestine").on("click", function(e) {
  e.preventDefault();
  female.send("camera.set", { objectId: "human_05_female_digestive_system-colon_ID", animate: true });
});

$("#furinary").on("click", function(e) {
  e.preventDefault();
  female.send("camera.set", { objectId: "human_05_female_urinary_system-urinary_system_ID", animate: true });
});

$("#fgenitalia").on("click", function(e) {
  e.preventDefault();
  female.send("camera.set", { objectId: "human_05_female_reproductive_system-reproductive_system_ID", animate: true });
});



})
