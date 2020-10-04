import 'dart:io';

void main() {
  Directory assetDir = Directory('./assets');



  StringBuffer result = new StringBuffer();
  result.write('/// generate by run projectRoot/test/asset_generate.dart ');
  result.write('\n\n');
  result.write('class Assets {\n');

  List<String> nameList = [];
  List<String> pathList = [];
  generate(assetDir, result, nameList, pathList);
  result.write('\n}');
  print(result);
  result.write('\n\n\n/*\n');
  for(String path in pathList) {
    result.write('- $path\n');
  }
  result.write('*/\n');

  File file = new File('./lib/common/const/assets.dart');
  if (!file.existsSync()) file.createSync();
  file.writeAsString(result.toString());

}

generate(Directory directory, StringBuffer result, List<String> nameList, List<String> pathList) {
  List<FileSystemEntity> dirOrFileList = directory.listSync();
  dirOrFileList.sort((file1, fil12) {
    if(file1 is File) {
      return -1;
    }
    return 1;
  });
  print(directory.path + "========");
  if (dirOrFileList.isNotEmpty) result.write('\n\n\t///${directory.path.replaceAll("\\", "/")}\n');
  for(FileSystemEntity dirOrFile in dirOrFileList) {
    if (dirOrFile is File) {
      //Windows下文件路径是 ./assets\image\chat\*.png
      List<String> splitList = dirOrFile.path.split(new RegExp(r'[/,\\]'));
      String fileName = splitList.last.split('.').first;
      fileName = fileName.replaceAll('-', '_');
      String path = dirOrFile.path.replaceAll('\\', '/').split('./').last;
      pathList.add(path);
      if (fileName.isNotEmpty && !dirOrFile.path.contains('DS_Store') && !nameList.contains(fileName)) {
        result.write('\tstatic const $fileName = \'$path\';\n');
        nameList.add(fileName);
      }
    } else if (dirOrFile is Directory) {
      generate(dirOrFile, result, nameList, pathList);
    }
  }

}