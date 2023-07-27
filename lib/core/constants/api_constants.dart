/// Api codes
const int kApiCodeSuccess = 200;
const int kApiCodeBadRequest = 400;
const int kApiCodeInternalError = 500;

/// Header constants
const String kApplicationJson = "application/json";
const String kContentType = "Content-Type";

/// Keys
const String kApiKey = "26b303424caabd62e4cc7a7abff97e51";
const String kApiHash = "c4797cd036f5bbaee34626ab795a7991";
const String kApiTs = "1000";
const String kApiLimit = "50";

/// Urls
const String kUrlBase = "https://gateway.marvel.com:443/v1/public/comics";
const String kUrlBaseAuthorization = "?ts=$kApiTs&apikey=$kApiKey&hash=$kApiHash&limit=$kApiLimit";
const String kUrlFilterTitle = "&title=";