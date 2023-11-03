/*
class Failure {

}
*/
class Failure {
  final String message;

  Failure({this.message = ''});
}

class UnExpectedFailure extends Failure {
  UnExpectedFailure({
    super.message,
  });
}
