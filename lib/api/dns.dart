import 'package:VultrDash/api/model/dns.dart';

import 'api.dart';

class DNS extends API {
  Future<DomainsModel> getInfo() {
    return this.Get("/domains", null).then((value) => DomainsModel.fromJson(value));
  }

  Future<DomainModel> createDomain(CreateDomainModel param) {
    return this.Post("/domains", null, param.toJson()).then((value) => DomainModel.fromJson(value["domain"]));
  }

  Future<DomainModel> getDomain(String dnsDomain) {
    return this.Get("/domains/$dnsDomain", null).then((value) => DomainModel.fromJson(value["domain"]));
  }

  Future deleteDomain(String dnsDomain) {
    return this.Delete("/domains/$dnsDomain", null, null);
  }

  Future updateDomain(String dnsDomain, String dnsSec) {
    return this.Put("/domains/$dnsDomain", null, { "dns_sec": dnsSec });
  }

  Future<DomainSOAModel> getSOA(String dnsDomain) {
    return this.Get("/domains/$dnsDomain/soa", null).then((value) => DomainSOAModel.fromJson(value));
  }

  Future updateSOA(String dnsDomain, UpdateDomainSOAModel param) {
    return this.Post("/domains/$dnsDomain/detach", null, param.toJson());
  }

  Future<DomainSecsModel> getSecs(String dnsDomain) {
    return this.Get("/domains/$dnsDomain/dnssec", null).then((value) => DomainSecsModel.fromJson(value));
  }

  Future<DomainRecordModel> createRecord(String dnsDomain, CreateDomainRecordModel param) {
    return this.Post("/domains/$dnsDomain/records", null, param.toJson()).then((value) => DomainRecordModel.fromJson(value));
  }

  Future<DomainRecordsModel> getRecords(String dnsDomain) {
    return this.Get("/domains/$dnsDomain/records", null).then((value) => DomainRecordsModel.fromJson(value));
  }

  Future<DomainRecordModel> getRecord(String dnsDomain, String recordId) {
    return this.Get("/domains/$dnsDomain/records/$recordId", null).then((value) => DomainRecordModel.fromJson(value["record"]));
  }

  Future updateRecord(String dnsDomain, String recordId, UpdateDomainRecordModel param) {
    return this.Patch("/domains/$dnsDomain/records/$recordId", null, param.toJson());
  }

  Future deleteRecord(String dnsDomain, String recordId) {
    return this.Delete("/domains/$dnsDomain/records/$recordId", null, null);
  }
}