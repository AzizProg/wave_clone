abstract class AuthentificationRepository<T>{
   Future<T> logIn();
   void logOut();
}