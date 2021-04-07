import 'dart:io' as Io;

// This is a sample file which demonstrate on parsing a xml license file 
// using RegExp. This file print an ID, Name and Link of license from xml license file.

void main() async {

  final regId = RegExp(r'licenseId="([^"]*)');
  final regName = RegExp(r'name="([^"]*)');
  final regLink = RegExp(r'<crossRef>(.*)</crossRef>');

  print('Enter the SPDX xml FileName : ');
  var file = Io.stdin.readLineSync();

  String path = Io.Directory.current.path + '/internal/xml/';

  bool exist = await Io.File('$path$file.xml').exists();

  if(!exist) {
    print('No SPDX File name as $file is found');
  } else {
    var content = await Io.File('$path$file.xml').readAsString();

    var licenseId = regId.firstMatch(content)?.group(1);
    var licenseName = regName.firstMatch(content)?.group(1);
    var licenseLink = regLink.firstMatch(content)?.group(1);

    print('''\n    
    Licnese Name: $licenseName
    License Id  : $licenseId
    License Link: $licenseLink
    ''');

  }


}