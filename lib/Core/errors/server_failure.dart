import 'package:cloud_firestore/cloud_firestore.dart';

import 'failure.dart';

class ServerFailure extends Failure {
  ServerFailure({required super.errorMessage});

  factory ServerFailure.fromFirebaseAuthException(String message) {
    switch (message) {
      case 'invalid-email':
        return ServerFailure(errorMessage: 'Invalid Email');
      case 'user-disabled':
        return ServerFailure(errorMessage: 'User Disabled');
      case 'user-not-found':
        return ServerFailure(errorMessage: 'User Not Found');
      case 'wrong-password':
        return ServerFailure(errorMessage: 'Wrong Password');
      case 'email-already-in-use':
        return ServerFailure(errorMessage: 'Email Already In Use');
      case 'weak-password':
        return ServerFailure(errorMessage: 'Weak Password');
      case 'network-request-failed':
        return ServerFailure(
            errorMessage:
                'No Internet Connection, Please Check Your Connection and Try Again');
      case 'invalid-credential':
        return ServerFailure(errorMessage: 'Invalid Email or Password');
      default:
        return ServerFailure(
            errorMessage: 'Something Went Wrong, Try Again Later');
    }
  }

  factory ServerFailure.fromFirebaseException(FirebaseException exception) {
    switch (exception.code) {
      case 'permission-denied':
        return ServerFailure(errorMessage: 'Permission Denied');
      case 'unavailable':
        return ServerFailure(
            errorMessage: 'Service Unavailable, Please Try Again Later');
      case 'aborted':
        return ServerFailure(errorMessage: 'Request Aborted');
      case 'invalid-argument':
        return ServerFailure(errorMessage: 'Invalid Argument Provided');
      case 'not-found':
        return ServerFailure(errorMessage: 'Document Not Found');
      case 'already-exists':
        return ServerFailure(errorMessage: 'Document Already Exists');
      case 'deadline-exceeded':
        return ServerFailure(errorMessage: 'Deadline Exceeded');
      case 'data-loss':
        return ServerFailure(errorMessage: 'Data Loss Occurred');
      case 'failed-precondition':
        return ServerFailure(errorMessage: 'Failed Precondition');
      case 'internal':
        return ServerFailure(
            errorMessage: 'Internal Server Error, Please Try Again Later');
      case 'resource-exhausted':
        return ServerFailure(
            errorMessage: 'Resource Exhausted, Please Try Again Later');
      case 'unauthenticated':
        return ServerFailure(errorMessage: 'Unauthenticated Request');
      case 'cancelled':
        return ServerFailure(errorMessage: 'Request Cancelled');
      case 'out-of-range':
        return ServerFailure(errorMessage: 'Out of Range');
      default:
        return ServerFailure(
            errorMessage: 'Something Went Wrong, Try Again Later');
    }
  }
}
