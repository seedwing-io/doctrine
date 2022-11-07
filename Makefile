test-osi: data/licenses/osi.rego data/licenses/not_osi.rego
	@$(call opa_test,test_*_osi*)

test-network: data/licenses/network_copyleft.rego
	@$(call opa_test,test_*_network*)

test-permissive: data/licenses/permissive.rego
	@$(call opa_test,test_*_permissive*)

test-public_domain: data/licenses/public_domain.rego
	@$(call opa_test,test_*_public_domain*)

test-strong_copyleft: data/licenses/strong_copyleft.rego
	@$(call opa_test,test_*_strong_copyleft*)

test-weak_copyleft: data/licenses/weak_copyleft.rego
	@$(call opa_test,test_*_weak_copyleft*)

test-all: data/licenses/all.rego
	@$(call opa_test,test_*_all*)

test: test-osi test-network test-permissive test-public_domain \
	test-strong_copyleft test-weak_copyleft test-all

define opa_test
	opa test $^ tests/ -r $1 -v
endef

osi.wasm: data/licenses/osi.rego data/licenses/not_osi.rego| build_dir
	@opa build -t wasm -e osi_policy/is_osi -e osi_policy/not_osi $^
	@$(call bundle_wasm,$@)

define bundle_wasm
	@tar -xf bundle.tar.gz /policy.wasm >/dev/null 2>&1
	@mv policy.wasm build/$1
	@${RM} bundle.tar.gz
endef

.PHONY: build_dir
build_dir:
	@mkdir -p build

.PHONY: clean
clean:
	@${RM} -rf build
