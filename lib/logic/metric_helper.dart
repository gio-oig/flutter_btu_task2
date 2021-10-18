class MetricHelper {
  convert(String? from, String? to, amount) {
    if (from != null && to != null) {
      var metrices = ["CM", "M", "KM"];
      var devide = metrices.indexOf(from) < metrices.indexOf(to) ? true : false;
      var result;

      var store = {
        "CMM": 100,
        "CMKM": 100000,
        "MKM": 1000,
      };

      var storeValue = store[from + to] ?? store[to + from];

      if (devide) {
        result = amount / storeValue;
      } else {
        result = amount * storeValue;
      }

      return result;
    }
  }
}
