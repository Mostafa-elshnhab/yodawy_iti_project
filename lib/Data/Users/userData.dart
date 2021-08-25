class Usres {
  static String? name = '';
  static String? phone = '';
  static String? address = '';
  static String? gender = '';
// setname(name)
// {
//   Usres.name=name;
// }
// setphone(phone)
// {
//   Usres.phone=phone;
// }
// setaddres(address)
// {
//   Usres.address=address;
// }
// setgender(gender)
// {
//   Usres.gender=gender;
// }
  static List<String> getDAta() {
    return [
      '${Usres.name}',
      '${Usres.phone}',
      '${Usres.address}',
      '${Usres.gender}'
    ];
  }
}

bool isLoggedIn = false;
List<String>? userdata;
