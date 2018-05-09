// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
var human = new HumanAPI("myWidget");
var objectID = [];
var objectName= [];


function create_list_view (mode) {

 var table = document.getElementById("list");
 table.innerHTML = "";

 if (mode != null && mode == 'object_id'){
   //Create display list of object ids
   for(var i = 0; i<objectID.length; i++){
     var row = table.insertRow(i);
     var cell = row.insertCell(0);
     cell.innerHTML = objectID[i];
   }
 }
 else{
   //Create display list of object names
   for(var i = 0; i<objectName.length; i++){
     var row = table.insertRow(i);
     var cell = row.insertCell(0);
     cell.innerHTML = objectName[i];
   }
 }

 //On object click, fly to object and highlight
 if (table != null) {
   for (var i = 0; i < table.rows.length; i++) {
     table.rows[i].cells[0].onclick = function () {
       var index = this.parentNode.rowIndex;
       var objID = objectID[index];
       //fly to object
       human.send("camera.set", { objectId: objID, animate: true });
       //highlight object
       var selectObjects = { replace: true };
       selectObjects[objID] = true;
       human.send("scene.selectObjects", selectObjects);
     };
   }
 }

}

// update list view
var list_view_filter =  document.getElementById("list_view_filter");
if (list_view_filter != null) {
 list_view_filter.onchange = function () {
   create_list_view(this.value);
       };
}

human.on("human.ready", function() {
 human.send("scene.info", function (data) {
   var sceneObjects = data.objects;
   //get list of object names and IDs
   for (var objectId in sceneObjects) {
     var object = sceneObjects[objectId];
     var id = object.objectId;
     var name = object.name;
     objectID.push(id);
     objectName.push(name);
   }
    create_list_view();

 });
});
