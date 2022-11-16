import 'dart:convert';
import 'package:Batch_256/utilities/constants.dart';
import 'package:Batch_256/utilities/networking/networking_connector.dart';
import 'package:Batch_256/utilities/networking/networking_response.dart';
import 'package:flutter/foundation.dart';

class APIRepository2 {
  // semua request yg berhubungan dengan API
  //1. API untuk GET List users
  Future<NetworkingResponse> getListLokasi() {
    String url = API_BASE_URL_PROJECT;

    Map<String, String> headerRequest = {
      'X-Requested-With': 'XMLHttpRequest',
      'Content-Type': 'application/json',
    };

    return NetworkingConnector()
        .getRequest(url, END_POINT_LIST_LOKASI, headerRequest);
  }

  //2. Tambah level lokasi
  Future<NetworkingResponse> tambahNama(String name, String abbreviation) {
    String url = API_BASE_URL_PROJECTTAMBAH + END_POINT_TAMBAH_LOKASI;

    Map<String, String> headerRequest = {
      'X-Requested-With': 'XMLHttpRequest',
      'Content-Type': 'application/json',
    };
    final bodyRequest = jsonEncode(
        {"name": "$name", "abbreviation": "$abbreviation", "is_delete": false});
    return NetworkingConnector().postRequest(url, headerRequest, bodyRequest);
  }

  //3. filter level lokasi
  Future<NetworkingResponse> filterLokasi(
      String search, int order, int page, int pagesize) {
    String url = API_BASE_URL_PROJECTTAMBAH + END_POINT_CARI_LOKASI;

    Map<String, String> headerRequest = {
      "X-Requested-With": "XMLHttpRequest",
      "Content-Type": "application/json"
    };

    final bodyRequest = jsonEncode({"search": "${search.toString()}"});
    print('value searach : $search');
    return NetworkingConnector().postRequest(url, headerRequest, bodyRequest);
  }

  //4. GET BANK
  Future<NetworkingResponse> getBank() {
    String url = API_BASE_URL_PROJECTTAMBAH;

    Map<String, String> headerRequest = {
      'X-Requested-With': 'XMLHttpRequest',
      'Content-Type': 'application/json',
    };

    return NetworkingConnector().getRequest(url, END_POINT_BANK, headerRequest);
  }

  //5. Search Bank
  Future<NetworkingResponse> filterBank(
      String search, int page, int order, int pagesize, String sort) {
    String url = API_BASE_URL_PROJECT + END_POINT_FILTERBANK;

    Map<String, String> headerRequest = {
      'X-Requested-With': 'XMLHttpRequest',
      'Content-Type': 'application/json',
    };

    final bodyRequest = jsonEncode({
      "search": "${search.toString()}",
      "page": page,
      "order": order,
      "pagesize": pagesize,
      "sort": "${sort.toString()}",
    });
    print('value searach : $search');
    return NetworkingConnector().postRequest(url, headerRequest, bodyRequest);
  }

  Future<NetworkingResponse> tambahBank(String name, String va_code) {
    String url = API_BASE_URL_PROJECTTAMBAH + END_POINT_BANK;

    Map<String, String> headerRequest = {
      'X-Requested-With': 'XMLHttpRequest',
      'Content-Type': 'application/json',
    };
    final bodyRequest = jsonEncode({"name": "$name", "va_code": "$va_code"});
    return NetworkingConnector().postRequest(url, headerRequest, bodyRequest);
  }
}
