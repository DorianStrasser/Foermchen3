var Step = 0.25
$(function() {
		$( "#slider_interest1" ).slider({
			value:$( "#interest_calculator_interest1" ).val(),
			min: 0,
			max: 20,
            step: Step,
			slide: function( event, ui ) {
				$( "#interest_calculator_interest1" ).val( ui.value );
			}
		});
		$( "#interest_calculator_interest1" ).val( $( "#slider_interest1" ).slider( "value" ) );

        $( "#interest_calculator_interest1" ).keyup(function (){
            $("#slider_interest1").slider("value", $("#interest_calculator_interest1").val());
        });

        $( "#slider_interest2" ).slider({
			value:$( "#interest_calculator_interest2" ).val(),
			min: 0,
			max: 20,
            step: Step,
			slide: function( event, ui ) {
				$( "#interest_calculator_interest2" ).val( ui.value );
			}
		});
		$( "#interest_calculator_interest2" ).val( $( "#slider_interest2" ).slider( "value" ) );

        $( "#interest_calculator_interest2" ).keyup(function (){
            $("#slider_interest2").slider("value", $("#interest_calculator_interest2").val());
        });
	});