.PHONY: run
run:
	@echo "Running..."
	cd infra && terragrunt run-all apply
	@echo "Done."

.PHONY: destroy
destroy:
	@echo "Destroying..."
	cd infra && terragrunt run-all destroy
	@echo "Done."