$ ->
    $( "#slider_interest2" ).slider { value:100, min: 0, max: 500, step: 50, slide: ( event, ui ) ->
        $( "#interest_calculator_interest2" ).val( "$" + ui.value )	}
    $( "#interest_calculator_interest2" ).val( "$" + $( "#slider_interest2" ).slider( "value" ) )