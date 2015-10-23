/*! skinny.js v0.1.0 | Copyright 2013 Vistaprint | vistaprint.github.io/SkinnyJS/LICENSE
http://vistaprint.github.io/SkinnyJS/download-builder.html?modules=jquery.uncomment*/

// ## jQuery.uncomment

(function ($) {
    $.fn.uncomment = function () {
        for (var i = 0, l = this.length; i < l; i++) {
            for (var j = 0, len = this[i].childNodes.length; j < len; j++) {
                if (this[i].childNodes[j].nodeType === 8) {
                    var content = this[i].childNodes[j].nodeValue;
                    $(this[i].childNodes[j]).replaceWith(content);
                }
            }
        }
    };
})(jQuery);
