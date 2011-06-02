/* DO NOT MODIFY. This file was compiled Thu, 02 Jun 2011 21:49:29 GMT from
 * /home/dorian/Programmierung/Foermchen3/app/coffeescripts/test.coffee
 */

(function() {
  $(function() {
    $("#slider_interest2").slider({
      value: 100,
      min: 0,
      max: 500,
      step: 50,
      slide: function(event, ui) {
        return $("#interest_calculator_interest2").val("$" + ui.value);
      }
    });
    return $("#interest_calculator_interest2").val("$" + $("#slider_interest2").slider("value"));
  });
}).call(this);
