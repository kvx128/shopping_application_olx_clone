class Car {
  final int year, kmDriven, noOfOwners;
  final String brand, model, variant, description, fuel;
  final double price;

  Car(this.year, this.kmDriven, this.noOfOwners, this.brand, this.model,
      this.variant, this.description, this.fuel, this.price);
}

class Bike {
  final String brand, model, description;
  //final int year, kmDriven;
  final double price;

  Bike(this.brand, this.model, this.description, this.price);
}

class Mobile {
  final String brand, description;
  final double price;
  Mobile(this.brand, this.description, this.price);
}

class Properties {
  final String type,
      furnishing,
      constructionStatus,
      listedBy,
      facing,
      projectName;
  final num bedrooms,
      bathrooms,
      superBuiltupArea,
      carpetArea,
      totalFloors,
      floorNo,
      carParking;
  final double price;

  Properties(
      this.type,
      this.furnishing,
      this.constructionStatus,
      this.listedBy,
      this.facing,
      this.projectName,
      this.bedrooms,
      this.bathrooms,
      this.superBuiltupArea,
      this.carpetArea,
      this.totalFloors,
      this.floorNo,
      this.carParking,
      this.price);
}

class Electronics {
  final String description;
  final double price;

  Electronics(this.description, this.price);
}

class Pets {
  final String description;
  final double price;

  Pets(this.description, this.price);
}

class Fashion {
  final String description;
  final double price;
  Fashion(this.description, this.price);
}
