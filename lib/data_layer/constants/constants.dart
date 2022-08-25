const String baseUrl =
    "https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/timeline/";
const String queryWeatherElements =
    "datetimeEpoch%2Ctemp%2Cfeelslike%2Chumidity%2Cprecipprob%2Cpreciptype%2Cwindspeed%2Cwinddir%2Cpressure%2Cconditions&include=current%2Chours%2Cdays&unitGroup=metric&lang=id"; //describes received weather conditions, should change only with Weather model
const String queryAstronomyElements =
    "datetimeEpoch%2CsunriseEpoch%2CsunsetEpoch%2Cmoonphase&include=days&unitGroup=metric"; //describes received astronomy conditions, should change only with AstronomyForecast model
