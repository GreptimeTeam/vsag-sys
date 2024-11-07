
.PHONY: fmt
fmt:
	find src include -iname "*.h" -o -iname "*.cpp" | xargs clang-format -i
	cargo fmt

.PHONY: test
test:
	cargo test
