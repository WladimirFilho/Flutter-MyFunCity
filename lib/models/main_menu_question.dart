class MainMenuQuestion {
  String question;
  int? vote;
  String picture;

  MainMenuQuestion({required this.question, required this.picture});

  int userVote(userVote) {
    return vote = userVote;
  }
}
