extension EmptyOrNull on String {
  bool isEmptyOrNull() {
    return this == null || this.isEmpty;
  }

  bool isNotEmptyOrNull() {
    return !this.isEmptyOrNull();
  }
}