extension StarRating on double {
  int toFiveStarRating() {
    return (this * 5).round();
  }
}