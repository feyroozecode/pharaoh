import 'package:pharaoh/pharaoh.dart';
import 'package:spookie/spookie.dart';

void main() {
  group('res.set(String headerKey, String headerValue)', () {
    test('should set the response header field', () async {
      final app = Pharaoh().use((req, res, next) {
        res = res.set("content-type", 'text/x-foo; charset=utf-8').end();
        next(res);
      });

      await (await request<Pharaoh>(app))
          .get('/')
          .contentType('text/x-foo; charset=utf-8')
          .status(200)
          .test();
    });
  });
}
