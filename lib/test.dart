void getData ()
async {
  print(await fetchData());
}

Future<String> fetchData()
{
  return Future.delayed(Duration(seconds: 5), (){
    return "data from network";
  });
}