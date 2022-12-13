$('.card-with-player').click(function () {

    var chosenCharacterId =  $(this).data('character-id');

    $('.card').removeClass('chosen-character');
    // $('.play-button').css('display', 'none');
    // $('.delete-button').css('display', 'none');

    if (chosenCharacterId > 0) {
        $(this).addClass('chosen-character');
        //= $('#playButton-' + chosenCharacterId).css('display', 'block');
        // $('#deleteButton-' + chosenCharacterId).css('display', 'block');
    }
});

$('.card-without-player').click(function () {

    var chosenCharacterId = $(this).data('character-id');
    var isCharacter = 'false';

    $.post("http://esx_kashacters/CharacterChosen", JSON.stringify({
        charid: chosenCharacterId,
        ischar: 'false'
    }));
    Kashacter.CloseUI();
});

$('.play-button').click(function () {

    var chosenCharacterId = $(this).data('character-id');

    $.post("http://esx_kashacters/CharacterChosen", JSON.stringify({
        charid: chosenCharacterId,
        ischar: 'true'
    }));
    Kashacter.CloseUI();
});


$('.delete-button').click(function () {

    var chosenCharacterId = $(this).data('character-id');

	if (chosenCharacterId > 0) {
		$('#deletechar').data('character-id', chosenCharacterId);
		$('#delete-char').modal('show');
    } else {
		Kashacter.CloseUI();
	}
    
});



$("#deletechar").click(function () {
	
	var chosenCharacterId =  $(this).data('character-id');
	
	if (chosenCharacterId > 0) {
		$.post("http://esx_kashacters/DeleteCharacter", JSON.stringify({
			charid: chosenCharacterId,
		}));
    }

    Kashacter.CloseUI();
});



/* TRASH BELOW FROM ORIGINAL CODER */

(() => {
    Kashacter = {};

    Kashacter.ShowUI = function (data) {
        $('.character-container').css('display', 'block');
        if (data.characters !== null) {
            $('.card-with-player').css('display', 'none');
            $('.card-without-player').css('display', 'block');
            $('.dead-alive').css('display', 'none');
            $.each(data.characters, function (index, char) {
                if (char.charid !== 0) {
                    var charid = char.identifier.charAt(4);
                    $('#c-name-' + charid).html(char.firstname + ' ' + char.lastname);
					
					var jobGrade = (char.job !== 'Unemployed' && char.job !== 'unemployed') ? '- ' + char.job_grade + '' : '';
                    $('#c-job-' + charid).html(char.job + ' ' + jobGrade);
					
                    if (char.is_dead === '0') {
                        $('#c-alive-' + charid).css('display', 'block');
                    } else if (char.is_dead === '1') {
                        $('#c-dead-' + charid).css('display', 'block');
                    }
                    var dateString = new Date(char.dateofbirth).toLocaleString('en-US');
                    $('#c-dob-' + charid).html(dateString.substring(0, dateString.length - 13));
                    $('#c-gender-' + charid).html((char.sex === 'm') ? 'Male' : (char.sex === 'f') ? 'Female' : 'Unknown');
                    $('#c-height-' + charid).html(char.height);
                    $('#c-phone-' + charid).html(char.phone_number);
                    $('#c-bank-' + charid).html('$' + char.bank.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ','));
                    $('#c-cash-' + charid).html('$' + char.money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ','));

                    $('#character-without-' + charid).css('display', 'none');
                    $('#character-with-' + charid).css('display', 'block');
                    $('#character-with-' + charid).attr('is-character', 'true');
                    ShowLoading(false)
                }
            });
        }
    };

    Kashacter.CloseUI = function () {
        $('.character-container').css('display', 'none');
        $('.card').removeClass('chosen-character');
        // $('.play-button').css('display', 'none');
        // $('.delete-button').css('display', 'none');
        $('.card-with-player').css('display', 'none');
        $('.card-without-player').css('display', 'block');
    };
    Kashacter.ShowWelcome = function() {
         $('.charWelcome').css({"display":"block"});
         $('#changelog').css({"display":"block"});
         IsInMainMenu = true
    };
    Kashacter.HideWelcome = function() {
         $('.charWelcome').css({"display":"none"});
         $('#changelog').css({"display":"none"});
         IsInMainMenu = false
    };
    window.onload = function(e) {
        window.addEventListener('message', function(event) {
            switch(event.data.action) {
                case 'openui':
                    Kashacter.ShowUI(event.data);
                    ShowLoading(false)
                    break;
                case 'openwelcome':
                    Kashacter.ShowWelcome();
                    break;
                case 'displayback':
                     $('.top-bar2').css({"display":"block"});
                     $('.bottom-bar2').css({"display":"block"});
                    $('.BG').css({"display":"block"});
                    break;
            }
        })
        document.onkeydown = function(data) {
            if (data.which == 13 && IsInMainMenu) {
                Kashacter.HideWelcome();
                $('#loading').css({"display":"block"});
                $.post("http://esx_kashacters/ShowSelection", JSON.stringify({}));
                ShowLoading(true)
            }
        }
    }

})();


function ShowLoading(display) {
    if (display) {
        $(".lds-spinner").css("display", "block")
    } else {
        $(".lds-spinner").css("display", "none")
    }
}