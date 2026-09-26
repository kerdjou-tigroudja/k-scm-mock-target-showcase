# [ADR-0001] Remediation of Hardcoded Secrets and Insecure Storage Bucket

* **Status:** Accepted
* **Deciders:** K-SCM Sovereign Compliance Mesh, SecOps Reviewer
* **Date:** 2026-08-29
* **Compliance Tags:** `GDPR-ART-32`, `GDPR-ART-5`, `EU-AI-ACT-ART-15`

## Context and Problem Statement
Static analysis identified hardcoded secrets in `app/main.py` and missing CMEK encryption & public access prevention on GCS bucket in `infra/main.tf`.

## Decision Outcome
Remediated configuration by moving credentials to Secret Manager and enforcing CMEK encryption & `public_access_prevention = "enforced"`.
