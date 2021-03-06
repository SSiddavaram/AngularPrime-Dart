/**
 * (C) 2014 Stephan Rauh http://www.beyondjava.net
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */
import 'package:angular/angular.dart';

@NgController(selector: '[puiInputDemo]', publishAs: 'ctrl')
class PuiInputDemoController {

  String firstField = "first model value";
  String secondField = "second model value";
  String thirdField = "third model value";
  bool firstBoolean = true;
  bool secondBoolean = false;
  bool thirdBoolean = false;
  List<Car> carTable = [
                         new Car('Honda', 'Civic', '2008', 'silver'),
                         new Car('Volvo', 'V40', '2002', 'green'),
                         new Car('Opel', 'Corsa', '1997', 'red'),
                         new Car('Opel', 'Kadett', '1990', 'white')
                                       ];

  List<Car> emptyCarTable = [];

  get thirdFieldStyle {
    if (thirdField.isNotEmpty) return "background-color:#FF0"; else return
        "background-color:#F00";
  }

  addCar() {
    int idx = carTable.length % 4;
    if (idx == 0)      carTable.add(new Car('Scoda',   'Octavia', (2000 + idx).toString(), 'silver'));
    else if (idx == 1) carTable.add(new Car('Renault', 'R4',      (1970 + idx).toString(), 'red'));
    else if (idx == 1) carTable.add(new Car('BMW',     'E30',     (1980 + idx).toString(), 'blue'));
    else if (idx == 2) carTable.add(new Car('Volvo',   'V70',     (2006 + idx).toString(), 'red'));
    else if (idx == 3) carTable.add(new Car('Fiat',    'Panda',   (2003 + idx).toString(), 'black'));
  }

}

class Car {
  String brand;
  String type;
  String year;
  String color;
  Car(this.brand, this.type, this.year, this.color);

  void deleteCar() {
    print("Car.delete");
  }
  void editCar() {
    print("Car.edit");
  }
  String toString()
  {
    return "$brand $type $year $color";
  }

  int compareTo(Car other, String header)
  {
    if (header=="Brand")
    {
      return brand.compareTo(other.brand);
    }
    if (header=="Type")
    {
      return type.compareTo(other.type);
    }
    if (header=="Year")
    {
      return year.compareTo(other.year);
    }
    if (header=="Color")
    {
      return color.compareTo(other.color);
    }
    return 0;
  }
}

