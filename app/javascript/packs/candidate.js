alert("hiii")
$(function(){
  $(document).on("submit", "#newForm", function(){
    alert("olmksdlkfmed")
    var name = $("#candidate_name").val();
    var email = $("#candidate_email").val();
    var passout_year = $("#candidate_passout_year").val();
    var phone_number = $("#candidate_phone_number").val();
    var avatar = $("#candidate_avatar").val();
    var resume = $("#candidate_Resume").val();
    alert(typeof avatar)

    var nameVal = /^[A-Za-zÀ-ÿ ,.'-]+$/
    var emailVal = /^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/
    var passoutyearVAl = /^[12][0-9]{3}$/
    var phonenumberVAl = /[6789][0-9]{9}/
    
    alert(resumeVal)
    alert(avatarVal)


    if (name == ""){
      $("#name").html("Name Must Be Present ");
      return false;
    }else if( !(nameVal.test(name))){
      $("#name").html("Name not valid ");
      return false;
    }

    if (email == ""){
      $("#email").html("Email Must Be Present");
      return false;
    }else if(!(emailVal.test(email))){
      $("#email").html("Email not valid");
      return false;
    }

    if(passout_year == ""){
      $("#passoutyear").html("Year Must Be Present");
      return false;
    }else if(!(passoutyearVAl.test(passout_year))){
      $("#passoutyear").html("Year must be valid");
      return false;
    }

    if(phone_number == ""){
      $("#phoneno.").html("Phone Number must be Present");
      return false;
    }else if(!(phonenumberVAl.test(phone_number))){
      $("#phoneno.").html("Phone Number must be valid");
      return false;
    }


    const resumepattern = ["pdf", "docx"]
    if (resume == ""){
      $("#resume").html("Profile Picture must be valid");
      return false;
    }else if(resumepattern.includes(resumeVal)){
      $("#resume").html("Resume format not valid");      
      return false;
    }

    const imgpattern = ["jpeg", "jpg", "png"];
    if (avatar == ""){
      $("#avatar").html("image must be present");
    }else if(!(imgpattern.includes(avatarVal))){
      $("#avatar").html("image format must be valid");
    }
    

  });

});