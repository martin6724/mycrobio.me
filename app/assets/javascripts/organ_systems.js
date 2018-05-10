
$(document).on('turbolinks:load', function () {
// Initialize API
var human = new HumanAPI("embedded-human");

$("#nasopharynx").on("click", function() {
  human.send("camera.set", { objectId: "human_05_male_respiratory_system-pharynx_ID", animate: true });
});

$("#respiratory").on("click", function() {
  human.send("camera.set", { objectId: "human_05_male_respiratory_system-respiratory_system_ID", animate: true });
});

$("#stomach").on("click", function() {
  human.send("camera.set", { objectId: "human_05_male_digestive_system-stomach_ID", animate: true });
});

$("#smallintestine").on("click", function() {
  human.send("camera.set", { objectId: "human_05_male_digestive_system-small_intestines_ID", animate: true });
  event.preventDefault();
});

$("#largeintestine").on("click", function() {
  human.send("camera.set", { objectId: "human_05_male_digestive_system-colon_ID", animate: true });
});
})
