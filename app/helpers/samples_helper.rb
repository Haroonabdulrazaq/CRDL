module SamplesHelper
  def sample_params
    params.require(:sample).permit(:name, :Address, :institution, :phone_num, :email, :supervisor_name,
                                   :supervisor_contact, :referrer, :current_status, :required_service,
                                   :description, :perishable, :retention_time, :result_due_date)
  end

  def display_create_result_button(sample)
    display = ''
    if can? :manage, Result
      display = "#{link_to 'Add new Result', new_sample_result_path(sample), class: 'button is-dark is-fullwidth  is-small is-outlined'}"
    end
    display.html_safe
  end

  def display_sample_control_buttons(sample)
    display = ''
    if can? :manage, Sample
      display = "
          #{link_to 'Edit this sample', edit_sample_path(sample), class: 'button is-link is-outlined is-fullwidth my-4 is-small'}
          #{link_to 'Read all Prices', sample_prices_path(sample), class: 'button is-link is-outlined is-fullwidth my-4 is-small'}
          #{link_to 'Delete this sample', sample_path, class: 'button is-danger is-outlined is-fullwidth my-4 is-small', method: :delete,
                                          data: { confirm: 'Are you sure you want to delete this sample?' }}
      "
    end
    display.html_safe
  end

  def display_price_form departments, lab_tests, form, old_lab_tests = nil
    display = ''
    tmp = ''
    tmp_lab = ''
    curr_lab_tests_to_display = []
    unless departments.size.zero?
      departments.each do |dpt|
        curr_lab_tests_to_display = lab_tests.select { |lab| lab.department_for_test_id == dpt.id }
        curr_lab_tests_to_display.each do |lab|
          tmp_lab << "
          <div class='panel-block is-size-6 columns is-full accordion-body'>
            <div class='column is-1'>
              <input onclick='
                var mySelection = localStorage.getItem(\"mySelection\") ? JSON.parse(localStorage.getItem(\"mySelection\")) : [];
                function SelectionObject(id, title, quantity, unitPrice) {
                  this.title = title;
                  this.quantity = quantity;
                  this.unitPrice = unitPrice;
                  this.id = id;
                }
                function updateLocalStorage(){
                  localStorage.setItem(\"mySelection\", JSON.stringify(mySelection));
                }
                function updateTextarea(){
                  var textareaToUpdate = document.querySelector(\"#textarea-for-labtests\");
                  var mySelection = localStorage.getItem(\"mySelection\") ? JSON.parse(localStorage.getItem(\"mySelection\")) : [];
                  textareaToUpdate.value = JSON.stringify(mySelection);
                };
                function addnewSelectionToStorage(selectedItem){
                  mySelection.push(selectedItem);
                  updateLocalStorage();
                  updateTextarea();
                };
                function removeSelectionFromStorage(itemToRemove){
                  mySelection = mySelection.filter(function(currVal, index, arr){
                      return currVal.id!==itemToRemove.id; 
                    });
                  updateLocalStorage();
                  updateTextarea();
                }
                function clicked(event){
                  var clickedCheckbox = event.target;
                  var selectItem = new SelectionObject(#{lab.id},\"#{lab.title}\", #{lab.quantity}, #{lab.price_per_unit});
                  if(clickedCheckbox.checked){
                    addnewSelectionToStorage(selectItem);
                  }else{
                    removeSelectionFromStorage(selectItem);
                  }
                }; clicked(event);' type='checkbox' value='#{lab.title}' name='#{lab.title}' id='#{lab.id}' />
              </div>
            <div class='column is-6'>#{lab.title}</div>
            <div class='column is-2'>
              <input oninput='
                function updateTextarea(){
                  var textareaToUpdate = document.querySelector(\"#textarea-for-labtests\");
                  var mySelection = localStorage.getItem(\"mySelection\") ? JSON.parse(localStorage.getItem(\"mySelection\")) : [];
                  textareaToUpdate.value = JSON.stringify(mySelection);
                };
                function updateSelectedItem(newQuantity){
                  var mySelection = localStorage.getItem(\"mySelection\") ? JSON.parse(localStorage.getItem(\"mySelection\")) : [];
                  if(mySelection.length!==0){
                    mySelection.forEach(function(currItem){
                      if(currItem.id===#{lab.id}){
                        currItem.quantity = newQuantity;
                        localStorage.setItem(\"mySelection\", JSON.stringify(mySelection));
                        updateTextarea();
                      }
                    });
                  }else{
                    alert(\"There is no selection, please select the lab test you want to save!\");
                  }
                };
                function inputChanged(event){
                  updateSelectedItem(event.target.value);
                }; inputChanged(event);' type='number' id='#{lab.id}' value='#{lab.quantity}' class='input is-small' />
            </div>
            <div class='column is-3'>#{lab.price_per_unit} / 1 unit</div>
          </div>
          "
        end
        tmp << "
        <li class='panel is-full accordion'>
          <h1 class='panel-heading is-primary accordion-header'>#{dpt.title}</h1>
          #{tmp_lab}
        </li>"
        tmp_lab = ''
      end
    end
    display = "
    #{form.hidden_field :lab_tests, size: '30x4' ,class: 'textarea', id: 'textarea-for-labtests'}
    <ul class='is-full accordions'>
      #{tmp}
    </ul>
    "
    display.html_safe
  end
end
