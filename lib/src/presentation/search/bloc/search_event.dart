sealed class SearchEvent {}

class GetTransfers extends SearchEvent {}

class GetInvoices extends SearchEvent {}

class GetTransferByName extends SearchEvent {
  GetTransferByName({required this.name});

  final String name;
}
