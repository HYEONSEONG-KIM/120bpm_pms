
String.prototype.getByteLength = function () {

    var intByteLength = 0;
    var chrData         = null;
    for(var i=0; i<this.length; i++) {
        chrData = escape(this.charAt(i));
        if(chrData.length == 1) {
            intByteLength ++;
        } else if (chrData.indexOf("%u") != -1) {
            intByteLength += 2;
        } else if (chrData.indexOf("%") != -1) {
            intByteLength += chrData.length/3;
        }
    }
    return intByteLength;
}

var strCheckData = "문자열의 byte 길이 체크";

//document.write( strCheckData.getByteLength() );
// 정규식을 적용

$.validator.addMethod("regx", function(value, element, regexpr) {          

    return regexpr.test(value);

    
    
    
});

// 한글, 영어를 체크하여 계산된 바이트 길이를 최소 길이와 최대 길이 비교
$.validator.addMethod('minbytelength', function (value, element, params, param) {
    var nMin = params.min;
    var nMin = param;
    var nBytes = $.type(value) !== "string" ? 0 : value.getByteLength();
	
    return this.optional(element)||(nBytes===0 || nBytes >=nMin); 
});

//한글, 영어를 체크하여 계산된 바이트 길이를 최대 길이와 비교

$.validator.addMethod('maxbytelength', function (value, element, param) {
    var nMax = param;
    var nBytes = $.type(value) !== "string" ? 0 : value.getByteLength();
    return this.optional(element) || (nBytes === 0 || nBytes <= nMax);

});


$.validator.addMethod('bytelength', function (value, element, params) {

    var nMin = params.min;
    var nMax = params.max;
    var nBytes = $.type(value) !== "string" ? 0 : value.getByteLength(); // 문자열의 Byte 길이를 반환(한글은 2byte이며 영숫자는 1byte)


    return this.optional(element) || (nBytes === 0 || (nBytes >= nMin && nBytes <= nMax));

});



