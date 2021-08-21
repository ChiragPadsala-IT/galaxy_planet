class Planets {
  String planetName;
  String planetImage;
  String surfaceImage;
  String overView;
  String distanceToEarth;
  String distanceToSun;
  String gravity;

  Planets({
    this.planetName,
    this.distanceToEarth,
    this.distanceToSun,
    this.overView,
    this.planetImage,
    this.gravity,
    this.surfaceImage
  });

  factory Planets.from(Map <String,dynamic> m){
    return Planets(
      planetName : m["planetName"],
      distanceToEarth: m["distanceToEarth"],
      distanceToSun: m["distanceToSun"],
      overView: m["overView"],
      planetImage: m["planetImage"],
      gravity: m["gravity"],
      surfaceImage: m["surfaceImage"],
    );
  }
}
