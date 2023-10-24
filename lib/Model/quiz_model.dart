/// success : true
/// message : "Get Data Successfully  !"
/// data : {"category_quiz":[{"id":3,"name":"Football","description":"<p>Quiz About Football</p>","image":"https://cashrocket.maantechnology.com/back-end/img/Users_image/16679689043234.jpg","status":1,"created_at":"2022-11-09T04:41:44.000000Z","updated_at":"2022-11-09T04:41:44.000000Z","quizzes":[{"id":6,"category_id":3,"name":"FIFA","image":"https://cashrocket.maantechnology.com/back-end/img/Quiz_image/16679689824574.jpg","paid_status":0,"free_or_paid":null,"reward_point":200,"retake_point":100,"status":1,"created_at":"2022-11-09T04:43:02.000000Z","updated_at":"2022-11-09T04:43:02.000000Z","questions":[{"id":3,"quiz_id":6,"question":"When did FIFA started?","option_a":"1910","option_b":"1920","option_c":"1930","option_d":"1940","answer":"C","image":"https://cashrocket.maantechnology.com/","status":1,"created_at":"2022-11-09T04:44:05.000000Z","updated_at":"2022-11-09T04:44:05.000000Z"},{"id":4,"quiz_id":6,"question":"Who is the current president of FIFA?","option_a":"Robert Guérin","option_b":"Sepp Blatter","option_c":"Issa Hayatou","option_d":"Gianni Infantino","answer":"D","image":"https://cashrocket.maantechnology.com/","status":1,"created_at":"2022-11-09T04:45:39.000000Z","updated_at":"2022-11-09T04:45:39.000000Z"},{"id":5,"quiz_id":6,"question":"What is the name of this player?","option_a":"Maradona","option_b":"Pele","option_c":"Kaka","option_d":"Messi","answer":"B","image":"https://cashrocket.maantechnology.com/back-end/img/Question_image/16679692149653.jpg","status":1,"created_at":"2022-11-09T04:46:54.000000Z","updated_at":"2022-11-09T04:46:54.000000Z"},{"id":6,"quiz_id":6,"question":"What is the Full Form of FIFA?","option_a":"International Federation of Association Football","option_b":"Federation of International Football Association","option_c":"Football of International Federation Association","option_d":"None of the Above","answer":"A","image":"https://cashrocket.maantechnology.com/","status":1,"created_at":"2022-11-09T04:49:00.000000Z","updated_at":"2022-11-09T04:49:00.000000Z"},{"id":7,"quiz_id":6,"question":"In which country FIFA Headquarter is situated?","option_a":"Switzerland","option_b":"Canada","option_c":"Australia","option_d":"Pakistan","answer":"A","image":"https://cashrocket.maantechnology.com/","status":1,"created_at":"2022-11-09T04:50:12.000000Z","updated_at":"2022-11-09T04:50:12.000000Z"}]},{"id":7,"category_id":3,"name":"Players","image":"https://cashrocket.maantechnology.com/back-end/img/Quiz_image/16679695771760.jpg","paid_status":1,"free_or_paid":200,"reward_point":1000,"retake_point":200,"status":1,"created_at":"2022-11-09T04:52:57.000000Z","updated_at":"2022-11-09T04:52:57.000000Z","questions":[{"id":8,"quiz_id":7,"question":"What is the name of this player?","option_a":"Lionel Messi","option_b":"Erling Haaland","option_c":"Kylian Mbappé","option_d":"Robert Lewandowski","answer":"B","image":"https://cashrocket.maantechnology.com/back-end/img/Question_image/16679696784910.jpg","status":1,"created_at":"2022-11-09T04:54:38.000000Z","updated_at":"2022-11-09T04:54:38.000000Z"},{"id":9,"quiz_id":7,"question":"What is the name of this player?","option_a":"Lionel Messi","option_b":"Erling Haaland","option_c":"Kylian Mbappé","option_d":"Robert Lewandowski","answer":"D","image":"https://cashrocket.maantechnology.com/back-end/img/Question_image/16679697257002.png","status":1,"created_at":"2022-11-09T04:55:25.000000Z","updated_at":"2022-11-09T04:55:25.000000Z"},{"id":10,"quiz_id":7,"question":"What is the name of this player?","option_a":"Robert Guérin","option_b":"Sepp Blatter","option_c":"Kylian Mbappé","option_d":"Christopher Nkunku","answer":"D","image":"https://cashrocket.maantechnology.com/back-end/img/Question_image/16679697988295.png","status":1,"created_at":"2022-11-09T04:56:38.000000Z","updated_at":"2022-11-09T04:56:38.000000Z"}]}]}]}

