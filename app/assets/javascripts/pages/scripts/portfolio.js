var Portfolio = function () {


    return {
        //main function to initiate the module
        init: function () {
            $('.mix-grid').mixitup();
        }

    };

};

$(document).on('ready', Portfolio);

