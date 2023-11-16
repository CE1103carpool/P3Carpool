class LoginRespuesta {
  String? respuesta;
  String? error;

  LoginRespuesta({this.respuesta, this.error});

  LoginRespuesta.fromJson(Map<String, dynamic> json) {
    respuesta = json['respuesta'];
    error = json['error'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['respuesta'] = respuesta;
    data['error'] = error;
    return data;
  }
}
