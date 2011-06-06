var Step = 0.25;
var BoxCount = 0;
var series0, series1, series2, series3, series4, series5, series6 = [];
function zinsTotalNull(geliehen, zins, bindung, zinsDanach, zahlungMonat, zahlungJahr, sonderzahlung){
    if(geliehen == "" || zins == "" || bindung == "" || zinsDanach == "" || zahlungMonat == "" || zahlungJahr == "" || sonderzahlung == ""){
        return [];
    }
    var rest = geliehen;
    var series = [];
    var count = 1;
    series.push([0, parseFloat(rest)]);
    while (rest >= 0 && count < 400){
        if(count <= (bindung*12)){
            if (count % 12 == 0){
                rest = parseFloat(rest)+rest*(zins/100)/12-zahlungMonat-zahlungJahr-sonderzahlung;
            }else{
                rest = parseFloat(rest)+rest*(zins/100)/12-zahlungMonat;
            }
        }else{
            if (count % 12 == 0){
                rest = parseFloat(rest)+rest*(zinsDanach/100)/12-zahlungMonat-zahlungJahr-sonderzahlung;
            }else{
                rest = parseFloat(rest)+rest*(zinsDanach/100)/12-zahlungMonat;
            }
        }
        series.push([count, rest]);
        count++;
    }
    return series;
}

function updateGraph(){
    console.log("Update Graph");
    series0 = series1 = series2 = series3 = [];
    var geliehen = $("#interest_calculator_amount").val();
    var zahlungMonat = "0";
    var zahlungJahr = "0";
    if($("#interest_calculator_paymentMethod").val() == "monatlich"){
        zahlungMonat = $("#interest_calculator_payment").val();
    }else{
        zahlungJahr = $("#interest_calculator_payment").val();
    }
    var sonderzahlung = $("#interest_calculator_specialPayment").val();
    var zinsDanach = $("#interest_calculator_interestAfter").val();
    var plot0, plot1, plot2, plot3 = false;
    var min = 9999;
    if(!$("#offer0").hasClass("deactivated")){
        series0 = zinsTotalNull(geliehen, $("#interest0").val(), $("#fixed0").val(), zinsDanach, zahlungMonat,
                zahlungJahr, sonderzahlung);
        if(series0.length < min){
            min = series0.length;
        }
        plot0 = true;
    }
    if(!$("#offer1").hasClass("deactivated")){
        series1 = zinsTotalNull(geliehen, $("#interest1").val(), $("#fixed1").val(), zinsDanach, zahlungMonat,
                zahlungJahr, sonderzahlung);
        if(series1.length < min){
            min = series1.length;
        }
        plot1 = true;
    }
    if(!$("#offer2").hasClass("deactivated")){
        series2 = zinsTotalNull(geliehen, $("#interest2").val(), $("#fixed2").val(), zinsDanach, zahlungMonat,
                zahlungJahr, sonderzahlung);
        if(series2.length < min){
            min = series2.length;
        }
        plot2 = true;
    }
    if(!$("#offer3").hasClass("deactivated")){
        series3 = zinsTotalNull(geliehen, $("#interest3").val(), $("#fixed3").val(), zinsDanach, zahlungMonat,
                zahlungJahr, sonderzahlung);
        if(series3.length < min){
            min = series3.length;
        }
        plot3 = true;
    }
    var series = [];
    if(plot0){
        series.push(series0);
        if(series0.length == min){
            $("#offer0").addClass("best").stop().animate({ backgroundColor: "green" }, 1000);
        }else{
            $("#offer0").removeClass("best").stop().animate({ backgroundColor: "orange" }, 1000);
        }
    }
    if(plot1){
        series.push(series1);
        if(series1.length == min){
            $("#offer1").addClass("best").stop().animate({ backgroundColor: "green" }, 1000);
        }else{
            $("#offer1").removeClass("best").stop().animate({ backgroundColor: "orange" }, 1000);
        }
    }
    if(plot2){
        series.push(series2);
        if(series2.length == min){
            $("#offer2").addClass("best").stop().animate({ backgroundColor: "green" }, 1000);
        }else{
            $("#offer2").removeClass("best").stop().animate({ backgroundColor: "orange" }, 1000);
        }
    }
    if(plot3){
        series.push(series3);
        if(series3.length == min){
            $("#offer3").addClass("best").stop().animate({ backgroundColor: "green" }, 1000);
        }else{
            $("#offer3").removeClass("best").stop().animate({ backgroundColor: "orange" }, 1000);
        }
    }
    $.plot($("#placeholder"), series);
    
    //Zielflaggen befüllen
    if(plot0){
        var years = Math.floor(series0.length/12);
        var months = series0.length % 12;
        if(years != 0){
            $("#time0").html(years + " Jahre<br>" + months + " Monate");
        }else{
            $("#time0").html(months + " Monate");
        }

    }else{
        $("#time0").html("-");
    }
    
    if(plot1){
        var years = Math.floor(series1.length/12);
        var months = series1.length % 12;
        if(years != 1){
            $("#time1").html(years + " Jahre<br>" + months + " Monate");
        }else{
            $("#time1").html(months + " Monate");
        }

    }else{
        $("#time1").html("-");
    }
    
    if(plot2){
        var years = Math.floor(series2.length/12);
        var months = series2.length % 12;
        if(years != 2){
            $("#time2").html(years + " Jahre<br>" + months + " Monate");
        }else{
            $("#time2").html(months + " Monate");
        }

    }else{
        $("#time2").html("-");
    }
    
    if(plot3){
        var years = Math.floor(series3.length/12);
        var months = series3.length % 12;
        if(years != 3){
            $("#time3").html(years + " Jahre<br>" + months + " Monate");
        }else{
            $("#time3").html(months + " Monate");
        }

    }else{
        $("#time3").html("-");
    }

}

