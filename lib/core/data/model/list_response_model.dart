abstract interface class ListResponseModel<T> {
  const ListResponseModel(this.list);
  final List<T> list;
}
