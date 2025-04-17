enum Filters {
  all('All', true),
  done('Done', false),
  notDone('Not Done', false);

  const Filters(
    this.label,
    this.selected,
  );
  final String label;
  final bool selected;
}
