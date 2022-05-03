.PHONY: test coverage check fix format

test: get
	@dart test --concurrency=6 --platform vm --coverage=coverage test/all_test.dart

coverage: test
	@dart run coverage:format_coverage --lcov --in=coverage --out=coverage/lcov.info --packages=.packages --report-on=lib
	@genhtml -o coverage coverage/lcov.info

check:
	@dart format --set-exit-if-changed .
	@dart analyze --fatal-infos --fatal-warnings .
	@pana --json --no-warning --line-length 80

fix: format

format:
	@dart fix --apply .
	@dart format -l 80 --fix .
