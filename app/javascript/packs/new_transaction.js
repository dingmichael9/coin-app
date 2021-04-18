const amount_form = document.querySelector('#transaction_amount');
amount_form.value = "0";

const amount_display = document.querySelector('.amount_display');
amount_display.textContent = "$" + amount_form.value;

const buttons = document.querySelectorAll('.number_input');

buttons.forEach((button) => {
    button.addEventListener('click', () => {
        if (amount_form.value == "0") {
            amount_form.value = button.textContent;
        }        
        else {
            if (amount_form.value.includes(".")) {
                decimal_count = amount_form.value.split(".")[1].length;
                if (decimal_count < 2) {
                    amount_form.value += button.textContent;
                }
            }
            else {
                amount_form.value += button.textContent;
            }
        }        
        amount_display.textContent = "$" + amount_form.value;
    });
});

const backspace = document.querySelector('.backspace');

backspace.addEventListener('click', () => {
    if (amount_form.value.length == 1) {
        amount_form.value = "0";
    }
    else {
        amount_form.value = amount_form.value.slice(0, -1);
    }    
    amount_display.textContent = "$" + amount_form.value;
});

const decimal_point = document.querySelector('.decimal_point');

decimal_point.addEventListener('click', () => {
    if (!amount_form.value.includes(".")) {
        amount_form.value += ".";
    }
    amount_display.textContent = "$" + amount_form.value;
});