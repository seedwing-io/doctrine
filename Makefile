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

license.wasm: \
	data/licenses/all.rego \
	data/licenses/network_copyleft.rego \
	data/licenses/not_osi.rego \
	data/licenses/osi.rego \
	data/licenses/permissive.rego  \
	data/licenses/public_domain.rego \
	data/licenses/strong_copyleft.rego \
	data/licenses/weak_copyleft.rego | build_dir
	@opa build -t wasm \
		-e all_policy/all \
		-e network_policy/is_network_copyleft \
		-e network_policy/network_copyleft \
		-e permissive_policy/is_permissive \
		-e permissive_policy/permissive \
		-e public_domain_policy/public_domain \
		-e public_domain_policy/is_public_domain \
		-e strong_copyleft_policy/is_strong_copyleft \
		-e strong_copyleft_policy/strong_copyleft \
		-e weak_copyleft_policy/is_weak_copyleft \
		-e weak_copyleft_policy/weak_copyleft \
		-e osi_policy/is_osi \
		-e osi_policy/osi \
		-e osi_policy/not_osi $^
	@tar -xf bundle.tar.gz /policy.wasm >/dev/null 2>&1
	@mv policy.wasm build/$@
	@${RM} bundle.tar.gz

.PHONY: build_dir
build_dir:
	@mkdir -p build

.PHONY: clean
clean:
	@${RM} -rf build
