# K-SCM Mock Target Sandbox

[![Target Sandbox](https://img.shields.io/badge/Role-Target_Sandbox_Repository-orange)](https://github.com/kerdjou-tigroudja/k-scm-showcase)
[![Compliance Mesh](https://img.shields.io/badge/Audited_by-K--SCM_Sovereign_Mesh-blue)](https://github.com/kerdjou-tigroudja/k-scm-showcase)
[![License: Apache 2.0](https://img.shields.io/badge/License-Apache_2.0-green.svg)](https://opensource.org/licenses/Apache-2.0)

> **Simulated enterprise codebase and Terraform infrastructure containing intentional regulatory non-compliances (EU AI Act & GDPR) for evaluating and demonstrating the autonomous audit and GitOps remediation capabilities of K-SCM.**

---

## Purpose of this Repository

This repository acts as a public **sandbox target** for the **[K-SCM (Sovereign Compliance Mesh)](https://github.com/kerdjou-tigroudja/k-scm-showcase)** agent.

When K-SCM executes a compliance audit against this repository:
1. **Static Analysis & RAG Matching :** It detects non-compliant code patterns (in `app/main.py`) and IaC misconfigurations (in `infra/main.tf`).
2. **Architectural Decision Record (MADR) :** It generates a formal ADR in `docs/adr/` explaining the violated European article and the technical justification for the remediation.
3. **Human-in-the-Loop Pull Request :** It opens an isolated Draft Pull Request (e.g. `fix/compliance-madr-0001`) with surgical patches ready for peer review.

---

## Synthetic Non-Compliances Catalog

| File | Non-Compliance | Regulation & Article | Expected Remediation |
|---|---|---|---|
| `app/main.py` | Hardcoded secret keys & plaintext credentials | GDPR Art. 32 / ISO 27001 | Migrate to Google Secret Manager |
| `app/main.py` | Unencrypted PII file write (`/tmp/processed_users.txt`) | GDPR Art. 5(1)(f) & Art. 32 | Redact PII & route through secure telemetry |
| `app/main.py` | High-risk AI inference without audit logging / guardrails | EU AI Act Art. 14 & 15 | Add robust logging, schema validation & guardrails |
| `infra/main.tf` | GCS Bucket without CMEK encryption & `allUsers` IAM binding | GDPR Art. 32 / ANSSI SecNumCloud Baseline | Enforce CMEK KMS keys & public access prevention |
| `infra/main.tf` | Compute Firewall allowing `0.0.0.0/0` SSH access | CIS GCP Benchmark 3.6 | Restrict source CIDR to authorized IAP ranges |
| `infra/main.tf` | Vertex AI Dataset without CMEK encryption spec | EU AI Act Sovereign Infrastructure | Attach KMS customer-managed encryption key |

---

## Related Resources

* **K-SCM Showcase Engine :** [`kerdjou-tigroudja/k-scm-showcase`](https://github.com/kerdjou-tigroudja/k-scm-showcase)
* **Author Hub :** [https://kerdjou.dev](https://kerdjou.dev)
* **Author Contact :** [contact@kerdjou.dev](mailto:contact@kerdjou.dev)
