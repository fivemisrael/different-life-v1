var buttons = document.querySelectorAll(".btn");
var screen = document.querySelector("#screen");
var keystroke = document.querySelector("audio");
var expression = "";
var operatorCheck = [];
var decimalPointCheck = [];
var mathError = false;
var cursor = '<span class="cursor">|</span>';

$(document).ready(function(){
    window.addEventListener('message', function(event) {

        if (event.data.action == true) {
            // $('body').show();
            $("body").css("display", "flex");
            screen.innerHTML = "";

            expression = "";
            operatorCheck = [];
            decimalPointCheck = [];
            mathError = false;

        } else if (event.data.action == false) {
            $("body").css("display", "none");
        }
    });


    document.onkeyup = function (data) {
        if (data.which == 27 ) {
            $.post('http://calculator/close', JSON.stringify({}));
        }
    };
});


// Attach Click and transitionend event listeners to each calculator button
buttons.forEach(function(button) {
    button.addEventListener("click", enterValue);
    button.addEventListener("mousedown", playKeystroke);
    button.addEventListener("transitionend", removeTransitionEffect);
});

// Add Button Hover Transiition And Play Keystroke Sound To Allow For Keyboard Feedback.
document.body.addEventListener("keydown", e => {
    var button = document.querySelector(`button[data-value="${e.key}"]`);
    if (button) {
        playKeystroke();
        button.classList.add("btn-hover");
    } else if (e.key == "Enter") {
        playKeystroke();
        var button = document.querySelector('button[data-value="="]');
        button.classList.add("btn-hover");
    } else if (e.key == "Delete") {
        playKeystroke();
        var button = document.querySelector('button[data-value="MC"]');
        button.classList.add("btn-hover");
    }
});

// Remove Hover Transition effect when key is back up to it's original position
document.body.addEventListener("keyup", e => {
    // console.log(e.key);
    var button = document.querySelector(`button[data-value="${e.key}"]`);
    if (button) {
        button.click();
        button.classList.remove("btn-hover");
    } else if (e.key == "Enter") {
        var button = document.querySelector('button[data-value="="]');
        button.click();
        button.classList.remove("btn-hover");
    } else if (e.key == "Delete") {
        var button = document.querySelector('button[data-value="MC"]');
        button.click();
        button.classList.remove("btn-hover");
    }
});

// Remove Hover Transition Effect When Transition Ends
function removeTransitionEffect(e) {
    if (e.propertyName === "box-shadow" && e.elapsedTime === 0.15) {
        this.classList.remove("btn-hover");
    }
}

// Handle Inputs From Calculator
function enterValue(e) {
    // Get Pressed Key's Value
    var value = this.dataset.value;
    this.blur();
    if (screen.innerHTML == cursor || mathError === true) {
        screen.innerHTML = "";
        mathError = false;
    }
    // Handle the inputs based on their types
    if (!isNaN(value) || value == ".") {
        // If the value is a number or a decimal point
        if (value === "." && decimalPointCheck.length === 0) {
            decimalPointCheck.push(".");
            screen.innerHTML = screen.innerHTML.replace(cursor, "");
            screen.innerHTML += value;
            screen.innerHTML += cursor;
            expression += value;
            operatorCheck = [];
            // Always keeping the scroll position to the end of the screen
            screen.scrollLeft = screen.scrollWidth;
        } else if (value !== ".") {
            if (
                isNaN(expression.split("")[expression.length - 1]) &&
                expression.split("")[expression.length - 1] !== "."
            ) {
                decimalPointCheck = [];
            }
            screen.innerHTML = screen.innerHTML.replace(cursor, "");
            screen.innerHTML += value;
            screen.innerHTML += cursor;
            expression += value;
            operatorCheck = [];
        }
        // Always keeping the scroll position to the end of the screen
        screen.scrollLeft = screen.scrollWidth;
    } else if (isNaN(value) && value != ".") {
        //If value is not a decimal point or a number
        if (value == "MC") {
            // If the press key was the 'Memory Clear' Key
            screen.innerHTML = cursor;
            expression = "";
            value = "";
            operatorCheck = [];
            decimalPointCheck = [];
        } else if (value == "=") {
            // If the pressed key was the 'Equals To' key
            if (
                operatorCheck[operatorCheck.length - 1] &&
                expression.split("").length > 0
            ) {
                newExpression = expression.split("");
                newExpression[newExpression.length - 1] = "";
                expression = newExpression.join("");
                operatorCheck = [];
                decimalPointCheck = [];
            }
            var result = eval(expression);
            if (!isFinite(result) || isNaN(result)) {
                if (screen.innerHTML != "") {
                    mathError = true;
                    screen.innerHTML = "MATH ERROR";
                    screen.scrollLeft = screen.scrollWidth;
                    expression = "";
                    return;

                } else {
                    mathError = true;
                    screen.scrollLeft = screen.scrollWidth;
                    expression = "";
                    return;
                    }
            }
            screen.innerHTML = result;
            expression = screen.innerHTML;
        } else if (value == "Backspace") {
            if (screen.innerHTML == "") {
                $.post('http://calculator/close', JSON.stringify({}));
                screen.innerHTML = cursor;
            }
            newExpression = expression.split("");
            var valueToRemove = newExpression[newExpression.length - 1];
            if (valueToRemove == ".") {
                decimalPointCheck = [];
            } else if (isNaN(valueToRemove)) {
                if (operatorCheck.length == 2) {
                    operatorCheck.splice(1, 1);
                } else if (operatorCheck.length == 1) {
                    operatorCheck.pop();
                }
            }
            newExpression[newExpression.length - 1] = "";
            expression = newExpression.join("");
            expression = expression;
            screen.innerHTML = expression;
            screen.innerHTML += cursor;
            // Always keeping the scroll position to the end of the screen
            screen.scrollLeft = screen.scrollWidth;
        } else {
            // If the pressed key was an Arithmetic Operation Key
            if (expression.length > 0) {
                if (operatorCheck.length === 0) {
                    operatorCheck.push(value);
                    expression += value;
                    screen.innerHTML = screen.innerHTML.replace(cursor, "");
                    screen.innerHTML += value;
                    screen.innerHTML += cursor;
                    // Always keeping the scroll position to the end of the screen
                    screen.scrollLeft = screen.scrollWidth;
                } else {
                    if (operatorCheck[0]) {
                        if (
                            (operatorCheck[operatorCheck.length - 1] == "*" ||
                                operatorCheck[operatorCheck.length - 1] == "/") &&
                            value == "-"
                        ) {
                            operatorCheck.push(value);
                            expression += value;
                            screen.innerHTML = screen.innerHTML.replace(cursor, "");
                            screen.innerHTML += value;
                            screen.innerHTML += cursor;
                            // Always keeping the scroll position to the end of the screen
                            screen.scrollLeft = screen.scrollWidth;
                        } else if (operatorCheck.length === 1) {
                            newExpression = expression.split("");
                            newExpression[newExpression.length - 1] = value;
                            expression = newExpression.join("");
                            operatorCheck = [];
                            operatorCheck.push(value);
                            expression = expression;
                            screen.innerHTML = screen.innerHTML.replace(cursor, "");
                            screen.innerHTML = expression;
                            screen.innerHTML += cursor;
                            // Always keeping the scroll position to the end of the screen
                            screen.scrollLeft = screen.scrollWidth;
                        }
                    }
                }
            }
        }
    }
}

// Play the keystroke sound
function playKeystroke() {
    keystroke.currentTime = 0.2;
    keystroke.play();
}