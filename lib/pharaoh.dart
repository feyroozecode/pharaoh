/// Support for doing something awesome.
///
/// More dartdocs go here.
library;

import 'src/pharaoh_impl.dart';
import 'src/router/handler.dart';
import 'src/router/route.dart';
import 'src/router/router.dart';

export 'src/router/route.dart' hide RouteGroup;
export 'src/router/router.dart';
export 'src/router/handler.dart';
export 'src/middleware/request_logger.dart';
export 'src/http/request.dart';
export 'src/http/response.dart';
export 'src/shelf_interop/adapter.dart';
export 'src/shelf_interop/shelf.dart' show Body;
export 'src/router/route.dart' show Route;
export 'src/utils/exceptions.dart';

abstract class Pharaoh implements RoutePathDefinitionContract<Pharaoh> {
  factory Pharaoh() => $PharaohImpl();

  PharaohRouter router();

  List<Route> get routes;

  Uri get uri;

  Pharaoh group(String path, RouteHandler handler);

  Future<Pharaoh> listen({int port = 3000});

  Future<void> shutdown();
}
