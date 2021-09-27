// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import $ from 'jquery'
import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
require("jquery")

Rails.start()
Turbolinks.start()
ActiveStorage.start()


// submit form on change dropdown

$(document).ready(function(){
  $("#search_field").change(function(){
    var form = $("#search").val();
    var drop_down = $('#search_field').val();
    $.ajax({
      url: '/candidates',
      type: 'GET',
      dataType: 'script',
      data: {"search": form ,'search_field' :drop_down }
  });
  
});
});