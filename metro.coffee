class Location
  constructor: (lat, lon) ->
    success= (pos) ->
      @lat = radians pos.coords.latitude
      @lon = radians pos.coords.longitude
      @acc = pos.coords.accuracy
      alert @lat + " " + @lon + " " + @acc
      return

    failure= (err) ->
      alert err
      @lat = 0
      @lon = 0
      @acc = 0
      return

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