function toogleActive(target){
    if (target.attr("disabled") == "disabled") {
        $(target).removeAttr("disabled");
    }else{
        $(target).attr("disabled","disabled");
    }
    return false;
}

function makeSlider(target){
    target.each(function(){
        console.log("Made slider");
        var as = this;
        $(this).children(".slider_interest").slider({
            value:$(this).children(".interest").val(),
            min: 0,
            max: 20,
            change: updateGraph,
            step: Step,
            slide: function( event, ui ) {
                $(as).children(".interest").val( ui.value );
            }
            });
        $(this).children(".interest").change(function (){
            $(as).children(".slider_interest").slider("value", $(as).children(".interest").val());
        });
        $(this).children(".interest").focusout(function (){
            $(as).children(".slider_interest").slider("value",$(as).children(".interest").val().replace(",", "."));
            $(as).children(".interest").val($(as).children(".interest").val().replace(",", "."));
            if($(as).children(".interest").val() == ""){
                $(as).children(".slider_interest").slider("value","0");
                $(as).children(".interest").val("0");
            }
            return false;
        });
        $(this).children(".slider_interest").slider("disable");
    });

}
$(function() {
    makeSlider($(".offer"));

    $("button").button();

    $(".deactivator").change(function(){
        console.log("Deactivator changed");
        var offer = $(this).parent(".offer");
        offer.toggleClass("deactivated");
        if (offer.hasClass("deactivated")) {
            offer.stop().animate({ backgroundColor: "#666666" }, 1000);
            offer.children("select").attr("disabled","disabled");
            offer.children(".interest").attr("disabled","disabled");
            offer.children(".slider_interest").slider("disable");
        }else{
            offer.stop().animate({ backgroundColor: "white" }, 150).animate({ backgroundColor: "orange" }, 1000);
            offer.children("select").removeAttr("disabled");
            offer.children(".interest").removeAttr("disabled");
            offer.children(".slider_interest").slider("enable");
        }
        return false;
    });

    $(".offer").children().change(updateGraph);
    $("#generalBox").children().change(updateGraph);

    $(".hint").tooltip({ effect: 'slide'}).dynamic({ bottom: { direction: 'down', bounce: true } });
});