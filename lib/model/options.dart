class Options {
  String label;
  String? sublabel;
  String? description;
  int? value;
  String? unit;
  Function? onPressed;
  bool? last;

  Options({
    required this.label,
    this.sublabel,
    this.description,
    this.value,
    this.unit,
    this.onPressed,
    this.last,
  });
}