class QuizModel {
  QuizModel({
      bool? success, 
      String? message, 
      Data? data,}){
    _success = success;
    _message = message;
    _data = data;
}

  QuizModel.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? _success;
  String? _message;
  Data? _data;

  bool? get success => _success;
  String? get message => _message;
  Data? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }

}

/// category_quiz : [{"id":3,"name":"Football","description":"<p>Quiz About Football</p>","image":"https://cashrocket.maantechnology.com/back-end/img/Users_image/16679689043234.jpg","status":1,"created_at":"2022-11-09T04:41:44.000000Z","updated_at":"2022-11-09T04:41:44.000000Z","quizzes":[{"id":6,"category_id":3,"name":"FIFA","image":"https://cashrocket.maantechnology.com/back-end/img/Quiz_image/16679689824574.jpg","paid_status":0,"free_or_paid":null,"reward_point":200,"retake_point":100,"status":1,"created_at":"2022-11-09T04:43:02.000000Z","updated_at":"2022-11-09T04:43:02.000000Z","questions":[{"id":3,"quiz_id":6,"question":"When did FIFA started?","option_a":"1910","option_b":"1920","option_c":"1930","option_d":"1940","answer":"C","image":"https://cashrocket.maantechnology.com/","status":1,"created_at":"2022-11-09T04:44:05.000000Z","updated_at":"2022-11-09T04:44:05.000000Z"},{"id":4,"quiz_id":6,"question":"Who is the current president of FIFA?","option_a":"Robert Guérin","option_b":"Sepp Blatter","option_c":"Issa Hayatou","option_d":"Gianni Infantino","answer":"D","image":"https://cashrocket.maantechnology.com/","status":1,"created_at":"2022-11-09T04:45:39.000000Z","updated_at":"2022-11-09T04:45:39.000000Z"},{"id":5,"quiz_id":6,"question":"What is the name of this player?","option_a":"Maradona","option_b":"Pele","option_c":"Kaka","option_d":"Messi","answer":"B","image":"https://cashrocket.maantechnology.com/back-end/img/Question_image/16679692149653.jpg","status":1,"created_at":"2022-11-09T04:46:54.000000Z","updated_at":"2022-11-09T04:46:54.000000Z"},{"id":6,"quiz_id":6,"question":"What is the Full Form of FIFA?","option_a":"International Federation of Association Football","option_b":"Federation of International Football Association","option_c":"Football of International Federation Association","option_d":"None of the Above","answer":"A","image":"https://cashrocket.maantechnology.com/","status":1,"created_at":"2022-11-09T04:49:00.000000Z","updated_at":"2022-11-09T04:49:00.000000Z"},{"id":7,"quiz_id":6,"question":"In which country FIFA Headquarter is situated?","option_a":"Switzerland","option_b":"Canada","option_c":"Australia","option_d":"Pakistan","answer":"A","image":"https://cashrocket.maantechnology.com/","status":1,"created_at":"2022-11-09T04:50:12.000000Z","updated_at":"2022-11-09T04:50:12.000000Z"}]},{"id":7,"category_id":3,"name":"Players","image":"https://cashrocket.maantechnology.com/back-end/img/Quiz_image/16679695771760.jpg","paid_status":1,"free_or_paid":200,"reward_point":1000,"retake_point":200,"status":1,"created_at":"2022-11-09T04:52:57.000000Z","updated_at":"2022-11-09T04:52:57.000000Z","questions":[{"id":8,"quiz_id":7,"question":"What is the name of this player?","option_a":"Lionel Messi","option_b":"Erling Haaland","option_c":"Kylian Mbappé","option_d":"Robert Lewandowski","answer":"B","image":"https://cashrocket.maantechnology.com/back-end/img/Question_image/16679696784910.jpg","status":1,"created_at":"2022-11-09T04:54:38.000000Z","updated_at":"2022-11-09T04:54:38.000000Z"},{"id":9,"quiz_id":7,"question":"What is the name of this player?","option_a":"Lionel Messi","option_b":"Erling Haaland","option_c":"Kylian Mbappé","option_d":"Robert Lewandowski","answer":"D","image":"https://cashrocket.maantechnology.com/back-end/img/Question_image/16679697257002.png","status":1,"created_at":"2022-11-09T04:55:25.000000Z","updated_at":"2022-11-09T04:55:25.000000Z"},{"id":10,"quiz_id":7,"question":"What is the name of this player?","option_a":"Robert Guérin","option_b":"Sepp Blatter","option_c":"Kylian Mbappé","option_d":"Christopher Nkunku","answer":"D","image":"https://cashrocket.maantechnology.com/back-end/img/Question_image/16679697988295.png","status":1,"created_at":"2022-11-09T04:56:38.000000Z","updated_at":"2022-11-09T04:56:38.000000Z"}]}]}]

