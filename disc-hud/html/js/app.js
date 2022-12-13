var cash = 0
var bank = 0

window.addEventListener('message', function (event) {


    switch (event.data.action) {
        case 'tick':
            //$(".container").css("display", event.data.show ? "none" : "block");
            if (event.data.show) $("#text-container-time").hide();
				else $("#text-container-time").show()

            $("#boxHeal").css("width", event.data.health + "%");
            $("#boxArmor").css("width", event.data.armor + "%");
            $("#boxStamina").css("width", event.data.stamina + "%");

 
            $('.speed-val').html(event.data.speed);


            $('.measurement-val').html(event.data.sign);

            if (event.data.speed >= 100) {
                $('.speed-val').addClass('fast');
            } else {
                $('.speed-val').removeClass('fast');
            }

            $('.clock').html(event.data.time + ' <span class="ampm">' + event.data.ampm + '</span>');

            if (event.data.street2 !== '') {
                $('.position').html(event.data.street1 + ' <span class="seperator2">-</span> ' + event.data.street2 + ' <span class="seperator">|</span> [' + event.data.area + ']');
            } else {
                $('.position').html(event.data.street1 + ' <span class="seperator">|</span> ' + event.data.area);
            }
            break;
        case 'display':
            cash = event.data.cash;
            bank = event.data.bank;

            $('.cash').html('$' + formatCurrency(cash));
            $('.bank').html('$' + formatCurrency(bank));
            break;
        case 'change':
            var $element = $('<span class="' + event.data.type + '">$ ' + event.data.amount + '</span>');
            if (event.data.account === 'cash') {
                cash += event.data.amount;

                $('.cash-change').append($element);
                setTimeout(function () {
                    $('.cash').html('$' + formatCurrency(cash));
                    $element.remove();
                }, 1000);
            } else {
                bank += event.data.amount;

                $('.bank-change').append($element);
                setTimeout(function () {
                    $('.bank').html('$' + formatCurrency(bank));
                    $element.remove();
                }, 1000);
            }
            break
        case 'updateStatus':
            $('#boxHunger').css('width', event.data.hunger + '%');
            $('#boxThirst').css('width', event.data.thirst + '%');
            break;
        case 'hidecar':
            $('.car').fadeOut();
            break;
        case 'showcar':
            $('.car').fadeIn();
            break;
        case 'showui':
            $('body').fadeIn();
            break;
        case 'hideui':
            $('body').fadeOut();
            break;
        case 'toggle-seatbelt':
            if ($('.seatbelt').hasClass('on')) {
                $('.seatbelt').addClass('off').removeClass('on');
            } else {
                $('.seatbelt').addClass('on').removeClass('off');
            }
            break;
        case 'set-seatbelt':
            if (!event.data.seatbelt) {
                $('.seatbelt').addClass('off').removeClass('on');
            } else {
                $('.seatbelt').addClass('on').removeClass('off');
            }
            break;
        case 'toggle-cruise':
            if ($('.cruise').hasClass('on')) {
                $('.cruise').addClass('off').removeClass('on');
            } else {
                $('.cruise').addClass('on').removeClass('off');
            }
            break;
        case 'set-cruise':
            if (!event.data.cruise) {
                $('.cruise').addClass('off').removeClass('on');
            } else {
                $('.cruise').addClass('on').removeClass('off');
            }
            break;
        case 'set-voice':
            $("#boxVoice").css("width", event.data.value + "%");
            break;
        case 'voice-color':
            if (event.data.isTalking) {
                $('#boxVoice').addClass('active');
            } else {
                $('#boxVoice').removeClass('active');
            }
            break;
        case 'update-fuel':
        
            $('.fuel-val').html(event.data.fuel);

            if (event.data.fuel <= 10) {
                $('.fuel-val').addClass('low');
            } else {
                $('.fuel-val').removeClass('low');
            }

            break;
    }
});

function formatCurrency(x) {
    return x.toString().replace(/\B(?=(\d{1})+(?!\d))/g, ",");
}