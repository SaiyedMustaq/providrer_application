//TODO https://fakerestapi.azurewebsites.net/index.html
//TODO https://petstore.swagger.io/#/pet/uploadFile

class AppUrl {
  static AppUrl appUrl = AppUrl();
  static const BASEURL = 'https://fakerestapi.azurewebsites.net/api/v1/';
  static const BASEURL2 = 'https://petstore.swagger.io/v2';
  // ignore: constant_identifier_names
  static const GET_ACTIVITY = BASEURL + 'Activities';
  // ignore: constant_identifier_names
  static const POST_ACTIVITY = BASEURL + 'Activities';
  // ignore: constant_identifier_names
  static const GET_ACTIVITY_USING_ID = BASEURL + 'Activities/1'; // 1 pass as id
  // ignore: constant_identifier_names
  static const DELETE_ACTIVITY_USING_ID =
      BASEURL + 'Activities/1'; //1 pass as id
  // ignore: constant_identifier_names
  static const GET_AUTHER = BASEURL + 'Authors';
  // ignore: constant_identifier_names
  static const POST_AUTHOR = BASEURL + 'Authors';
  // ignore: constant_identifier_names
  static const GET_BOOK_USING_ID =
      BASEURL + 'Authors/authors/books/1'; //1 pass as id
  // ignore: constant_identifier_names
  static const GET_AUTHOR_USING_ID = 'Authors/1'; // 1 pass as id
  // ignore: constant_identifier_names
  static const DELETE_AUTHOR_USING_ID = 'Authors/1'; //a pass as id
  // ignore: constant_identifier_names
  static const GET_ALL_BOOKS = 'Books';
  // ignore: constant_identifier_names
  static const POST_BOOK = 'Books';
  // ignore: constant_identifier_names
  static const GET_BOOKS_USING_ID = 'Books/100'; // 100 pass as id
  // ignore: constant_identifier_names
  static const DELETE_BOOKS_USING_ID = 'Books/1'; // 1 pass as id
  // ignore: constant_identifier_names
  static const GET_ALL_COVER_PHOTOS = 'CoverPhotos';
  // ignore: constant_identifier_names
  static const GET_COVER_PHOTO_BOOK_USING_BOOK_ID =
      'CoverPhotos/books/covers/100'; // 100 pass as id
  // ignore: constant_identifier_names
  static const GET_SINGLE_COVER_PHOTO = 'CoverPhotos/100'; //100 pas as id
// ignore: constant_identifier_names
  static const USERS = 'Users';
  // ignore: constant_identifier_names
  static const USER_BY_ID = 'Users/10'; // 10 is id pass
  // ignore: constant_identifier_names
  static const PET_DETAILS_ADD =
      'pet/032/uploadImage'; //32 is id pass use baseurl2
  // ignore: constant_identifier_names
  static const ADD_PET_TO_STORE = '/pet';
// ignore: constant_identifier_names
  static const PET_FIND_BY_STATUS =
      'pet/findByStatus?status=available'; // available for status
  // ignore: constant_identifier_names
  static const GET_PET_ID = '/pet/1';
  // ignore: constant_identifier_names
  static const DELETE_PET_ID = '/pet/1';
  // ignore: constant_identifier_names
  static const PLACE_ORDER = 'store/order';
  // ignore: constant_identifier_names
  static const ORDER_BY_ID = 'store/order/1';
  // ignore: constant_identifier_names
  static const INVENTORY = 'store/inventory';
  // ignore: constant_identifier_names
  static const MULTIPLE_USER_CREATE = 'user/createWithArray';
}
