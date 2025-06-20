function fn() {
  var env = karate.env || 'local';
  var config = {};

  // URL para el microservicio bp-dev-test
  config.port_bp_dev_test = 'http://bp-se-test-cabcd9b246a5.herokuapp.com';
  config.username = 'YordyHz';
  // Puedes agregar aquí otras variables de entorno si lo requieres

  return config;
}