class Data {
  Data({
      List<CategoryQuiz>? categoryQuiz,}){
    _categoryQuiz = categoryQuiz;
}

  Data.fromJson(dynamic json) {
    if (json['category_quiz'] != null) {
      _categoryQuiz = [];
      json['category_quiz'].forEach((v) {
        _categoryQuiz?.add(CategoryQuiz.fromJson(v));
      });
    }
  }
  List<CategoryQuiz>? _categoryQuiz;

  List<CategoryQuiz>? get categoryQuiz => _categoryQuiz;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_categoryQuiz != null) {
      map['category_quiz'] = _categoryQuiz?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 3
/// name : "Football"
/// description : "<p>Quiz About Football</p>"
/// image : "https://cashrocket.maantechnology.com/back-end/img/Users_image/16679689043234.jpg"
/// status : 1
/// created_at : "2022-11-09T04:41:44.000000Z"
/// updated_at : "2022-11-09T04:41:44.000000Z"
/// quizzes : [{"id":6,"category_id":3,"name":"FIFA","image":"https://cashrocket.maantechnology.com/back-end/img/Quiz_image/16679689824574.jpg","paid_status":0,"free_or_paid":null,"reward_point":200,"retake_point":100,"status":1,"created_at":"2022-11-09T04:43:02.000000Z","updated_at":"2022-11-09T04:43:02.000000Z","questions":[{"id":3,"quiz_id":6,"question":"When did FIFA started?","option_a":"1910","option_b":"1920","option_c":"1930","option_d":"1940","answer":"C","image":"https://cashrocket.maantechnology.com/","status":1,"created_at":"2022-11-09T04:44:05.000000Z","updated_at":"2022-11-09T04:44:05.000000Z"},{"id":4,"quiz_id":6,"question":"Who is the current president of FIFA?","option_a":"Robert Guérin","option_b":"Sepp Blatter","option_c":"Issa Hayatou","option_d":"Gianni Infantino","answer":"D","image":"https://cashrocket.maantechnology.com/","status":1,"created_at":"2022-11-09T04:45:39.000000Z","updated_at":"2022-11-09T04:45:39.000000Z"},{"id":5,"quiz_id":6,"question":"What is the name of this player?","option_a":"Maradona","option_b":"Pele","option_c":"Kaka","option_d":"Messi","answer":"B","image":"https://cashrocket.maantechnology.com/back-end/img/Question_image/16679692149653.jpg","status":1,"created_at":"2022-11-09T04:46:54.000000Z","updated_at":"2022-11-09T04:46:54.000000Z"},{"id":6,"quiz_id":6,"question":"What is the Full Form of FIFA?","option_a":"International Federation of Association Football","option_b":"Federation of International Football Association","option_c":"Football of International Federation Association","option_d":"None of the Above","answer":"A","image":"https://cashrocket.maantechnology.com/","status":1,"created_at":"2022-11-09T04:49:00.000000Z","updated_at":"2022-11-09T04:49:00.000000Z"},{"id":7,"quiz_id":6,"question":"In which country FIFA Headquarter is situated?","option_a":"Switzerland","option_b":"Canada","option_c":"Australia","option_d":"Pakistan","answer":"A","image":"https://cashrocket.maantechnology.com/","status":1,"created_at":"2022-11-09T04:50:12.000000Z","updated_at":"2022-11-09T04:50:12.000000Z"}]},{"id":7,"category_id":3,"name":"Players","image":"https://cashrocket.maantechnology.com/back-end/img/Quiz_image/16679695771760.jpg","paid_status":1,"free_or_paid":200,"reward_point":1000,"retake_point":200,"status":1,"created_at":"2022-11-09T04:52:57.000000Z","updated_at":"2022-11-09T04:52:57.000000Z","questions":[{"id":8,"quiz_id":7,"question":"What is the name of this player?","option_a":"Lionel Messi","option_b":"Erling Haaland","option_c":"Kylian Mbappé","option_d":"Robert Lewandowski","answer":"B","image":"https://cashrocket.maantechnology.com/back-end/img/Question_image/16679696784910.jpg","status":1,"created_at":"2022-11-09T04:54:38.000000Z","updated_at":"2022-11-09T04:54:38.000000Z"},{"id":9,"quiz_id":7,"question":"What is the name of this player?","option_a":"Lionel Messi","option_b":"Erling Haaland","option_c":"Kylian Mbappé","option_d":"Robert Lewandowski","answer":"D","image":"https://cashrocket.maantechnology.com/back-end/img/Question_image/16679697257002.png","status":1,"created_at":"2022-11-09T04:55:25.000000Z","updated_at":"2022-11-09T04:55:25.000000Z"},{"id":10,"quiz_id":7,"question":"What is the name of this player?","option_a":"Robert Guérin","option_b":"Sepp Blatter","option_c":"Kylian Mbappé","option_d":"Christopher Nkunku","answer":"D","image":"https://cashrocket.maantechnology.com/back-end/img/Question_image/16679697988295.png","status":1,"created_at":"2022-11-09T04:56:38.000000Z","updated_at":"2022-11-09T04:56:38.000000Z"}]}]

class CategoryQuiz {
  CategoryQuiz({
      int? id, 
      String? name, 
      String? description, 
      String? image, 
      int? status, 
      String? createdAt, 
      String? updatedAt, 
      List<Quizzes>? quizzes,}){
    _id = id;
    _name = name;
    _description = description;
    _image = image;
    _status = status;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _quizzes = quizzes;
}

  CategoryQuiz.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _description = json['description'];
    _image = json['image'];
    _status = json['status'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    if (json['quizzes'] != null) {
      _quizzes = [];
      json['quizzes'].forEach((v) {
        _quizzes?.add(Quizzes.fromJson(v));
      });
    }
  }
  int? _id;
  String? _name;
  String? _description;
  String? _image;
  int? _status;
  String? _createdAt;
  String? _updatedAt;
  List<Quizzes>? _quizzes;

  int? get id => _id;
  String? get name => _name;
  String? get description => _description;
  String? get image => _image;
  int? get status => _status;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  List<Quizzes>? get quizzes => _quizzes;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['description'] = _description;
    map['image'] = _image;
    map['status'] = _status;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    if (_quizzes != null) {
      map['quizzes'] = _quizzes?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 6
/// category_id : 3
/// name : "FIFA"
/// image : "https://cashrocket.maantechnology.com/back-end/img/Quiz_image/16679689824574.jpg"
/// paid_status : 0
/// free_or_paid : null
/// reward_point : 200
/// retake_point : 100
/// status : 1
/// created_at : "2022-11-09T04:43:02.000000Z"
/// updated_at : "2022-11-09T04:43:02.000000Z"
/// questions : [{"id":3,"quiz_id":6,"question":"When did FIFA started?","option_a":"1910","option_b":"1920","option_c":"1930","option_d":"1940","answer":"C","image":"https://cashrocket.maantechnology.com/","status":1,"created_at":"2022-11-09T04:44:05.000000Z","updated_at":"2022-11-09T04:44:05.000000Z"},{"id":4,"quiz_id":6,"question":"Who is the current president of FIFA?","option_a":"Robert Guérin","option_b":"Sepp Blatter","option_c":"Issa Hayatou","option_d":"Gianni Infantino","answer":"D","image":"https://cashrocket.maantechnology.com/","status":1,"created_at":"2022-11-09T04:45:39.000000Z","updated_at":"2022-11-09T04:45:39.000000Z"},{"id":5,"quiz_id":6,"question":"What is the name of this player?","option_a":"Maradona","option_b":"Pele","option_c":"Kaka","option_d":"Messi","answer":"B","image":"https://cashrocket.maantechnology.com/back-end/img/Question_image/16679692149653.jpg","status":1,"created_at":"2022-11-09T04:46:54.000000Z","updated_at":"2022-11-09T04:46:54.000000Z"},{"id":6,"quiz_id":6,"question":"What is the Full Form of FIFA?","option_a":"International Federation of Association Football","option_b":"Federation of International Football Association","option_c":"Football of International Federation Association","option_d":"None of the Above","answer":"A","image":"https://cashrocket.maantechnology.com/","status":1,"created_at":"2022-11-09T04:49:00.000000Z","updated_at":"2022-11-09T04:49:00.000000Z"},{"id":7,"quiz_id":6,"question":"In which country FIFA Headquarter is situated?","option_a":"Switzerland","option_b":"Canada","option_c":"Australia","option_d":"Pakistan","answer":"A","image":"https://cashrocket.maantechnology.com/","status":1,"created_at":"2022-11-09T04:50:12.000000Z","updated_at":"2022-11-09T04:50:12.000000Z"}]

class Quizzes {
  Quizzes({
      int? id, 
      int? categoryId, 
      String? name, 
      String? image, 
      int? paidStatus, 
      dynamic freeOrPaid, 
      int? rewardPoint, 
      int? retakePoint, 
      int? status, 
      String? createdAt, 
      String? updatedAt, 
      List<Questions>? questions,}){
    _id = id;
    _categoryId = categoryId;
    _name = name;
    _image = image;
    _paidStatus = paidStatus;
    _freeOrPaid = freeOrPaid;
    _rewardPoint = rewardPoint;
    _retakePoint = retakePoint;
    _status = status;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _questions = questions;
}

  Quizzes.fromJson(dynamic json) {
    _id = json['id'];
    _categoryId = json['category_id'];
    _name = json['name'];
    _image = json['image'];
    _paidStatus = json['paid_status'];
    _freeOrPaid = json['free_or_paid'];
    _rewardPoint = json['reward_point'];
    _retakePoint = json['retake_point'];
    _status = json['status'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    if (json['questions'] != null) {
      _questions = [];
      json['questions'].forEach((v) {
        _questions?.add(Questions.fromJson(v));
      });
    }
  }
  int? _id;
  int? _categoryId;
  String? _name;
  String? _image;
  int? _paidStatus;
  dynamic _freeOrPaid;
  int? _rewardPoint;
  int? _retakePoint;
  int? _status;
  String? _createdAt;
  String? _updatedAt;
  List<Questions>? _questions;

  int? get id => _id;
  int? get categoryId => _categoryId;
  String? get name => _name;
  String? get image => _image;
  int? get paidStatus => _paidStatus;
  dynamic get freeOrPaid => _freeOrPaid;
  int? get rewardPoint => _rewardPoint;
  int? get retakePoint => _retakePoint;
  int? get status => _status;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  List<Questions>? get questions => _questions;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['category_id'] = _categoryId;
    map['name'] = _name;
    map['image'] = _image;
    map['paid_status'] = _paidStatus;
    map['free_or_paid'] = _freeOrPaid;
    map['reward_point'] = _rewardPoint;
    map['retake_point'] = _retakePoint;
    map['status'] = _status;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    if (_questions != null) {
      map['questions'] = _questions?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 3
/// quiz_id : 6
/// question : "When did FIFA started?"
/// option_a : "1910"
/// option_b : "1920"
/// option_c : "1930"
/// option_d : "1940"
/// answer : "C"
/// image : "https://cashrocket.maantechnology.com/"
/// status : 1
/// created_at : "2022-11-09T04:44:05.000000Z"
/// updated_at : "2022-11-09T04:44:05.000000Z"

class Questions {
  Questions({
      int? id, 
      int? quizId, 
      String? question, 
      String? optionA, 
      String? optionB, 
      String? optionC, 
      String? optionD, 
      String? answer, 
      String? image, 
      int? status, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _quizId = quizId;
    _question = question;
    _optionA = optionA;
    _optionB = optionB;
    _optionC = optionC;
    _optionD = optionD;
    _answer = answer;
    _image = image;
    _status = status;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Questions.fromJson(dynamic json) {
    _id = json['id'];
    _quizId = json['quiz_id'];
    _question = json['question'];
    _optionA = json['option_a'];
    _optionB = json['option_b'];
    _optionC = json['option_c'];
    _optionD = json['option_d'];
    _answer = json['answer'];
    _image = json['image'];
    _status = json['status'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  int? _id;
  int? _quizId;
  String? _question;
  String? _optionA;
  String? _optionB;
  String? _optionC;
  String? _optionD;
  String? _answer;
  String? _image;
  int? _status;
  String? _createdAt;
  String? _updatedAt;

  int? get id => _id;
  int? get quizId => _quizId;
  String? get question => _question;
  String? get optionA => _optionA;
  String? get optionB => _optionB;
  String? get optionC => _optionC;
  String? get optionD => _optionD;
  String? get answer => _answer;
  String? get image => _image;
  int? get status => _status;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['quiz_id'] = _quizId;
    map['question'] = _question;
    map['option_a'] = _optionA;
    map['option_b'] = _optionB;
    map['option_c'] = _optionC;
    map['option_d'] = _optionD;
    map['answer'] = _answer;
    map['image'] = _image;
    map['status'] = _status;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}