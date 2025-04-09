import 'package:native_toolchain_c/native_toolchain_c.dart';
import 'package:logging/logging.dart';
import 'package:native_assets_cli/native_assets_cli.dart';

const packageName = 'native_assets_package';

void main(List<String> args) async {
  await build(args, (input, builder) async {
    final packageName = input.packageName;
    final cbuilder = CBuilder.library(
      name: packageName,
      assetName: '${packageName}_bindings_generated.dart',
      sources: [
        'src/$packageName.c',
      ],
    );
    await cbuilder.run(
      input: input,
      output: builder,
      logger: Logger('')
        ..level = Level.ALL
        ..onRecord.listen((record) => print(record.message)),
    );
  });
}
