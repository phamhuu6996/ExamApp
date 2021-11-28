abstract class ExamRepo{
  Future getExams(var data);
  Future publishExam(var key, var value);
}