document.addEventListener("DOMContentLoaded",sampleEvent, false);
  function sampleEvent() {
    if (document.getElementById("token_submit") != null) {
      Payjp.setPublicKey("pk_test_92efb2054bc7d6e53551b2fb");
      var btn = document.getElementById("token_submit");
      btn.addEventListener("click",function(e) {
        e.preventDefault();
        var card = {
          number: document.getElementById("card_number").value,
          cvc: document.getElementById("cvc").value,
          exp_month: document.getElementById("exp_month").value,
          exp_year: document.getElementById("exp_year").value
        };
        Payjp.createToken(card, function(status, response){
          if (status === 200) {
            $("#card_number").removeAttr("name");
            $("#cvc").removeAttr("name");
            $("#exp_month").removeAttr("name");
            $("#exp_year").removeAttr("name");
            $("#card_token").append(
              $('<input type="hidden" name="payjp-token">').val(response.id)
            );
            document.inputForm.submit();
          }else {
            alert("カード情報が正しくありません。");
          }
        });
      });
    }
  }