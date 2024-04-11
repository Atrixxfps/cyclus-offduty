$(document).ready(function() {
    $("body").hide();
    $(".container").hide();
    $(".logo").hide();
    window.addEventListener('message', function(event) {
        switch (event.data.action) {
            case "open":
                OpenOffDuty(event.data.steamnaam, event.data.job, event.data.offjob, event.data.img)
                break;
            case "close":
                CloseOffDuty()
                break;
        }
    });
})

function OpenOffDuty(steamnaam, job, offjob, img) {
    $(".container").css({'top':'1vh'});
    $(".container").css({'height':'50%'});
    $(".container").css({'display':'block'}).animate({
        top: 50+"vh"
    }, 750)
    $("body").fadeIn(700);
    $(".container").fadeIn(700);
    $(".logo").fadeIn(700);
    $('.logo img').attr('src', img);
    $(".welkom").text("Welkom | " + steamnaam);
    $('.indienst').attr('id', job)
    $('.uitdienst').attr('id', offjob)
}

$(document).ready(function() {
    $(".close").click(function() {
        CloseOffDuty()
        $.post('https://cyclus-offduty/close', JSON.stringify({}));
    });
});

$(document).ready(function() {
    $(".indienst").click(function() {
        CloseOffDuty();
        $.post('https://cyclus-offduty/veranderjob', JSON.stringify({
            job: $(this).attr('id'),
        }));
        $.post('https://cyclus-offduty/close', JSON.stringify({}));
    });
    $(".uitdienst").click(function() {
        CloseOffDuty();
        $.post('https://cyclus-offduty/veranderjob', JSON.stringify({
            job: $(this).attr('id'),
        }));
        $.post('https://cyclus-offduty/close', JSON.stringify({}));
    });
});

function CloseOffDuty() {
    $(".container").animate({
        top: -40+"vh",
    }, 1000, function(){
        $(".container").css({'display':'none'});
        $(".container").fadeOut(350);
        $(".logo").fadeOut(350);
    });
}

$(document).on('keydown', function () {
    switch (event.keyCode) {
        case 27: // ESC
            CloseOffDuty()
            $.post('https://cyclus-offduty/close', JSON.stringify({}));
            break;
    }
});