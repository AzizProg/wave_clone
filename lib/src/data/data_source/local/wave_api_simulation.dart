import 'package:uuid/uuid.dart';

import 'package:wave_clone/src/core/enums/transaction_status_enums.dart';
import 'package:wave_clone/src/core/enums/transaction_type.dart';
import 'package:wave_clone/src/data/data_source/local/data_local.dart';
import 'package:wave_clone/src/data/model/transaction_model.dart';

class WaveApiSimulation extends DataLocal {
  @override
  Future<List<TransactionModel>> getTransaction() async {
    return [
      TransactionModel(
          id: const Uuid().v4(),
          balance: 51200,
          amount: 5000,
          senderName: "Lavigne",
          senderPhoneNumber: "07 47 31 20 60",
          receiverName: "",
          agentName: "",
          receiverPhoneNumber: "",
          date: "20 mars 2024 à 12:52",
          fee: 50,
          type: TransactionType.deposit,
          status: TransactionStatusEnums.success),


      TransactionModel(
          id: const Uuid().v4(),
          balance: 51200,
          amount: 1010,
          senderName: "Me",
          senderPhoneNumber: "",
          receiverName: "Kindo",
          receiverPhoneNumber: "07 84 21 14 98",
          agentName: "",
          date: "1 mars 2024 à 13:40",
          fee: 10,
          type: TransactionType.transfer,
          status: TransactionStatusEnums.success),
      TransactionModel(
          id: const Uuid().v4(),
          balance: 51200,
          amount: 20200,
          senderName: "Me",
          senderPhoneNumber: "",
          receiverName: "Christian",
          receiverPhoneNumber: "05 78 23 00 22",
          agentName: "",
          date: "1 mars 2024 à 13:39",
          fee: 200,
          type: TransactionType.transfer,
          status: TransactionStatusEnums.success),
      TransactionModel(
          id: const Uuid().v4(),
          balance: 51200,
          amount: 25720,
          senderName: "Ayité",
          senderPhoneNumber: "",
          receiverName: "Me",
          receiverPhoneNumber: "01 50 23 00 11",
          agentName: "",
          date: "1 mars 2024 à 13:39",
          fee: 385,
          type: TransactionType.deposit,
          status: TransactionStatusEnums.success),
      TransactionModel(
          id: const Uuid().v4(),
          balance: 51200,
          amount: 25720,
          senderName: "Me",
          senderPhoneNumber: "07 40 33 22 11",
          receiverName: "Abiola",
          receiverPhoneNumber: "",
          agentName: "",
          date: "11 février 2024 à 10:48",
          fee: 335,
          type: TransactionType.transfer,
          status: TransactionStatusEnums.success),
      TransactionModel(
          id: const Uuid().v4(),
          balance: 51200,
          amount: 4950,
          senderName: "Abdourahmane",
          senderPhoneNumber: "05 40 33 22 11",
          receiverName: "Me",
          receiverPhoneNumber: "",
          agentName: "",
          date: "11 février 2024 à 10:10",
          fee: 50,
          type: TransactionType.deposit,
          status: TransactionStatusEnums.success),
      TransactionModel(
          id: const Uuid().v4(),
          balance: 51200,
          amount: 2930,
          senderName: "Me",
          senderPhoneNumber: "",
          receiverName: "Cypher",
          receiverPhoneNumber: "01 20 29 76 95",
          agentName: "",
          date: "31 janvier 2024 à 14:32",
          fee: 30,
          type: TransactionType.transfer,
          status: TransactionStatusEnums.success),
      TransactionModel(
          id: const Uuid().v4(),
          balance: 51200,
          amount: 1010,
          senderName: "Moussa",
          senderPhoneNumber: "07 46 38 95 32",
          receiverName: "Me",
          receiverPhoneNumber: "",
          agentName: "",
          date: "31 février 2024 à 14:24",
          fee: 10,
          type: TransactionType.deposit,
          status: TransactionStatusEnums.success),

      //copy
      TransactionModel(
          id: const Uuid().v4(),
          balance: 51200,
          amount: 5000,
          senderName: "Dorgeles",
          senderPhoneNumber: "07 47 31 20 60",
          receiverName: "",
          agentName: "",
          receiverPhoneNumber: "",
          date: "20 mars 2024 à 12:52",
          fee: 50,
          type: TransactionType.deposit,
          status: TransactionStatusEnums.success),
      TransactionModel(
          id: const Uuid().v4(),
          balance: 51200,
          amount: 4500,
          senderName: "",
          senderPhoneNumber: "",
          receiverName: "Me",
          receiverPhoneNumber: "",
          agentName: "WAVE CLONE\n(A098_CI)",
          date: "1 mars 2024 à 13:52",
          fee: 0,
          type: TransactionType.withdraw,
          status: TransactionStatusEnums.success),
      TransactionModel(
          id: const Uuid().v4(),
          balance: 51200,
          amount: 1010,
          senderName: "Me",
          senderPhoneNumber: "",
          receiverName: "Josephine",
          receiverPhoneNumber: "07 84 21 14 98",
          agentName: "",
          date: "1 mars 2024 à 13:40",
          fee: 10,
          type: TransactionType.transfer,
          status: TransactionStatusEnums.success),
      TransactionModel(
          id: const Uuid().v4(),
          balance: 51200,
          amount: 20200,
          senderName: "Me",
          senderPhoneNumber: "",
          receiverName: "Mohamed",
          receiverPhoneNumber: "05 78 23 00 22",
          agentName: "",
          date: "1 mars 2024 à 13:39",
          fee: 200,
          type: TransactionType.transfer,
          status: TransactionStatusEnums.success),
      TransactionModel(
          id: const Uuid().v4(),
          balance: 31200,
          amount: 5000,
          senderName: "Kevin",
          senderPhoneNumber: "07 47 31 20 60",
          receiverName: "",
          agentName: "",
          receiverPhoneNumber: "",
          date: "20 mars 2024 à 12:52",
          fee: 50,
          type: TransactionType.deposit,
          status: TransactionStatusEnums.success),
    ];
  }
}
