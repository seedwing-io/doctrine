osi.wasm: data/licenses/osi.rego | build_dir
	opa build -t wasm -e licenses/is_osi $<
	@tar -xf bundle.tar.gz /policy.wasm >/dev/null 2>&1
	@mv policy.wasm build/$@
	@${RM} bundle.tar.gz

test-osi: data/licenses/osi.rego
	opa test $< tests/ -r test_osi* -v

.PHONY: build_dir
build_dir:
	@mkdir -p build

.PHONY: clean
clean:
	@${RM} -rf build
