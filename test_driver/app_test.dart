// Importa la Flutter Driver API
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Counter App', () {
    // Primero, define los Finders. Podemos usarlos para localizar Widgets desde
    // la suite de test. Nota: los Strings proporcionados al método `byValueKey`
    // deben ser los mismos que los Strings utilizados para las Keys del paso 1.
    final counterTextFinder = find.byValueKey('counter');
    final buttonFinderIncrement = find.byValueKey('increment');
    final buttonFinderDecrement = find.byValueKey('decrement');
    final buttonFinderZero = find.byValueKey('zero');

    FlutterDriver driver;

    // Conéctate al driver de Flutter antes de ejecutar cualquier test
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    // Cierra la conexión con el driver después de que se hayan completado los tests
    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    test('starts at 0', () async {
      // Usa el método `driver.getText` para verificar que el contador comience en 0.
      expect(await driver.getText(counterTextFinder), "0");
    });

    test('increments the counter', () async {
      // Primero, realiza un tap sobre el botón
      await driver.tap(buttonFinderIncrement);

      // Luego, verifica que el contador de texto ha sido incrementado en 1
      expect(await driver.getText(counterTextFinder), "1");
    });

    test('decrements the counter', () async {
      // Primero, realiza un tap sobre el botón
      await driver.tap(buttonFinderDecrement);

      // Luego, verifica que el contador de texto ha sido incrementado en 1
      expect(await driver.getText(counterTextFinder), "0");
    });

    test('return 0 the counter', () async {
      // Primero, realiza un tap sobre el botón
      await driver.tap(buttonFinderIncrement);
      await driver.tap(buttonFinderIncrement);
      await driver.tap(buttonFinderIncrement);
      await driver.tap(buttonFinderIncrement);
      await driver.tap(buttonFinderIncrement);


      await driver.tap(buttonFinderZero);

      // Luego, verifica que el contador de texto ha sido incrementado en 1
      expect(await driver.getText(counterTextFinder), "0");
    });
  });
}
