# ADR-0001: Remediation of GCS Bucket CMEK & PII File Logging

* **Status:** Proposed by K-SCM Agent / Approved by Human Reviewer
* **Date:** 2026-08-29

## Context & Violations Remediated
During the static compliance scan of commit `HEAD`, the K-SCM Auditor identified:
1. Hardcoded secrets and unencrypted `/tmp/processed_users.txt` PII logging (GDPR Art 32).
2. Unencrypted GCS storage bucket missing `public_access_prevention = "enforced"` and CMEK encryption.

## Remediation Applied
* Replaced hardcoded credentials with Google Cloud Secret Manager client resolution.
* Removed raw disk writing in favor of structured OpenTelemetry logging with automated regex redacting.
* Updated `infra/main.tf` to enforce CMEK KMS key bindings and block public access.
