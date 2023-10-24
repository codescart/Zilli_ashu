import 'package:zilli/Model/wannads_model.dart';
import 'package:zilli/Repositories/wannads_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

WannadsRepo _wannadsRepo = WannadsRepo();

final wannadsProvider = FutureProvider<List<WannadsModel>>((ref) async{
  return _wannadsRepo.getWannads();
});