(function() {
  var Location, root;
  Location = function(lat, lon) {
    var failure, radians, success;
    success = function(pos) {
      this.lat = radians(pos.coords.latitude);
      this.lon = radians(pos.coords.longitude);
      this.acc = pos.coords.accuracy;
      alert(this.lat + " " + this.lon + " " + this.acc);
      return null;
    };
    failure = function(err) {
      alert(err);
      this.lat = 0;
      this.lon = 0;
      this.acc = 0;
      return null;
    };
    radians = function(x) {
      return x * 3.1416 / 180;
    };
    if (typeof lon === 'undefined') {
      navigator.geolocation.getCurrentPosition(success, failure);
    } else {
      this.lat = radians(lat);
      this.lon = radians(lon);
    }
    return this;
  };
  root = (typeof exports !== "undefined" && exports !== null) ? exports : this;
  root.Location = Location;
})();
