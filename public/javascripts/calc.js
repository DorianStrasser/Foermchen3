$(function() {
		$( "#slider_interest1" ).slider({
			value:100,
			min: 0,
			max: 500,
			step: 50,
			slide: function( event, ui ) {
				$( "#interest_calculator_interest1" ).val( "$" + ui.value );
			}
		});
		$( "#interest_calculator_interest1" ).val( "$" + $( "#slider_interest1" ).slider( "value" ) );
	});