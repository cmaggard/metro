class Location
  constructor: (lat, lon) ->
    success= (pos) ->
      @lat = radians pos.coords.latitude
      @lon = radians pos.coords.longitude
      @acc = pos.coords.accuracy
      alert @lat + " " + @lon + " " + @acc
      null

    failure= (err) ->
      alert err
      null

    radians= (x) ->
      x * 3.1416 / 180
      #6371.009
    if typeof lon == 'undefined'
      navigator.geolocation.getCurrentPosition success, failure
    else
      @lat = radians lat
      @lon = radians lon


root = exports ? this

root.Location = Location
