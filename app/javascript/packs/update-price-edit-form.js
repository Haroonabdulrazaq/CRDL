var oldLabTests = document.getElementById("textarea-for-labtests").value;
var inputsArr = document.querySelectorAll("input[type='number']");
var checkboxesArr = document.querySelectorAll("input[type='checkbox']");
var oldLabTestsArr = JSON.parse(oldLabTests);

localStorage.setItem("mySelection", JSON.stringify(oldLabTestsArr));

oldLabTestsArr.forEach(function(currTest) {
  checkboxesArr.forEach(function(currCheckbox) {
    if(currCheckbox.id == currTest.id){
      currCheckbox.checked = true
    };
  });

  inputsArr.forEach(function(currInput) {
    if(currInput.id == currTest.id) {
      currInput.value = currTest.quantity;
    }
  })
});
