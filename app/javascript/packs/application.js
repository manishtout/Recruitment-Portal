// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import $, { css } from 'jquery'
import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
require("jquery")
require("packs/candidate")

Rails.start()
Turbolinks.start()
ActiveStorage.start()


$(document).ready(function(){
  $("#search").keyup(function(){              // submit form on change serach field
    var value = $("#search").val();
    $.ajax({
    url:'/candidates',
    type:'GET',
    dataType:'script',
    data: {"search":value}
    });
  });
  
  $("#search_field").change(function(){       // submit form on change dropdown
    var form = $("#search").val();
    var drop_down = $('#search_field').val();
    $.ajax({
      url: '/candidates',
      type: 'GET',
      dataType: 'script',
      data: {"search": form ,'search_field' :drop_down }
    });
  });
  var r = $("#newForm").val()

});