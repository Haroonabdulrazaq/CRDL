var oldLabTests = document.getElementById("textarea-for-labtests").value;
var checkboxesArr = document.querySelectorAll("input[type='checkbox']");
var oldLabTestsArr = JSON.parse(oldLabTests);

oldLabTestsArr.forEach(function(currTest) {
  checkboxesArr.forEach(function(currCheckbox) {
    if(currCheckbox.id == currTest.id){
      currCheckbox.checked = true
    }
  })
});
